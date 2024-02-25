import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:solapp/screens/home.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:solapp/walletFunctions/home_page.dart';

import 'package:solapp/walletFunctions/loading_page.dart';
import 'package:solapp/walletFunctions/providers/wallet_services.dart';
import 'package:web3dart/web3dart.dart';
import '../model/nftataclass.dart';
import '../widgets/glsom_container.dart';
import '../screens/bid.dart';
import '../widgets/menu_button.dart';

class Menu extends ConsumerStatefulWidget {
  const Menu({super.key});

  @override
  ConsumerState<Menu> createState() => _MenuState();
}

class _MenuState extends ConsumerState<Menu> {
  final textController = TextEditingController();
  late Future<List<Data>> list;
  @override
  void initState() {
    super.initState();
    list = getdat();
  }

  Future<List<Data>> getdat() async {
    List<Data> ko = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final getting = await ref.get();
    final ro = getting.value as List<dynamic>;
    ro.forEach((e) {
      ko.add(Data(
          compiler: e['compiler'].toString(),
          date: e['date'].toString(),
          description: e['description'].toString(),
          dna: e['dna'].toString(),
          image: e['image'].toString(),
          edition: e['edition'].toString(),
          name: e['name'].toString(),
          value: e['value'].toString()));
    });
    // for (var e in ro) {
    //   ko.add(Data(
    //       compiler: e['compiler'].toString(),
    //       date: e['date'].toString(),
    //       description: e['description'].toString(),
    //       dna: e['dna'].toString(),
    //       image: e['image'].toString(),
    //       edition: e['edition'].toString(),
    //       name: e['name'].toString(),
    //       value: e['value'].toString()));
    // }

    return ko;
  }

  @override
  Widget build(BuildContext cont) {
    double balance = ref.watch(balanceProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.blueGrey,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: SizedBox(
                height: 15,
                child: Align(
                  alignment: Alignment.bottomRight,
                ),
              )),
          flexibleSpace: Stack(alignment: Alignment.bottomRight, children: [
            const Image(
              image: AssetImage(
                'assets/tigerdev.jpg',
              ),
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // margin: const EdgeInsets.only(top: 8),
                    width: 60,
                    height: 78,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 247, 169, 208),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.account_balance_wallet),
                          visualDensity: VisualDensity.compact,
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => HomePage()));
                            // Add your action here
                          },
                        ),
                        Text(
                          'Wallet',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        // margin: const EdgeInsets.only(top: 8),
                        width: 60,
                        height: 63,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(223, 143, 141, 143),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.shopping_cart_rounded),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => HomesPage(),
                                  ),
                                );
                                // Add your action here
                              },
                            ),
                            Text(
                              'owned',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        // margin: const EdgeInsets.only(top: 8),
                        width: 60,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 240, 240, 240),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              balance.toString().substring(0, 3),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Bal',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/p2.jpg'), fit: BoxFit.fill)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                FutureBuilder<List<Data>?>(
                  future: list,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final meow = snapshot.data!;

                      return GridView.count(
                        padding: const EdgeInsets.all(5),
                        childAspectRatio: (75 / 100),
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 7,
                        shrinkWrap: true,
                        children: meow.map((e) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(cont).push(MaterialPageRoute(
                                builder: (cont) => BidNft(
                                  compiler: e.compiler,
                                  date: e.date,
                                  description: e.description,
                                  dna: e.dna,
                                  edition: e.edition,
                                  image: e.image,
                                  name: e.name,
                                  value: e.value,
                                ),
                              ));
                            },
                            child: GlassContainer(
                              image: e.image,
                              name: e.name,
                              value: e.value,
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white60,
                        ),
                      );
                    }
                  },
                ),
                const Positioned(bottom: 15, child: MenuButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
