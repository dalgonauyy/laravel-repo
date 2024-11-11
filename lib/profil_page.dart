// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/help_page.dart';
import 'package:myapp/login_page.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        // Agar konten bisa discroll jika melebihi layar
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian atas: Informasi pengguna dan foto
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.grey[200], // Background abu-abu muda
                child: FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return const Center(
                          child: Text('Error loading user data'));
                    }

                    var userData = snapshot.data;
                    // String nama = userData?['nama'] ?? 'Nama Tidak Diketahui';
                    String username = userData?['username'] ?? 'Pengguna';

                    return Column(
                      children: [
                        // Foto pengguna
                        Center(
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                                'assets/images/profil.jpeg'), // Ganti dengan path foto pengguna
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Informasi pengguna
           
                        Text('Username: $username'),
                        TextButton(
                          onPressed: () {
                            // Navigasi ke halaman ganti password
                            // Navigator.pushNamed(context, '/change_password');
                          },
                          child: const Text('Ganti Password'),
                        ),
                        const Text('Alamat: Jl. Contoh No. 123'),
                        const Text('Email: johndoe@example.com'),
                      ],
                    );
                  },
                ),
              ),
              // Tombol Help Center dan Keluar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                                                              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpPage()));
                        // Navigasi ke halaman Help Center
                        // Navigator.pushNamed(context, '/help_center');
                      },
                      child: const Text('Help Center'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigasi kembali ke HomePage
                                      Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.black, // Warna latar belakang tombol
                        foregroundColor: Colors.white, // Warna teks tombol
                      ),
                      child: const Text('Keluar'),
                    ),
                  ],
                ),
              ),
              // Bagian bawah: Produk yang telah dilihat
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Produk yang Telah Dilihat',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              // Container untuk produk yang telah dilihat
              Container(
                color: Colors.white, // Background putih
                // ... (Tambahkan widget untuk menampilkan produk yang telah dilihat di sini)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
