import 'package:flutter/material.dart';
import './menu.dart';
import '../components/cardFunction/gridview_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textController = TextEditingController();

  void openBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      backgroundColor: Color.fromARGB(100, 255, 255, 255),
      context: ctx,
      builder: (ctx) {
        return const Menu();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(232, 0, 0, 0),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          //upper half of the page
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.bottomLeft,
            height: 200,
            width: double.infinity,
            color: Color.fromARGB(173, 255, 255, 255),
            child: Row(
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
                          width: 5,
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
          ),

          //filter option
          Container(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 200,
              height: 40,
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Filter',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),

          //menu button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(234, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () => openBottomSheet(context),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
