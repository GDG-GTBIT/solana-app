import 'package:flutter/material.dart';
import 'package:solapp/screens/about.dart';
import 'menu_button.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'glsom_container.dart';
import '../screens/bid.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final textController = TextEditingController();
  List list = [
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
    {'text': 'play'},
  ];

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
                onTap: () {},
                child: Container(
                  child: Center(
                    child: Text(
                      'ABOUT',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.transparent),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
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
            GridView.count(
              padding: const EdgeInsets.all(5),
              childAspectRatio: (75 / 100),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 7,
              shrinkWrap: true,
              children: list.map((e) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BidNft(),
                    ));
                  },
                  child: Container(
                    child: const GlassContainer(),
                  ),
                );
              }).toList(),
            ),
            const Positioned(bottom: 15, child: MenuButton()),
          ]),
        ),
      ),
    );
  }
}
