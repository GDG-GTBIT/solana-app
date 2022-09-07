import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import './pages/card.dart';

void main() => runApp(mainpage());

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(),
        // body: GridView.count(
        //     crossAxisCount: 2,
        //     children: so.map((e) {
        //       return GlassmorphicFlexContainer(
        //         borderRadius: 2,
        //         linearGradient: LinearGradient(colors: [
        //           Color.fromARGB(180, 255, 255, 255),
        //           Color.fromARGB(100, 255, 255, 255)
        //         ]),
        //         border: 0,
        //         blur: 15,
        //         borderGradient: LinearGradient(colors: [
        //           Color.fromARGB(180, 255, 255, 255),
        //           Color.fromARGB(100, 255, 255, 255)
        //         ]),
        //         child: Text(
        //           e['text'],
        //           style: TextStyle(color: Colors.black),
        //         ),
        //       );
        //     }).toList()),
      ),
    );
  }
}
