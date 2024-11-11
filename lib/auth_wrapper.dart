// lib/auth_wrapper.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart'; // Pastikan mengimpor halaman Login yang sudah Anda buat

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Selamat datang!')),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Menampilkan loading indicator saat koneksi sedang berlangsung
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Jika ada data (snapshot.hasData), berarti pengguna sudah login
        if (snapshot.hasData) {
          return const HomePage(); // Tampilkan halaman utama
        }

        // Jika tidak ada data (snapshot.data == null), berarti pengguna belum login
        return const LoginPage(); // Tampilkan halaman login
      },
    );
  }
}
