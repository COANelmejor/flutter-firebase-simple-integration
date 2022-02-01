// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCgSoFRawHOCkVI--64XBdeQV5vAe41e6s',
    appId: '1:736611451535:web:e024b310fb80673d7926fa',
    messagingSenderId: '736611451535',
    projectId: 'fir-flutter-codelab-37733',
    authDomain: 'fir-flutter-codelab-37733.firebaseapp.com',
    storageBucket: 'fir-flutter-codelab-37733.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfqFbzjZQ8HoJ0WRSgC6yTpyltMAc1JwM',
    appId: '1:736611451535:android:cad4a4c570ba5e5c7926fa',
    messagingSenderId: '736611451535',
    projectId: 'fir-flutter-codelab-37733',
    storageBucket: 'fir-flutter-codelab-37733.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1qGqX-0mj5PzWJbRfSXRtHJ4cTld_KzE',
    appId: '1:736611451535:ios:7af32e9a26bb8e9b7926fa',
    messagingSenderId: '736611451535',
    projectId: 'fir-flutter-codelab-37733',
    storageBucket: 'fir-flutter-codelab-37733.appspot.com',
    iosClientId: '736611451535-4vf8gbuqhh2uu2pl764udedi80u7dfug.apps.googleusercontent.com',
    iosBundleId: 'com.example.gtkFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1qGqX-0mj5PzWJbRfSXRtHJ4cTld_KzE',
    appId: '1:736611451535:ios:7af32e9a26bb8e9b7926fa',
    messagingSenderId: '736611451535',
    projectId: 'fir-flutter-codelab-37733',
    storageBucket: 'fir-flutter-codelab-37733.appspot.com',
    iosClientId: '736611451535-4vf8gbuqhh2uu2pl764udedi80u7dfug.apps.googleusercontent.com',
    iosBundleId: 'com.example.gtkFlutter',
  );
}