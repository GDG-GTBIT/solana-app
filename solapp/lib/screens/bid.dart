import 'package:flutter/material.dart';
import '../widgets/castBottom.dart';

class BidNft extends StatefulWidget {
  final String compiler;
  final String date;
  final String description;
  final String dna;
  final String image;
  final String edition;
  final String name;
  final String value;
  const BidNft({
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.black54,
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Positioned(
          bottom: 300,
          child: SizedBox(
              height: 300,
              width: 300,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    image: DecorationImage(image: NetworkImage(widget.image)),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              )),
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
              Align(
                heightFactor: 3,
                child: SizedBox(
                  height: 25,
                  width: 250,
                  child: Text(
                    widget.dna,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 10),
                  ),
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
    );
  }
}
