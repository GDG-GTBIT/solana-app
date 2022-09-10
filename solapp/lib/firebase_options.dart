// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDnf6p1ZoH9kiSRRy1GFBSHL6lr6m8-hJ0',
    appId: '1:603996485236:web:6a6a6dd3afc321ee7d0321',
    messagingSenderId: '603996485236',
    projectId: 'testing-c8f6a',
    authDomain: 'testing-c8f6a.firebaseapp.com',
    databaseURL: 'https://testing-c8f6a-default-rtdb.firebaseio.com',
    storageBucket: 'testing-c8f6a.appspot.com',
    measurementId: 'G-CEWP36W3VQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYtlbySEJt0yFtfQgBdf2moxeLRYjAg6w',
    appId: '1:603996485236:android:d94fec2c844f48e47d0321',
    messagingSenderId: '603996485236',
    projectId: 'testing-c8f6a',
    databaseURL: 'https://testing-c8f6a-default-rtdb.firebaseio.com',
    storageBucket: 'testing-c8f6a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCevISIud5UI-03k8tPwnLBMUJ3vnejnXY',
    appId: '1:603996485236:ios:104b3e37c084a8877d0321',
    messagingSenderId: '603996485236',
    projectId: 'testing-c8f6a',
    databaseURL: 'https://testing-c8f6a-default-rtdb.firebaseio.com',
    storageBucket: 'testing-c8f6a.appspot.com',
    iosClientId: '603996485236-5kl9dh21891e2ph16tqu359ssl50pg7d.apps.googleusercontent.com',
    iosBundleId: 'com.example.solapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCevISIud5UI-03k8tPwnLBMUJ3vnejnXY',
    appId: '1:603996485236:ios:104b3e37c084a8877d0321',
    messagingSenderId: '603996485236',
    projectId: 'testing-c8f6a',
    databaseURL: 'https://testing-c8f6a-default-rtdb.firebaseio.com',
    storageBucket: 'testing-c8f6a.appspot.com',
    iosClientId: '603996485236-5kl9dh21891e2ph16tqu359ssl50pg7d.apps.googleusercontent.com',
    iosBundleId: 'com.example.solapp',
  );
}