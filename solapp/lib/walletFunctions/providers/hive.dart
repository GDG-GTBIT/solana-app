import '../models/credentials.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'hive.g.dart';

@Riverpod(keepAlive: true)
Future<HiveDB> hiveDb(HiveDbRef ref) async {
  return HiveDB.create();
}

// I have no clue how to do this, but stackoverflow guy suggested this -_-
class HiveDB {
  late Box _credentialsBox;

  HiveDB._create();

  static Future<HiveDB> create() async {
    final component = HiveDB._create();
    await component._init();
    return component;
  }

  _init() async {
    _credentialsBox = await Hive.openBox('credentials');  
  }

  Future<void> saveCredentials(String privateKeyHex, String address) async {
    await _credentialsBox.put('privateKeyHex', privateKeyHex);
    await _credentialsBox.put('address', address);
  }

  Future<Credentials?> getCredentials() async {
    final privateKeyHex = await _credentialsBox.get('privateKeyHex');
    final address = await _credentialsBox.get('address');
    if (privateKeyHex == null || address == null) {
      return null;
    }
    return Credentials(
      privateKeyHex: privateKeyHex,
      address: address,
    );
  }

  Future<void> deleteCredentials() async {
    await _credentialsBox.delete('privateKeyHex');
    await _credentialsBox.delete('address');
  }
}