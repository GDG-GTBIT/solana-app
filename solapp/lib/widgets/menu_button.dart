import 'package:flutter/material.dart';
import '../widgets/menu.dart';
import '../screens/about.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});
  void openBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      backgroundColor: const Color.fromARGB(100, 255, 255, 255),
      context: ctx,
      builder: (ctx) {
        return const MenuCard();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(234, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AboutProject(),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'About Project',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
