import 'package:flutter/material.dart';
import '../pages/menu.dart';

class menu_button extends StatelessWidget {
  const menu_button({super.key});
  void openBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      backgroundColor: Color.fromARGB(100, 255, 255, 255),
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
        backgroundColor: Color.fromARGB(234, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () => openBottomSheet(context),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'Menu',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }
}
