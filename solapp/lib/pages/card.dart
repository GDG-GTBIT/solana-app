import 'package:flutter/material.dart';
import './menu.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import '../components/cardFunction/gridview_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textController = TextEditingController();

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
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
          ),
          AnimSearchBar(
            helpText: 'Filter',
            color: Color.fromARGB(255, 255, 255, 255),
            rtl: true,
            width: 300,
            style: TextStyle(
              color: Colors.black,
            ),
            textController: textController,
            closeSearchOnSuffixTap: true,
            prefixIcon: Icon(
              Icons.filter_alt_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            suffixIcon: Icon(
              Icons.filter_alt_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
          ),
          ElevatedButton(
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
          ),
        ],
      ),
    );
  }
}
