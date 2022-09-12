import 'dart:ui';
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
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        elevation: 5,
        title: Text(
          widget.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/p2.jpg'), fit: BoxFit.fill)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Positioned(
                bottom: 270,
                child: SizedBox(
                  height: 340,
                  width: 340,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image:
                            DecorationImage(image: NetworkImage(widget.image)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                  ),
                )),
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
                    height: 18,
                  ),
                  Align(
                    heightFactor: 2,
                    child: SizedBox(
                      height: 25,
                      width: 250,
                      child: Text(
                        '#${widget.dna}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.white70),
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
              child: Bid(
                  name: widget.name,
                  value: widget.value,
                  disc: widget.description),
            )
          ]),
        ),
      ),
    );
  }
}
