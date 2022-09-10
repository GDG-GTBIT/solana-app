// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'gscOwner.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'price.dart';
import './place_bid_bottom_sheet.dart';

class Bid extends StatelessWidget {
  final String value;
  final String name;
  const Bid({super.key, required this.name, required this.value});

  void openBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      backgroundColor: const Color.fromARGB(141, 255, 255, 255),
      context: ctx,
      builder: (ctx) {
        return const PlaceBidSheet();
      },
    );
  }

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
        Container(
          height: 45,
          width: 235,
          margin: const EdgeInsets.all(15),
          // decoration: const BoxDecoration(
          //   color: Color.fromARGB(255, 255, 255, 255),
          //   borderRadius: BorderRadius.all(Radius.circular(25)),
          // ),
          child: Center(
            child: Container(
              alignment: Alignment.bottomCenter,
              //margin: const EdgeInsets.all(30),
              //height: 65,
              //width: 290,
              child: SlideAction(
                elevation: 0,
                innerColor: Colors.white,
                outerColor: Colors.black,
                sliderButtonIcon: const Icon(
                  Icons.gavel_rounded,
                  size: 20.0,
                ),
                text: 'Place Bid',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                onSubmit: () => openBottomSheet(context),
                sliderRotate: false,
              ),
            ),
          ),
        ),
        //)
      ],
    );
  }
}
