import 'package:flutter/material.dart';
import '../widgets/castBottom.dart';

class bid_nft extends StatefulWidget {
  const bid_nft({super.key});

  @override
  State<bid_nft> createState() => _bid_nftState();
}

class _bid_nftState extends State<bid_nft> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      child: Scaffold(
        backgroundColor: Color.fromARGB(155, 255, 255, 255),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  SizedBox(
                    height: 84,
                    child: Container(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.back_hand_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 65,
                ),
                Container(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.back_hand_outlined),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 25,
                  width: 250,
                  child: Text(
                    'loren #ipsum',
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Container(
                        height: 45,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 275,
            height: 270,
            alignment: Alignment.center,
            child: bid(),
          )
        ]),
      ),
    );
  }
}
