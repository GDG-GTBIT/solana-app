import 'package:flutter/material.dart';

class price extends StatelessWidget {
  const price({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 55,
            width: 40,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '0.56',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Align(
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
