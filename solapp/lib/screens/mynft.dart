import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:solapp/screens/wallet.dart';
import '../model/nftataclass.dart';
import '../widgets/glsom_container.dart';
import '../screens/bid.dart';

class MyNft extends StatefulWidget {
  @override
  _MyNftState createState() => _MyNftState();
}

class _MyNftState extends State<MyNft> {
  late Future<List<Data>> list;

  Future<List<Data>> getdat() async {
    List<Data> ko = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final getting = await ref.get();
    final ro = getting.value as List<dynamic>;
    ro.forEach((e) {
      if (e["is_soled"] == true &&
          e['address'] == context.read<wallet>().address!) {
        ko.add(Data(
            compiler: e['compiler'].toString(),
            date: e['date'].toString(),
            description: e['description'].toString(),
            dna: e['dna'].toString(),
            image: e['image'].toString(),
            edition: e['edition'].toString(),
            name: e['name'].toString(),
            value: e['value'].toString()));
      }
    });
    return ko;
  }

  void initState() {
    super.initState();
    list = getdat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/p2.jpg'), fit: BoxFit.fill)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    FutureBuilder<List<Data>?>(
                      future: list,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
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
                                  Navigator.of(context).push(MaterialPageRoute(
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
                        } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                          return Center(
                            child: Text("No Nfts Bought"),
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
                    // const Positioned(bottom: 15, child: MenuButton()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
