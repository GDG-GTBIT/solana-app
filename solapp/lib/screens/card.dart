import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../widgets/menu_button.dart';
import '../model/nftataclass.dart';
import '../widgets/glsom_container.dart';
import '../screens/bid.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
    for (var e in ro) {
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

    return ko;
  }

  @override
  Widget build(BuildContext cont) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: SizedBox(
                height: 150,
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
              width: 1000,
            ),
            Positioned(
              bottom: 30,
              right: 30,
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
                      children: const [
                        Text(
                          '0.53',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Lorem Ipsum',
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        // margin: const EdgeInsets.only(top: 8),
                        width: 60,
                        height: 38,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(223, 143, 141, 143),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '0.53',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        // margin: const EdgeInsets.only(top: 8),
                        width: 60,
                        height: 38,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 240, 240, 240),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '0.53',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Lorem Ipsum',
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
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/p2.jpg'))),
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
                      return const CircularProgressIndicator(
                        color: Colors.white60,
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
