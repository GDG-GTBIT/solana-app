import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GridviewWidget extends StatelessWidget {
  List<Map<String, String>> ma = [
    {'title': 'text1'},
    {'title': 'text2'},
    {'title': 'text3'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(35),
      crossAxisSpacing: 50,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      children: ma.map((gs) {
        return GlassmorphicFlexContainer(
          borderRadius: 20,
          linearGradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
              Color.fromARGB(255, 255, 255, 255).withOpacity(0.05),
            ],
          ),
          border: 5,
          blur: 15,
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(0, 255, 255, 255).withOpacity(0.5),
              Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
          // child: Container(
          //   height: 55,
          //   width: 100,
          //   child: Text(
          //     gs['title'].toString(),
          //     style: TextStyle(
          //       color: Colors.white54,
          //       fontSize: 35,
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
        );
      }).toList(),
    );
  }
}
