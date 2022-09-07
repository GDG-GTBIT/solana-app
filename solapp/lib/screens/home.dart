import 'package:flutter/material.dart';
import 'package:solapp/screens/card.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});
  void so() {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/1jpeg.jpg',
                        ),
                        fit: BoxFit.fill)),
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
                            'Discover NFT Collections',
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
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 300,
                        child: const Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Explore the top collections of NFTs and buy and sell your NFTs as well',
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
                child: GestureDetector(
                  onTap: () {
                    const Menu();
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.fromLTRB(10, 15, 20, 20),
                    margin: const EdgeInsets.all(30),
                    height: 65,
                    width: 290,
                    decoration: const BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                        //more than 50% of width makes circle
                        ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 35,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))
                              //more than 50% of width makes circle
                              ),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                          width: 30.0,
                        ),
                        const Text(
                          'Start Experience',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
                width: 10.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
