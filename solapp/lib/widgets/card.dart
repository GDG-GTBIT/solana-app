import 'package:flutter/material.dart';
import 'upper_bar.dart';
import 'menu_button.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'glsom_container.dart';
import '../screens/bid.dart';

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
          bottom: PreferredSize(
              child: SizedBox(
                height: 150,
                child: Align(
                  alignment: Alignment.bottomRight,
                ),
              ),
              preferredSize: Size.fromHeight(150)),
          flexibleSpace: FittedBox(
            fit: BoxFit.fill,
            child: Stack(alignment: Alignment.bottomRight, children: [
              Image(
                image: AssetImage(
                  'assets/tigerdev.jpg',
                ),
              ),
              Positioned(
                bottom: 30,
                right: 30,
                child: Container(
                  height: 70,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(153, 255, 214, 64),
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              )
            ]),
          ),
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
                      builder: (context) => BidNft(),
                    ));
                  },
                  child: GlassmorphicFlexContainer(
                    borderRadius: 35,
                    linearGradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.1),
                        const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.05),
                      ],
                    ),
                    border: 20,
                    blur: 20,
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color.fromARGB(0, 255, 255, 255).withOpacity(0.5),
                      ],
                    ),
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
