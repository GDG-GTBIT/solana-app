import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web3dart/crypto.dart';

import 'package:web3dart/web3dart.dart' as web3;

class wallet extends ChangeNotifier {
  String rpurl = "https://sepolia.infura.io/v3/440b77cafb454e3f8a31ac48d1a49f88";
  String? address;
  String? private_key;

  wallet({
    this.address,
    this.private_key,
  });

  void createWallet() async {
    var rdm = Random.secure();
    web3.EthPrivateKey random = web3.EthPrivateKey.createRandom(rdm);
    var address = random.address;
    var privateKey = random.privateKey;
    var privatekey = bytesToHex(privateKey)
        .split('')
        .reversed
        .join('');
    if (privatekey.length > 64) {
      privatekey = privatekey.substring(0, 64);
    }
    privatekey = privatekey
        .split('')
        .reversed
        .join('');
    var address1 = address.hex;
    print(address1);
    notifyListeners();
    var pref = await SharedPreferences.getInstance();
    pref.setString("address", address1);
    pref.setString("key", privatekey);
  }
}
