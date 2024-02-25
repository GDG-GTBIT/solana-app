import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceBidSheet extends StatefulWidget {
  final String disc;

  const PlaceBidSheet({super.key, required this.disc});

  @override
  State<PlaceBidSheet> createState() => _PlaceBidSheetState();
}

class _PlaceBidSheetState extends State<PlaceBidSheet> {
  final Uri _url = Uri.parse('https://hackerhouse-gdsc-gtbit.netlify.app/');

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(top: 40),
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(205, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView(children: [
                Text(
                  widget.disc,
                  style: GoogleFonts.kalam(color: Colors.black87),
                ),
              ]),
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
                text: '     Add to waiting list',
                alignment: Alignment.centerRight,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
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
