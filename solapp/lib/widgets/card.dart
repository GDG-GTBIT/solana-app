import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'menu_button.dart';
import '../model/nftataclass.dart';
import 'glsom_container.dart';
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

  void p() async {
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
  }

  @override
  Widget build(BuildContext context) {
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
              child: InkWell(
                onTap: () {
                  p();
                },
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.transparent),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: const Center(
                    child: Text(
                      'ABOUT',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black87,
          child: Stack(alignment: Alignment.bottomCenter, children: [
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BidNft(
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
                }),
            const Positioned(bottom: 15, child: MenuButton()),
          ]),
        ),
      ),
    );
  }
}
