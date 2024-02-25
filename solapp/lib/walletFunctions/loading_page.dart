import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solapp/screens/card.dart';
import 'package:solapp/screens/starting_screen.dart';
import 'package:solapp/walletFunctions/home_page.dart';
import 'package:solapp/walletFunctions/providers/wallet_services.dart';


class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  ConsumerState<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Wallet>(
      future: ref.watch(walletServicesProvider.notifier).intialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const Menu();
        }

        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text("Loading..."),
              ],
            ),
          ),
        );
      },
    );
  }
}
