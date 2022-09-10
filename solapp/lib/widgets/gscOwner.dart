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
        children: const [
          Text('OWNER'),
          SizedBox(
            height: 2,
          ),
          Icon(Icons.eighteen_up_rating),
          SizedBox(
            height: 2,
          ),
          Text('GDSC-GTBIT'),
        ],
      ),
    );
  }
}
