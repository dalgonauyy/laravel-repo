// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCB7hH1pQl814PlBwFbEraera8jIvzkcjg',
    appId: "1:1047387499063:web:e53f251e6e33083f81edb2",
    messagingSenderId: '1047387499063',
    projectId: 'butikgbm',
    authDomain: 'butikgbm.firebaseapp.com',
    databaseURL: 'https://butikgbm-default-rtdb.firebaseio.com',
    storageBucket: 'butikgbm.firebasestorage.app',
    measurementId: 'G-SVT28XZL9T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCB7hH1pQl814PlBwFbEraera8jIvzkcjg',
    appId: "1:1047387499063:web:e53f251e6e33083f81edb2",
    messagingSenderId: '1047387499063',
    projectId: 'butikgbm',
    authDomain: 'butikgbm.firebaseapp.com',
    databaseURL: 'https://butikgbm-default-rtdb.firebaseio.com',
    storageBucket: 'butikgbm.firebasestorage.app',
    measurementId: 'G-SVT28XZL9T',
  );
}
