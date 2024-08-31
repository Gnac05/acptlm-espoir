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
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDA8AxRXYHG2dNEzeWZMcUXoc4cWFSWnlY',
    appId: '1:521771457822:android:f3fef568550c448cfa7d0f',
    messagingSenderId: '521771457822',
    projectId: "acptlm-espoir",
    storageBucket: "acptlm-espoir.appspot.com",
  );

  static const FirebaseOptions web = FirebaseOptions(
    authDomain: "acptlm-espoir.firebaseapp.com",
    apiKey: 'AIzaSyDA8AxRXYHG2dNEzeWZMcUXoc4cWFSWnlY',
    appId: '1:521771457822:android:f3fef568550c448cfa7d0f',
    messagingSenderId: '521771457822',
    projectId: "acptlm-espoir",
    storageBucket: "acptlm-espoir.appspot.com",
  );
}
