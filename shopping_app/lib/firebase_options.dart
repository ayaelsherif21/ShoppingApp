import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return _android;
    } else if (kIsWeb) {
      return _web;  
    }
    throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
  }

  static const FirebaseOptions _android = FirebaseOptions(

  apiKey: "AIzaSyCUwSULsqUjSJAYDN1Skn6xW_7NL1v1gt8",
  authDomain: "shopping-app-561ce.firebaseapp.com",
  projectId: "shopping-app-561ce",
  storageBucket: "shopping-app-561ce.firebasestorage.app",
  messagingSenderId: "43507444456",
  appId: "1:43507444456:web:27ec55c49cc6272fe3775d",
  measurementId: "G-BEPNPTHJFQ"
  );



  static const FirebaseOptions _web = FirebaseOptions(
  apiKey: "AIzaSyCUwSULsqUjSJAYDN1Skn6xW_7NL1v1gt8",
  authDomain: "shopping-app-561ce.firebaseapp.com",
  projectId: "shopping-app-561ce",
  storageBucket: "shopping-app-561ce.firebasestorage.app",
  messagingSenderId: "43507444456",
  appId: "1:43507444456:web:27ec55c49cc6272fe3775d",
  measurementId: "G-BEPNPTHJFQ"
  );
}

