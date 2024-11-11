// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/beranda_page.dart';
import 'package:myapp/homescreen_page.dart';
import 'package:myapp/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      title: 'Nama Aplikasi Anda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user != null ? const LoginPage() : const HomePage(),
    );
  }
}
