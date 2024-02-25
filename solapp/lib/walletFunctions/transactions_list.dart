import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:solapp/walletFunctions/providers/wallet_services.dart';
import 'package:solapp/walletFunctions/utility.dart';
import 'package:solapp/walletFunctions/widgets/custom_color.dart';


import 'models/transaction.dart';

class TransactionsListWidget extends ConsumerStatefulWidget {
  const TransactionsListWidget({super.key});

  @override
  ConsumerState<TransactionsListWidget> createState() =>
      _TransactionsListWidgetState();
}

class _TransactionsListWidgetState
    extends ConsumerState<TransactionsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Card(
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Text(
              "Transaction History",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            transactionsList(),
          ],
        ),
      ),
    );
  }

  Widget transactionsList() {
    var transactions = ref.watch(transactionsProvider);
    var address = ref.watch(walletServicesProvider).creds!.address;

    if (transactions.isEmpty) {
      return const Center(child: Text("No transactions yet"));
    }

    return ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: List.generate(transactions.length, (index) {
          var transaction = transactions[index];

          Text? subtitle;
          var statusColor = transaction.type == TransactionType.pending
              ? Colors.yellow
              : transaction.from == address
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).extension<CustomColors>()!.color;

          subtitle = Text(
            "${transaction.formattedDate} • ${transaction.from == address ? "To" : "From"} ${shortenAddress(transaction.from == address ? transaction.to : transaction.from)}\n"
            "Hash: ${shortenAddress(transaction.hash)}",
          );

          return Padding(
            padding: EdgeInsets.all(2.w),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              title: Text(
                transaction.type == TransactionType.sent
                    ? "Sent"
                    : (transaction.type == TransactionType.received
                        ? "Received"
                        : "Pending"),
                style: TextStyle(color: statusColor),
              ),
              leading: Icon(
                transaction.type == TransactionType.sent
                    ? Icons.arrow_upward
                    : (transaction.type == TransactionType.received
                        ? Icons.arrow_downward
                        : Icons.pending),
                color: statusColor,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${{
                      TransactionType.pending,
                      TransactionType.sent
                    }.contains(transaction.type) ? '-' : '+'}${transaction.value}\nSEPETH",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: statusColor),
                  ),
                ],
              ),
              subtitle: subtitle,
              isThreeLine: true,
            ),
          );
        }));
  }
}
