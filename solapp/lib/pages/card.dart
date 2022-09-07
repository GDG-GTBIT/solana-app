import 'package:flutter/material.dart';
import '../widgets/upper_bar.dart';
import '../widgets/menu_button.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../widgets/glsom_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textController = TextEditingController();
  List so = [
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
    return Container(
      color: Color.fromARGB(232, 0, 0, 0),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          upper_bar(),
          //filter option
          SizedBox(height: 10),
          Container(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Filter',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 460,
                width: double.infinity,
                child: GridView.count(padding: EdgeInsets.all(5),childAspectRatio: (75/100),
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 7,
                  children: so.map((e) {
                    return GlassmorphicFlexContainer(
                      borderRadius: 35,
                      linearGradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.05),
                        ],
                      ),
                      border: 20,
                      blur: 20,
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(0, 255, 255, 255).withOpacity(0.5),
                          Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: glas_cont(),
                    );
                  }).toList(),
                ),
              ),
              Positioned(bottom: 15, child: menu_button())
            ],
          )
        ],
      ),
    );
  }
}
