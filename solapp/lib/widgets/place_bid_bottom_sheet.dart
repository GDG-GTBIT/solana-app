import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceBidSheet extends StatefulWidget {
  String disc;

  PlaceBidSheet({super.key, required this.disc});

  @override
  State<PlaceBidSheet> createState() => _PlaceBidSheetState();
}

class _PlaceBidSheetState extends State<PlaceBidSheet> {
  final Uri _url = Uri.parse(
      'https://gdsc.community.dev/guru-tegh-bahadur-institute-of-technology-delhi/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(205, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(widget.disc),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              child: SlideAction(
                height: 40,
                elevation: 0,
                innerColor: Colors.white,
                outerColor: Colors.black,
                sliderButtonIcon: const Icon(
                  Icons.shopping_cart,
                  size: 20.0,
                ),
                text: 'Buy NFT',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                onSubmit: () => _launchUrl(),
                sliderRotate: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
