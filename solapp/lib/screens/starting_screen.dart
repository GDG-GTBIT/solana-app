import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:solapp/screens/home.dart';
import 'package:solapp/walletFunctions/loading_page.dart';
import '../screens/card.dart';

class App extends StatelessWidget {
  const App({super.key});
  void so() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/ek tiger.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              child: Container(
                height: 450,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(230, 255, 255, 255),
                      Color.fromARGB(180, 255, 255, 255),
                      Color.fromARGB(0, 255, 255, 255)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120.0,
                      width: 150.0,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Roar for Conversation',
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                      width: 15.0,
                    ),
                    const SizedBox(
                      width: 300,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Buy NFTs,Save Malayan Tigers - Your Investment, Their Survival!',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
              width: 10.0,
            ),
            Positioned(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(30),
                height: 65,
                width: 290,
                child: SlideAction(
                  elevation: 0,
                  innerColor: Colors.white,
                  outerColor: Colors.black,
                  sliderButtonIcon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 25.0,
                  ),
                  text: 'Start Experience',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  onSubmit: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>  LoadingPage(),
                      ),
                    );
                  },
                  sliderRotate: false,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
              width: 10.0,
            )
          ],
        ),
      );
  }
}
