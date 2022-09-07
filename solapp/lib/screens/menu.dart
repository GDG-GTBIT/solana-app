import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 40),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(0, 255, 255, 255),
        ),
        borderRadius: const BorderRadius.all( Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
            height: 450,
            decoration: BoxDecoration(
              color: const Color.fromARGB(225, 255, 255, 255),
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: ListView(
              children: const <Widget>[
                Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
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
                    padding: EdgeInsets.all(8.0),
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
                    padding: EdgeInsets.all(8.0),
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
                    padding: EdgeInsets.all(8.0),
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
                    padding: EdgeInsets.all(8.0),
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
                    padding: EdgeInsets.all(8.0),
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
         const Padding( 
            padding: EdgeInsets.only(
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
