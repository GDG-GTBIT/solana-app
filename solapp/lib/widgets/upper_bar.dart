import 'package:flutter/material.dart';

class upper_bar extends StatelessWidget {
  const upper_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(top: 20),
            height: 200,
            width: double.infinity,
            color: Color.fromARGB(173, 255, 255, 255),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //tiger image
                Container(
                  height: double.infinity,
                  child: Image.asset('nft11.jpg'),
                ),

                //content beside the tiger image
                Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'TIGER DEV',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Image.asset('Asset11.jpg'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 12,
                          width: 16,
                          child: Image.asset('image2.jpg'),
                        ),
                        Text(
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
                          margin: EdgeInsets.only(top: 20),
                          width: 60,
                          height: 65,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 247, 169, 208),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '0.53',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Lorem IPSUM',
                                style: TextStyle(
                                  fontSize: 7,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              width: 60,
                              height: 47,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(223, 143, 141, 143),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0.53',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Lorem IPSUM',
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              width: 60,
                              height: 47,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 240, 240, 240),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0.53',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Lorem IPSUM',
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
          )
;
  }
}