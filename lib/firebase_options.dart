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
    apiKey: 'AIzaSyCoTJaMhVQ-DEuUAYQybyWYULjm7umOkx0',
    appId: '1:239458715044:web:57514196de8633babfed31',
    messagingSenderId: '239458715044',
    projectId: 'movieapp2-1531b',
    authDomain: 'movieapp2-1531b.firebaseapp.com',
    storageBucket: 'movieapp2-1531b.appspot.com',
    measurementId: 'G-0L0T3X6YRB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpteYXAkCCQ8rtC4VgPj-sgir9XZN_bmU',
    appId: '1:239458715044:android:10a35cbeb5a25e7bbfed31',
    messagingSenderId: '239458715044',
    projectId: 'movieapp2-1531b',
    storageBucket: 'movieapp2-1531b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxrxc6rfeKlrl0yrEGQ7QSCWbOPfpbeYE',
    appId: '1:239458715044:ios:819aece5cbf824e0bfed31',
    messagingSenderId: '239458715044',
    projectId: 'movieapp2-1531b',
    storageBucket: 'movieapp2-1531b.appspot.com',
    iosClientId: '239458715044-glv8sd65642vbciejn5sv0o5q0glprdi.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieappCleanarchitrcture',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAxrxc6rfeKlrl0yrEGQ7QSCWbOPfpbeYE',
    appId: '1:239458715044:ios:e232c895c3a7120bbfed31',
    messagingSenderId: '239458715044',
    projectId: 'movieapp2-1531b',
    storageBucket: 'movieapp2-1531b.appspot.com',
    iosClientId: '239458715044-6ud64b10ptqh9damh3sirt013bbbbnco.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieappCleanarchitrcture.RunnerTests',
  );
}
