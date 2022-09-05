import '../components/menuFunction.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      padding: EdgeInsets.fromLTRB(10, 35, 10, 40),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(0, 255, 255, 255),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 30),
            height: 450,
            decoration: BoxDecoration(
              color: Color.fromARGB(213, 255, 255, 255),
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Trending',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Loral',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Loral',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Loral',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Loral',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Loral',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 3,
            ),
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
