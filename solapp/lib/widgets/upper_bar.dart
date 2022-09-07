import 'package:flutter/material.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: 200,
      width: double.infinity,
      color: const Color.fromARGB(173, 255, 255, 255),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //tiger image
          const SizedBox(
            height: double.infinity,
          ),
          Image.asset('nft11.jpg'),
          //content beside the tiger image
          Column(
            children: <Widget>[
              Container(
                width: 170,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      'TIGER DEV',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Image.asset('Asset11.jpg'),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset('image2.jpg'),
                  const Text(
                    'GDSC-GTBIT',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              //3 coloured containers
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // margin: const EdgeInsets.only(top: 8),
                    width: 60,
                    height: 38,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 247, 169, 208),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '0.53',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Lorem Ipsum',
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        // margin: const EdgeInsets.only(top: 8),
                        width: 60,
                        height: 38,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(223, 143, 141, 143),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '0.53',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // margin: const EdgeInsets.only(top: 8),
                        width: 60,
                        height: 38,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 240, 240, 240),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '0.53',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
