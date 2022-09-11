// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Owner extends StatelessWidget {
  const Owner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'OWNER',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            width: 20,
            height: 15,
            child: Image.asset('assets/image2.jpg'),
          ),
          const SizedBox(
            height: 2,
          ),
          const Text('GDSC-GTBIT',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white70,
              )),
        ],
      ),
    );
  }
}
