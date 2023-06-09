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
    apiKey: 'AIzaSyD2WsRXGZqbTg6GXW6h9DkMryWzMOdU-5g',
    appId: '1:835867039271:web:26f3064e67737555eb6002',
    messagingSenderId: '835867039271',
    projectId: 'blooddonationapp-79b65',
    authDomain: 'blooddonationapp-79b65.firebaseapp.com',
    storageBucket: 'blooddonationapp-79b65.appspot.com',
    measurementId: 'G-WSKMV4P39P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxOA-Mg1kpqckDgasBeZZ5rc3eHSS7auw',
    appId: '1:835867039271:android:818c5e626a811588eb6002',
    messagingSenderId: '835867039271',
    projectId: 'blooddonationapp-79b65',
    storageBucket: 'blooddonationapp-79b65.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCizCrRplXxUdqYEc29K70okZOONCzZtqc',
    appId: '1:835867039271:ios:94cf9d8df06ef4a6eb6002',
    messagingSenderId: '835867039271',
    projectId: 'blooddonationapp-79b65',
    storageBucket: 'blooddonationapp-79b65.appspot.com',
    iosClientId: '835867039271-13m1vsgd2rv7nppamcjdpbug7dt8g7gc.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCrudExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCizCrRplXxUdqYEc29K70okZOONCzZtqc',
    appId: '1:835867039271:ios:18276cd9b60fb849eb6002',
    messagingSenderId: '835867039271',
    projectId: 'blooddonationapp-79b65',
    storageBucket: 'blooddonationapp-79b65.appspot.com',
    iosClientId: '835867039271-esq11epqrvbr43qni5mr5sf50oi7bkmt.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCrudExample.RunnerTests',
  );
}
