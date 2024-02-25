import 'package:flutter/material.dart';

class GlassContainer extends StatefulWidget {
  final String image;

  final String name;
  final String value;

  const GlassContainer({
    super.key,
    required this.image,
    required this.name,
    required this.value,
  });

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
            SizedBox(
              height: 200,
              width: 190,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.image)),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(30),
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
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    letterSpacing: 1.5,
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
                    width: 60,
                    child: Text(
                      '${widget.value}  ETH',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
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
