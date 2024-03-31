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
    apiKey: 'AIzaSyDfYjMEo7KFrAPu6e7v8ucM9mynS84c_-4',
    appId: '1:244858591397:web:ef96063284fc12372a154c',
    messagingSenderId: '244858591397',
    projectId: 'bondng',
    authDomain: 'bondng.firebaseapp.com',
    storageBucket: 'bondng.appspot.com',
    measurementId: 'G-DMCJ5K0T7X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTKYuuLL8Lc9Uo-UUCPwd5cbsKZp-xMBs',
    appId: '1:244858591397:android:05f4ffb62a4201b42a154c',
    messagingSenderId: '244858591397',
    projectId: 'bondng',
    storageBucket: 'bondng.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8k1poI_Tl1HPol552k_4L2cVbTVUt__4',
    appId: '1:244858591397:ios:582fabbfb7ff219b2a154c',
    messagingSenderId: '244858591397',
    projectId: 'bondng',
    storageBucket: 'bondng.appspot.com',
    androidClientId: '244858591397-3295aohttkiu8gv4us0mh4e6de9iuko3.apps.googleusercontent.com',
    iosClientId: '244858591397-jnb717l4do8kiu8kt0bpfbgc0g0kcq08.apps.googleusercontent.com',
    iosBundleId: 'com.voxtron.taskmanagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8k1poI_Tl1HPol552k_4L2cVbTVUt__4',
    appId: '1:244858591397:ios:3e913db98a5e7a0f2a154c',
    messagingSenderId: '244858591397',
    projectId: 'bondng',
    storageBucket: 'bondng.appspot.com',
    androidClientId: '244858591397-3295aohttkiu8gv4us0mh4e6de9iuko3.apps.googleusercontent.com',
    iosClientId: '244858591397-blgt3hqd58mib6drt7ch6plug8cqfs6j.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskManagement.RunnerTests',
  );
}
