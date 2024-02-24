import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solapp/screens/about.dart';
import 'package:solapp/screens/card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:solapp/screens/mynft.dart';
import 'package:solapp/screens/wallet.dart';
import 'package:solapp/screens/wallet_home.dart';



class HomesPage extends StatefulWidget {
  @override
  _HomesPageState createState() => _HomesPageState();
}

class _HomesPageState extends State<HomesPage> {

  String? addres;
  String? privateKey;

  @override
  void initState() {
    super.initState();
    check();

  }

  Future<void> check() async {
    var pref = await SharedPreferences.getInstance();
    addres = pref.getString("address");
    privateKey = pref.getString("key");
    if(addres==null){
      final provider = Provider.of<wallet>(context,listen: false);
      provider.createWallet();
    }
    print(addres);
    print(privateKey);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text("Tiger Dev"),
        actions: [
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>WalletPage()));
              // Add your action here
            },
          ),
        ],
      ),
      body: MyNft(),
      bottomNavigationBar: GestureDetector(
        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_) => Menu()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100,10,20,10),
            child: Text("Marketplace",style: TextStyle(fontSize: 25,color: Colors.black),),
          ),
        ),
      ),
    );
  }
}

