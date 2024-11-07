import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCBC1yB7rhJEW6SMBW1BzDAbUwy7zS9u_4",
            authDomain: "dietetex-ite17h.firebaseapp.com",
            projectId: "dietetex-ite17h",
            storageBucket: "dietetex-ite17h.appspot.com",
            messagingSenderId: "472974310020",
            appId: "1:472974310020:web:8062b183f23aaf5bd2a0d1",
            measurementId: "G-PJ75YWH9LS"));
  } else {
    await Firebase.initializeApp();
  }
}
