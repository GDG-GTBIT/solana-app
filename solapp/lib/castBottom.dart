import 'package:flutter/material.dart';
import 'gscOwner.dart';
import 'price.dart';

class bid extends StatelessWidget {
  const bid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              height: 150,
              width: 100,
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: price(),
            ),
            Column(
              children: [
                SizedBox(
                  height: 67,
                ),
                Container(
                  height: 85,
                  width: 100,
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: owner(),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            print('cool');
          },
          child: Container(
            height: 45,
            width: 235,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Center(
              child: Text(
                'PLACE BIDS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
