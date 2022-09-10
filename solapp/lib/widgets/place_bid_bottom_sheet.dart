import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceBidSheet extends StatefulWidget {
  const PlaceBidSheet({super.key});

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
    return Container(
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
              margin: EdgeInsets.only(top: 40),
              height: 120,
              decoration: BoxDecoration(
                color: Color.fromARGB(205, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20),
              child: SlideAction(
                height: 40,
                elevation: 0,
                innerColor: Colors.white,
                outerColor: Colors.black,
                sliderButtonIcon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20.0,
                ),
                text: 'Buy NFT',
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                onSubmit: () => _launchUrl(),
                sliderRotate: false,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _launchUrl();
                    },
                    child: Text(
                      'About GDSC',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    child: Image.asset('image2.jpg'),
                    height: 5,
                    width: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
