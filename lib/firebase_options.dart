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
    apiKey: 'AIzaSyBY4UWH7Yxr9gLmAJKbyB7xR_4FxKmnaWg',
    appId: '1:448131904605:web:6c78ee9c470281b0c789b4',
    messagingSenderId: '448131904605',
    projectId: 'aero-drive-715bc',
    authDomain: 'aero-drive-715bc.firebaseapp.com',
    storageBucket: 'aero-drive-715bc.appspot.com',
    measurementId: 'G-Y3QYE8J4NP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKcb_8KpDBHWobm65WQGEMe7dvlpTdzM8',
    appId: '1:448131904605:android:18d7ebcbf8f9c930c789b4',
    messagingSenderId: '448131904605',
    projectId: 'aero-drive-715bc',
    storageBucket: 'aero-drive-715bc.appspot.com',
  );
}
