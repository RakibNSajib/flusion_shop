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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD-hqO_qdrpDUQPvXCUjbCEWo27J_MYZTU',
    appId: '1:257759277792:web:db1bdf4782c73b7d219685',
    messagingSenderId: '257759277792',
    projectId: 'flutter2-e74d0',
    authDomain: 'flutter2-e74d0.firebaseapp.com',
    storageBucket: 'flutter2-e74d0.appspot.com',
    measurementId: 'G-4DHMLG2KS1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdA7JOk6tcLv-1wNkqgbhyhjWmYqN8UCg',
    appId: '1:257759277792:android:d952c0609f59ea5e219685',
    messagingSenderId: '257759277792',
    projectId: 'flutter2-e74d0',
    storageBucket: 'flutter2-e74d0.appspot.com',
  );
}
