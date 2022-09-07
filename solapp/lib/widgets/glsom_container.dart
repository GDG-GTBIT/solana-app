import 'package:flutter/material.dart';

class glas_cont extends StatefulWidget {
  const glas_cont({super.key});

  @override
  State<glas_cont> createState() => _glas_contState();
}

class _glas_contState extends State<glas_cont> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 163,
            width: 150,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'lorean ipusum',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 180, 178, 178),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 20,
                width: 75,
              ),
              SizedBox(width: 22),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: Icon(
                  size: 15,
                  Icons.shopping_cart_rounded,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
