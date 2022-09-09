import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                child: Text('About'),
                onPressed: () {},
                backgroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
