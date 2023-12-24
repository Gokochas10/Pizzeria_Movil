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
    apiKey: 'AIzaSyD-fGyB13YNp4AU3dxLY9BmX3Df_g5YDvg',
    appId: '1:183435397986:web:7400b8ab0cd2536c077a3b',
    messagingSenderId: '183435397986',
    projectId: 'proyectovisuales-eb549',
    authDomain: 'proyectovisuales-eb549.firebaseapp.com',
    storageBucket: 'proyectovisuales-eb549.appspot.com',
    measurementId: 'G-KLX3HQ4W9B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_FxbbRK5ol9BsEyAviXeQKdf4JPn_JWw',
    appId: '1:183435397986:android:d8ae0bc544acbdc1077a3b',
    messagingSenderId: '183435397986',
    projectId: 'proyectovisuales-eb549',
    storageBucket: 'proyectovisuales-eb549.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYh5H6B0J3e5jWVUWRyheg_69JI5k4uG4',
    appId: '1:183435397986:ios:5e7081739ba6f37d077a3b',
    messagingSenderId: '183435397986',
    projectId: 'proyectovisuales-eb549',
    storageBucket: 'proyectovisuales-eb549.appspot.com',
    iosBundleId: 'com.example.proyectoRestaurante',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYh5H6B0J3e5jWVUWRyheg_69JI5k4uG4',
    appId: '1:183435397986:ios:dc19f766838143f1077a3b',
    messagingSenderId: '183435397986',
    projectId: 'proyectovisuales-eb549',
    storageBucket: 'proyectovisuales-eb549.appspot.com',
    iosBundleId: 'com.example.proyectoRestaurante.RunnerTests',
  );
}