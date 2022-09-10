import 'package:flutter/material.dart';
import 'package:solapp/screens/home.dart';
import '../widgets/castBottom.dart';

class BidNft extends StatefulWidget {
  String compiler;
  String date;
  String description;
  String dna;
  String image;
  String edition;
  String name;
  String value;
  BidNft({
    super.key,
    required this.image,
    required this.name,
    required this.value,
    required this.compiler,
    required this.date,
    required this.description,
    required this.dna,
    required this.edition,
  });

  @override
  State<BidNft> createState() => _BidNftState();
}

class _BidNftState extends State<BidNft> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Color.fromARGB(111, 255, 255, 255),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Positioned(
            bottom: 250,
            child: Container(
              height: 400,
              width: 320,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(widget.image),
              )),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: const [
                  SizedBox(
                    height: 85,
                    child: SizedBox(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.account_balance_wallet_outlined),
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
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                // const SizedBox(
                //   width: double.infinity,
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Icon(Icons.back_hand_outlined),
                //   ),
                // ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 25,
                  width: 250,
                  child: Text(
                    widget.dna,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 275,
            height: 270,
            alignment: Alignment.center,
            child: Bid(name: widget.name, value: widget.value),
          )
        ]),
      ),
    );
  }
}
