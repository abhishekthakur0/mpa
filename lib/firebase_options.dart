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
    apiKey: 'AIzaSyATNR785_oBmgw86OWVtwonpW7QlC_K_08',
    appId: '1:1060090885709:web:2f225e4675b2a419ee4e04',
    messagingSenderId: '1060090885709',
    projectId: 'music-playing-app',
    authDomain: 'music-playing-app.firebaseapp.com',
    storageBucket: 'music-playing-app.appspot.com',
    measurementId: 'G-BFMN28DM06',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYHQh0Zg5tMpJJBvvetZEC4ZPkX046t-U',
    appId: '1:1060090885709:android:302acfc84bc5e539ee4e04',
    messagingSenderId: '1060090885709',
    projectId: 'music-playing-app',
    storageBucket: 'music-playing-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhcadUWnCvqDpI04TakRujIuTZZXC8rIc',
    appId: '1:1060090885709:ios:78d4c5e074397479ee4e04',
    messagingSenderId: '1060090885709',
    projectId: 'music-playing-app',
    storageBucket: 'music-playing-app.appspot.com',
    iosBundleId: 'dev.abhishekthakur.mpa',
  );
}