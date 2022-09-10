// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'gscOwner.dart';
import 'price.dart';

class Bid extends StatelessWidget {
  String value;
  String name;
  Bid({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 150,
              width: 100,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Price(name: name, value: value),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 67,
                ),
                Container(
                  height: 85,
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Owner(),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // print('cool');
          },
          child: Container(
            height: 45,
            width: 235,
            margin: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: const Center(
              child: Text(
                'PLACE BIDS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
