import 'dart:math';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web3dart/crypto.dart';

import 'package:web3dart/web3dart.dart' as web3;

class wallet extends ChangeNotifier {
  static const _address = "0x65057bCFb2008e4BD87596c2e1041B9926e94559";
  String rpurl =
      "https://sepolia.infura.io/v3/440b77cafb454e3f8a31ac48d1a49f88";
  String? address;
  String? private_key;

  wallet({
    this.address,
    this.private_key,
  });

  void createWallet() async {
    var rdm = Random.secure();
    web3.EthPrivateKey random = web3.EthPrivateKey.createRandom(rdm);
    var address = random.address;
    var privateKey = random.privateKey;
    var privatekey = bytesToHex(privateKey).split('').reversed.join('');
    if (privatekey.length > 64) {
      privatekey = privatekey.substring(0, 64);
    }
    privatekey = privatekey.split('').reversed.join('');
    var address1 = address.hex;
    print(address1);
    notifyListeners();
    var pref = await SharedPreferences.getInstance();
    pref.setString("address", address1);
    pref.setString("key", privatekey);
  }

  Future<double> getBalance() async {
    var pref = await SharedPreferences.getInstance();
    var privateKey = pref.getString("key");
    final client = web3.Web3Client(rpurl, Client());
    final credential = web3.EthPrivateKey.fromHex(privateKey!);
    final address = credential.address;
    final bal = await client.getBalance(address);
    print(bal.getInWei);
    double balance = bal.getInWei / BigInt.from(1000000000000000000);
    notifyListeners();
    return balance;
  }

  void sendTranscation(String add, String val) async {
    var pref = await SharedPreferences.getInstance();
    var privatekey = pref.getString("key");
    final client = web3.Web3Client(rpurl, Client());
    final credential = web3.EthPrivateKey.fromHex(privatekey!);
    final BigInt amt = BigInt.from(double.parse(val) * 1000000000000000000);
    var transaction = web3.Transaction(
      to: web3.EthereumAddress.fromHex(add),
      value: web3.EtherAmount.fromUnitAndValue(web3.EtherUnit.wei, amt),
    );
    final sign = await client.signTransaction(credential, transaction,
        chainId: 11155111);
    final result = await client.sendRawTransaction(sign);
    print(result);
    notifyListeners();
    client.dispose();
    getTranscation();
  }

  void getTranscation() async {
    var pref = await SharedPreferences.getInstance();
    var address = pref.getString("address");
    final apiKey =
        "E4hYtLfZbjCjqJ5zvYW2NfHOdU7LApdFudhlFklDjBzA7uQwtS295KinmH5T2pdh";
    final uri =
        'https://deep-index.moralis.io/api/v2/${address}/verbose?chain=sepolia';
    try {
      final response = await get(
        Uri.parse(uri),
        headers: {'accept': 'application/json', 'X-API-Key': apiKey},
      );
      if (response.statusCode == 200) {
        print("response:${response.body}");
        Map<String, dynamic> decode = jsonDecode(response.body);
        List<dynamic> r = decode["result"];
        print(r[0]["hash"]);
      } else {
        print("Request failed");
      }
    } catch (e) {
      print(e);
    }
  }
}
