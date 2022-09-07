import 'package:flutter/material.dart';

class GlassContainer extends StatefulWidget {
  const GlassContainer({super.key});

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 163,
            width: 150,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
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
                  color: const Color.fromARGB(255, 180, 178, 178),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 20,
                width: 75,
              ),
              const SizedBox(width: 22),
              const CircleAvatar(
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
