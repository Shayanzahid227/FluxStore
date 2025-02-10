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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAbGOsGSGqwGvYNCqdNjGvmbYgKbviFneY',
    appId: '1:722856349605:web:20e5f43abd61c8253b224c',
    messagingSenderId: '722856349605',
    projectId: 'fluxstore-3e3f4',
    authDomain: 'fluxstore-3e3f4.firebaseapp.com',
    storageBucket: 'fluxstore-3e3f4.firebasestorage.app',
    measurementId: 'G-L1NKFJVM1L',
    databaseURL: 'https://fluxstore-3e3f4-default-rtdb.firebaseio.com/',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAN23Emh6uQrw7ANHpc0yooH3aJ8u46ESQ',
    appId: '1:722856349605:android:00ebd3b5f74402973b224c',
    messagingSenderId: '722856349605',
    projectId: 'fluxstore-3e3f4',
    storageBucket: 'fluxstore-3e3f4.firebasestorage.app',
    databaseURL: 'https://fluxstore-3e3f4-default-rtdb.firebaseio.com/',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGoo6BHoiAwlth8AHv-56J8qhjhueyZ0w',
    appId: '1:722856349605:ios:39f545aca0c5473a3b224c',
    messagingSenderId: '722856349605',
    projectId: 'fluxstore-3e3f4',
    storageBucket: 'fluxstore-3e3f4.firebasestorage.app',
    iosBundleId: 'com.example.StudioFlex',
    databaseURL: 'https://fluxstore-3e3f4-default-rtdb.firebaseio.com/',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGoo6BHoiAwlth8AHv-56J8qhjhueyZ0w',
    appId: '1:722856349605:ios:39f545aca0c5473a3b224c',
    messagingSenderId: '722856349605',
    projectId: 'fluxstore-3e3f4',
    storageBucket: 'fluxstore-3e3f4.firebasestorage.app',
    iosBundleId: 'com.example.StudioFlex',
    databaseURL: 'https://fluxstore-3e3f4-default-rtdb.firebaseio.com/',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAbGOsGSGqwGvYNCqdNjGvmbYgKbviFneY',
    appId: '1:722856349605:web:801dd5df63ce4fd03b224c',
    messagingSenderId: '722856349605',
    projectId: 'fluxstore-3e3f4',
    authDomain: 'fluxstore-3e3f4.firebaseapp.com',
    storageBucket: 'fluxstore-3e3f4.firebasestorage.app',
    measurementId: 'G-T0KGMZ1K9J',
    databaseURL: 'https://fluxstore-3e3f4-default-rtdb.firebaseio.com/',
  );
}
