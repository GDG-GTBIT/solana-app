import 'package:flutter/material.dart';
import 'castBottom.dart';
import 'price.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});
  void so() {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      color: Colors.black45,
      child: Scaffold(
        backgroundColor: Color.fromARGB(155, 255, 255, 255),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 65,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.back_hand_outlined),
                    SizedBox(
                      width: 300,
                    ),
                    Icon(Icons.wallet),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 25,
                  width: 250,
                  child: Text(
                    'loren #ipsum',
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Container(
                        height: 45,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 275,
            height: 270,
            alignment: Alignment.center,
            child: bid(),
          )
        ]),
      ),
    ));
  }
}
