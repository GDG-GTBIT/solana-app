import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:flutter/services.dart';
import 'package:solapp/walletFunctions/providers/wallet_services.dart';
import 'package:solapp/walletFunctions/transactions_list.dart';
import 'package:solapp/walletFunctions/utility.dart';
import 'package:solapp/walletFunctions/widgets/loading_button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        centerTitle: true,
      ),
      body: const HomeWidget(),
    );
  }
}

class HomeWidget extends ConsumerStatefulWidget {
  const HomeWidget({super.key});

  @override
  ConsumerState<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<HomeWidget> {
  @override
  void initState() {
    // Setup a loop

    // Future.delayed(const Duration(milliseconds: 0), () async {
    //   await ref.read(transactionsProvider.notifier).refreshTransactions();
    //   while (true) {
    //     await ref.read(refreshProvider.notifier).refresh();
    //     await Future.delayed(const Duration(seconds: 5));
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double balance = ref.watch(balanceProvider);
    String address = ref.watch(walletServicesProvider).creds!.address;
    bool refreshing = ref.watch(refreshProvider);

    return RefreshIndicator(
      onRefresh: ref.read(refreshProvider.notifier).refresh,
      child: ListView(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (refreshing) const LinearProgressIndicator(),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Address: ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(width: 1.w),
                    ElevatedButton(
                      onPressed: () async {
                        var addressHex =
                            ref.read(walletServicesProvider).creds!.address;
                        await Clipboard.setData(
                            ClipboardData(text: addressHex));
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Copied to clipboard"),
                          ),
                        );
                      },
                      child: Text(shortenAddress(address)),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Balance",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "${balance.toStringAsPrecision(5)} SEPETH",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 5.h,
                ),
                FilledButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(60.w, 5.h),
                    ),
                  ),
                  onPressed: sendClicked,
                  child: const Text("Send"),
                ),
                SizedBox(
                  height: 1.h,
                ),
                FilledButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(60.w, 5.h),
                    ),
                  ),
                  onPressed: receiveClicked,
                  child: const Text("Receive"),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const TransactionsListWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendClicked() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const SendModalWidget();
      },
    );
  }

  void receiveClicked() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Receive",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Scan the QR code to receive",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 3.h,
                ),
                PrettyQr(
                    roundEdges: true,
                    elementColor: Theme.of(context).colorScheme.onBackground,
                    size: 70.w,
                    data: ref.read(walletServicesProvider).creds!.address),
                TextButton(
                    onPressed: copyToClipboard,
                    child: const Text("Copy to clipboard"))
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> copyToClipboard() async {
    var addressHex = ref.read(walletServicesProvider).creds!.address;
    await Clipboard.setData(ClipboardData(text: addressHex));
    if (!mounted) return;
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Copied to clipboard"),
      ),
    );
  }
}

class SendModalWidget extends ConsumerStatefulWidget {
  const SendModalWidget({
    super.key,
  });

  @override
  ConsumerState<SendModalWidget> createState() => _SendModalWidgetState();
}

class _SendModalWidgetState extends ConsumerState<SendModalWidget> {
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;
  String _toAddress = "";
  double _amount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Send",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Chip(
                  label: Text("Balance: ${ref.watch(balanceProvider)}"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "To",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid address";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _toAddress = value!;
                  },
                  readOnly: _loading,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Amount",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid amount";
                    }
                    double? amount = double.tryParse(value);
                    if (amount == null) {
                      return "Please enter a valid amount";
                    }
                    if (amount > ref.read(balanceProvider)) {
                      return "Insufficient balance";
                    }
                    if (amount <= 0) {
                      return "Please enter a valid amount";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _amount = double.parse(newValue!);
                  },
                  readOnly: _loading,
                ),
                SizedBox(
                  height: 10.h,
                ),
                LoadingButton(
                  onClick: sendClicked,
                  label: "Send",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendClicked() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    setState(() {
      _loading = true;
    });

    await ref
        .read(transactionsProvider.notifier)
        .sendTransaction(_toAddress, _amount);

    if (!mounted) return;
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Transaction sent!"),
      ),
    );
  }
}
