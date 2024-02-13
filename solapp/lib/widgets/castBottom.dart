import 'package:flutter/material.dart';
import 'gscOwner.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'price.dart';
import './place_bid_bottom_sheet.dart';

class Bid extends StatelessWidget {
  final String value;
  final String disc;
  final String name;

  const Bid(
      {Key? key, required this.name, required this.value, required this.disc})
      : super(key: key);

  void openBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      context: ctx,
      builder: (ctx) {
        return PlaceBidSheet(
          disc: disc,
        );
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
          height: 55,
          width: 220,
          margin: const EdgeInsets.all(10),
          child: Center(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: SlideAction(
                elevation: 0,
                innerColor: Colors.white,
                outerColor: Colors.black,
                sliderButtonIcon: const Icon(
                  Icons.gavel_rounded,
                  size: 17,
                ),
                text: 'Place Bid',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                onSubmit: () {
                  openBottomSheet(context);
                  return null;
                },
                sliderRotate: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
