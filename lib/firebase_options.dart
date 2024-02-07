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
    apiKey: 'AIzaSyBVAACt0vi7pI4xiMoIY9GltrB9PKF-tw0',
    appId: '1:350379227143:web:2a3b0fe972fa75b36552a2',
    messagingSenderId: '350379227143',
    projectId: 'app-tasks-server',
    authDomain: 'app-tasks-server.firebaseapp.com',
    storageBucket: 'app-tasks-server.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbOIdDMe37TQ9QuUxDB1CWUXFvWA5XrHI',
    appId: '1:350379227143:android:6931133ecf0bb7086552a2',
    messagingSenderId: '350379227143',
    projectId: 'app-tasks-server',
    storageBucket: 'app-tasks-server.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDba4ZNoqYPr1y4t2mn1yjpu1irHRTDF08',
    appId: '1:350379227143:ios:6ab94f102576682e6552a2',
    messagingSenderId: '350379227143',
    projectId: 'app-tasks-server',
    storageBucket: 'app-tasks-server.appspot.com',
    iosBundleId: 'com.example.apiTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDba4ZNoqYPr1y4t2mn1yjpu1irHRTDF08',
    appId: '1:350379227143:ios:e66165bfd2353f1d6552a2',
    messagingSenderId: '350379227143',
    projectId: 'app-tasks-server',
    storageBucket: 'app-tasks-server.appspot.com',
    iosBundleId: 'com.example.apiTask.RunnerTests',
  );
}