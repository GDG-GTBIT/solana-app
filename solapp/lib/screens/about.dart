import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutProject extends StatelessWidget {
  AboutProject({super.key});
  final Uri _url = Uri.parse(
      'https://gdsc.community.dev/guru-tegh-bahadur-institute-of-technology-delhi/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            
          ),
          backgroundColor: Colors.black,
        ),
      
      ),
    );
  }
}
