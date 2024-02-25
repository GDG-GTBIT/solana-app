import 'dart:math';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solapp/walletFunctions/constants.dart';
import 'package:solapp/walletFunctions/providers/dio.dart';
import 'package:solapp/walletFunctions/providers/hive.dart';

import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart' as web3;
import '../models/credentials.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

import '../models/transaction.dart';

part 'wallet_services.g.dart';

class Wallet {
  web3.Web3Client client;
  Credentials? creds;

  Wallet(this.client);

  void setCredentials(Credentials creds) {
    this.creds = creds;
  }
}

@Riverpod(keepAlive: true)
class WalletServices extends _$WalletServices {
  @override
  Wallet build() {
    return Wallet(web3.Web3Client(SEPOLIA_RPC_URL, Client()));
  }

  Future<Credentials> createWallet() async {
    var rng = Random.secure();
    var random = web3.EthPrivateKey.createRandom(rng);

    var address = random.address;
    var privateKey = random.privateKey;

    var privateKeyHex = bytesToHex(privateKey).split('').reversed.join('');

    // Making sure privateKeyHex has exactly 64 characters
    if (privateKeyHex.length > 64) {
      privateKeyHex = privateKeyHex.substring(0, 64);
    }
    privateKeyHex = privateKeyHex.split('').reversed.join('');
    var addressHex = address.hex;

    await (await ref.read(hiveDbProvider.future))
        .saveCredentials(privateKeyHex, addressHex);
    await ref.watch(balanceProvider.notifier).refreshBalance();

    return Credentials(privateKeyHex: privateKeyHex, address: addressHex);
  }

  Future<Wallet> intialize() async {
    var client = web3.Web3Client(SEPOLIA_RPC_URL, Client());

    var creds = await (await ref.read(hiveDbProvider.future)).getCredentials();
    creds ??= await createWallet();
    state = Wallet(client);
    state.setCredentials(creds);
    await ref.watch(balanceProvider.notifier).refreshBalance();
    loop();
    return state;
  }

  Future<void> loop() async {}
}

@Riverpod(keepAlive: true)
class Balance extends _$Balance {
  @override
  double build() {
    return 0.00;
  }

  Future<double> refreshBalance() async {
    Wallet wallet = ref.watch(walletServicesProvider);
    if (wallet.creds == null) {
      return 0.00;
    }
    final credentials = web3.EthPrivateKey.fromHex(wallet.creds!.privateKeyHex);
    final address = credentials.address;
    final val = await wallet.client.getBalance(address);
    state = val.getInWei / BigInt.from(1000000000000000000);
    return state;
  }
}

@Riverpod(keepAlive: true)
class Transactions extends _$Transactions {
  @override
  List<Transaction> build() {
    return [];
  }

  Future<void> sendTransaction(String toAdress, double value) async {
    Wallet wallet = ref.watch(walletServicesProvider);
    final credentials = web3.EthPrivateKey.fromHex(wallet.creds!.privateKeyHex);
    final BigInt amo = BigInt.from(value * 1000000000000000000);

    var transaction = web3.Transaction(
        to: web3.EthereumAddress.fromHex(toAdress),
        value: web3.EtherAmount.fromBigInt(web3.EtherUnit.wei, amo));
    final supply = await wallet.client
        .signTransaction(credentials, transaction, chainId: 11155111);
    String transactionHash = await wallet.client.sendRawTransaction(supply);
    state = List.from(state
      ..insert(
        0,
        Transaction(
            hash: transactionHash,
            from: wallet.creds!.address,
            to: toAdress,
            value: value,
            timestamp: DateTime.now(),
            type: TransactionType.pending),
      ));

    await ref.watch(balanceProvider.notifier).refreshBalance();
  }

  Future<void> refreshTransactions() async {
    Wallet wallet = ref.watch(walletServicesProvider);

    final url =
        'https://deep-index.moralis.io/api/v2/${wallet.creds!.address}/verbose?chain=sepolia';

    try {
      // Send the HTTP GET request with the required headers
      final response = await ref.read(dioProvider).get(
            url,
            options: Options(
              headers: {
                'accept': 'application/json',
                'X-API-Key': MORALIS_API_KEY,
              },
            ),
          );

      if (response.statusCode != 200) {
        state = [];
        return;
      }

      // Convert and return the response as a List of Transactions
      final data = response.data['result'];
      var pendingTransactions = state
          .where(
            (element) => element.type == TransactionType.pending,
          )
          .toList();
      var newTransactions = List<Transaction>.from(
        data.map(
          (transaction) => Transaction(
            hash: transaction['hash'],
            from: transaction['from_address'],
            to: transaction['to_address'],
            // Convert value from wei to ether
            value: BigInt.from(double.parse(transaction['value'])) /
                BigInt.from(1000000000000000000),
            timestamp: DateTime.parse(transaction['block_timestamp']),
            type: transaction['from_address'] == wallet.creds!.address
                ? TransactionType.sent
                : TransactionType.received,
          ),
        ),
      )..sort((a, b) => b.timestamp.compareTo(a.timestamp));

      var toRemove = <Transaction>[];
      // If pending transaction is now confirmed, remove it from the list
      for (var pendingTransaction in pendingTransactions) {
        for (var newTransaction in newTransactions) {
          if (pendingTransaction.hash == newTransaction.hash) {
            toRemove.add(pendingTransaction);
            break;
          }
        }
      }

      state = List.from(pendingTransactions
        ..removeWhere((element) => toRemove.contains(element))
        ..addAll(newTransactions));
    } catch (e) {
      // Rip
      print("Died lmao $e");
    }
  }
}

@Riverpod(keepAlive: true)
class Refresh extends _$Refresh {
  @override
  bool build() {
    return false;
  }

  Future<void> refresh() async {
    // Already refreshing
    if (state) return;

    var oldBalance = ref.read(balanceProvider);
    var newBalance = await ref.read(balanceProvider.notifier).refreshBalance();

    // If balance changed, refresh transactions
    // Compare if absolute value of difference is greater than 0.0001
    if ((newBalance - oldBalance).abs() > 0.001) {
      // Yes refreshing
      state = true;
      // Wait 5 seconds for transaction to register on the blockchain
      await Future.delayed(const Duration(seconds: 5));
      await ref.read(transactionsProvider.notifier).refreshTransactions();
    } else {
      // Wait for like at least 1 second to show the loading bar kekw
      await Future.delayed(const Duration(milliseconds: 500));
    }

    // No longer refreshing
    state = false;
  }
}
