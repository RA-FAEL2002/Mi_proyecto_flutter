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
    apiKey: 'AIzaSyCL052869wtDC74YBoQp9vGEjcJpxAJZFc',
    appId: '1:327924975710:web:0482a431e3238aa05f8ccf',
    messagingSenderId: '327924975710',
    projectId: 'flutter-proyect-ad22a',
    authDomain: 'flutter-proyect-ad22a.firebaseapp.com',
    storageBucket: 'flutter-proyect-ad22a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhdWzC48EOWolvnc_jy7e3a01rrjRLPSs',
    appId: '1:327924975710:android:9558676224015a6c5f8ccf',
    messagingSenderId: '327924975710',
    projectId: 'flutter-proyect-ad22a',
    storageBucket: 'flutter-proyect-ad22a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqUoUc-sBC3Hi1yN9zMagva4IYuuJPI5Q',
    appId: '1:327924975710:ios:5708c7f83c0018585f8ccf',
    messagingSenderId: '327924975710',
    projectId: 'flutter-proyect-ad22a',
    storageBucket: 'flutter-proyect-ad22a.appspot.com',
    iosClientId: '327924975710-qq8lff6q8pgam456ucme0316jnqbgvgm.apps.googleusercontent.com',
    iosBundleId: 'com.example.proyectoprincipal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAqUoUc-sBC3Hi1yN9zMagva4IYuuJPI5Q',
    appId: '1:327924975710:ios:d168c116353f55bb5f8ccf',
    messagingSenderId: '327924975710',
    projectId: 'flutter-proyect-ad22a',
    storageBucket: 'flutter-proyect-ad22a.appspot.com',
    iosClientId: '327924975710-bnogph2jr5g0eoh9g6ll8mkjhc289stq.apps.googleusercontent.com',
    iosBundleId: 'com.example.proyectoprincipal.RunnerTests',
  );
}