import 'package:flutter/material.dart';
import '../widgets/castBottom.dart';

class BidNft extends StatefulWidget {
  const BidNft({super.key});

  @override
  State<BidNft> createState() => _BidNftState();
}

class _BidNftState extends State<BidNft> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(155, 255, 255, 255),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: const [
                  SizedBox(
                    height: 84,
                    child: SizedBox(
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
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 65,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.back_hand_outlined),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 25,
                  width: 250,
                  child: Text(
                    'loren #ipsum',
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin:const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      Container(
                        height: 45,
                        width: 35,
                        decoration: const BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        width: 35,
                        decoration:const BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        width: 35,
                        decoration:const  BoxDecoration(
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
            child: const Bid(),
          )
        ]),
      ),
    );
  }
}
