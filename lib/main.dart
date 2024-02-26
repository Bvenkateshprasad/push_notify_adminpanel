import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notify_admin_panel/auth/Loginscreen.dart';
import 'package:notify_admin_panel/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyA5B9aW_5vL-j6cw5_szRhGFgnBkc6FYJY",
    authDomain: "notification-f9cc0.firebaseapp.com",
    projectId: "notification-f9cc0",
    storageBucket: "notification-f9cc0.appspot.com",
    messagingSenderId: "812804981607",
    appId: "1:812804981607:web:9b20458c5c23c2145525c2",
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Web Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser != null
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
