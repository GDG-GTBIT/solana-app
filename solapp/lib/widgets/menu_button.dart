import 'package:flutter/material.dart';
import '../screens/menu.dart';

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
        return const Menu();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(234, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () => openBottomSheet(context),
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Menu',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }
}
