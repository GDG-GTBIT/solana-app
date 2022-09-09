import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  const Price({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 3,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child:
                  CircleAvatar(backgroundImage: AssetImage('solana_icon.png')),
            ),
            height: 55,
            width: 40,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '0.56',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Loren ipsum',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
