import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  final String value;
  final String name;
  const Price({super.key, required this.name, required this.value});

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
            height: 55,
            width: 40,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Padding(
              padding: EdgeInsets.all(3.0),
              child:
                  CircleAvatar(backgroundImage: AssetImage('solana_icon.png')),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
