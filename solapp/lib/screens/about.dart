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
        backgroundColor: Colors.black87,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _launchUrl();
                },
                child: SizedBox(
                  height: 30,
                  width: 45,
                  child: Image.asset('assets/image2.jpg'),
                ),
              ),
              const Text(
                'About the Project',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: const [
                      Text(
                        'Malayan tigers are found in the subtropical jungles of peninsular Malaysia. Although they are acknowledged as the national animal of Malaysia, their numbers have dropped drastically over time to the point where they are exteinct. As of the year 2022, only 150 of the species are left, which is precisely why GDSC GTBIT chose to engage on this project. ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'You can buy NFTs that we have created to serve as your underlying assets. They are a type of digital collectible that can be bought, sold, or traded, and their value will only rise over time. A portion of the revenue will be given to charity.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    _launchUrl();
                  },
                  child: const Text(
                    'About GDSC',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
