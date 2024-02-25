import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:solapp/screens/wallet.dart';

class WalletPage extends StatefulWidget {
  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  var addres;
  var balance = 0.00;
  TextEditingController address = TextEditingController();
  TextEditingController value = TextEditingController();
  // List<dynamic> res=[];

  Future fetchData() async {
    var pref = await SharedPreferences.getInstance();
    var address = pref.getString("address");
    final apiKey =
        "E4hYtLfZbjCjqJ5zvYW2NfHOdU7LApdFudhlFklDjBzA7uQwtS295KinmH5T2pdh";
    final uri =
        'https://deep-index.moralis.io/api/v2/${address}/verbose?chain=sepolia';
    try {
      final response = await get(
        Uri.parse(uri),
        headers: {'accept': 'application/json', 'X-API-Key': apiKey},
      );
      if (response.statusCode == 200) {
        print(response.body);
        // await Future.delayed(Duration(seconds: 2));
        Map<String, dynamic> decode = jsonDecode(response.body);
        return decode["result"];
      } else {
        print("Request failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text("Your Wallet"),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get Balance : ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  var provider = Provider.of<wallet>(context, listen: false);
                  provider.getBalance().then((value) => setState(() {
                        print(value);
                        balance = value;
                      }));
                },
                icon: Icon(Icons.refresh_sharp),
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 19,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.currency_bitcoin_outlined,
                color: Colors.redAccent,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "$balance",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
            child: Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 12.0,
                      textStyle: TextStyle(color: Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 500,
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                // borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                                border: Border.all(
                                    color: Colors.black87, width: 10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: TextField(
                                    controller: address,
                                    decoration: InputDecoration(
                                        labelText: "Enter Receiver Address",
                                        hintText: "Address",
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: value,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        labelText: "Enter Amount",
                                        hintText: "Amount",
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 57,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        var provider = Provider.of<wallet>(
                                            context,
                                            listen: false);
                                        provider.sendTranscation(
                                            address.text, value.text);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 12.0,
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                      child: Icon(Icons.arrow_forward_outlined),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      child: Text(
                        "Send",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
            child: Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 12.0,
                      textStyle: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    var pref = await SharedPreferences.getInstance();
                    String address = pref.getString("address")!;
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 350,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                            // ),
                            child: Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 45, 0, 20),
                                    child: PrettyQr(
                                      data: address,
                                      size: 180,
                                      roundEdges: true,
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      final SharedPreferences pref =
                                          await SharedPreferences.getInstance();
                                      final address = pref.getString("address");
                                      print(address);
                                      Clipboard.setData(
                                          ClipboardData(text: address!));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Copied to Clipboard : ${address}")));
                                    },
                                    child: Center(
                                        child: Text(
                                      "Click to Copy",
                                      style: TextStyle(fontSize: 15),
                                    )))
                              ],
                            ),
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      child: Text(
                        "Receive",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 29,
              ),
              Text(
                "Recent Transcation",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 180,
            width: 320,
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(10)),
            child: FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.none) {
                    return Center(
                        child: Text(
                      "No Transcation made",
                    ));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Failed to load data"),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                "To: ${snapshot.data[index]["to_address"]}"),
                            subtitle: Text(
                                "From: ${snapshot.data[index]['from_address']}"),
                            trailing: (addres ==
                                    snapshot.data[index]["from_address"])
                                ? Text(
                                    "- ${int.parse(snapshot.data[index]["value"]) / 1000000000000000000} ETH",
                                    style: TextStyle(color: Colors.redAccent),
                                  )
                                : Text(
                                    "+ ${int.parse(snapshot.data[index]["value"]) / 1000000000000000000} ETH",
                                    style: TextStyle(color: Colors.green),
                                  ),
                            // Add other properties or widgets as needed for each tile
                          );
                        });
                  }
                }),

            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          )
        ],
      ),
    );
  }
}
