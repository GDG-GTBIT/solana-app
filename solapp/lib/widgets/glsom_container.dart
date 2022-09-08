import 'package:flutter/material.dart';

class GlassContainer extends StatefulWidget {
  const GlassContainer({super.key});

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 190,
                width: 180,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FittedBox(
              fit: BoxFit.fill,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: const Text(
                  'Lorem Ipsum',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.fill,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8, top: 2),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 180, 178, 178),
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 25,
                    width: 75,
                    child: const Text(
                      'Price 00ETH',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 22),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.black,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Icon(
                        size: 15,
                        Icons.shopping_cart_rounded,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
