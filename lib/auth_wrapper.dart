// lib/auth_wrapper.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart'; // Pastikan mengimpor halaman Login yang sudah Anda buat

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Selamat datang!')),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Menampilkan loading indicator saat koneksi sedang berlangsung
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Jika ada data (snapshot.hasData), berarti pengguna sudah login
        if (snapshot.hasData) {
          return HomePage(); // Tampilkan halaman utama
        }

        // Jika tidak ada data (snapshot.data == null), berarti pengguna belum login
        return LoginPage(); // Tampilkan halaman login
      },
    );
  }
}
