import 'package:flutter/material.dart';

class owner extends StatelessWidget {
  const owner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('OWNER'),
          SizedBox(
            height: 2,
          ),
          Icon(Icons.eighteen_up_rating),
          SizedBox(
            height: 2,
          ),
          Text('name'),
        ],
      ),
    );
  }
}
