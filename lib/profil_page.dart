import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        // Agar konten bisa discroll jika melebihi layar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian atas: Informasi pengguna dan foto
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200], // Background abu-abu muda
              child: Column(
                children: [
                  // Foto pengguna
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/profil.jpeg'), // Ganti dengan path foto pengguna
                  ),
                  const SizedBox(height: 16),
                  // Informasi pengguna
                  Text('Nama Anggota: John Doe',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Username: johndoe123'),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman ganti password
                      // Navigator.pushNamed(context, '/change_password');
                    },
                    child: const Text('Ganti Password'),
                  ),
                  Text('Alamat: Jl. Contoh No. 123'),
                  Text('Email: johndoe@example.com'),
                ],
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
                      // Navigasi ke halaman Help Center
                      // Navigator.pushNamed(context, '/help_center');
                    },
                    child: const Text('Help Center'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Logika untuk keluar dari aplikasi
                      // ...
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Warna tombol merah
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            // Container untuk produk yang telah dilihat
            Container(
              color: Colors.white, // Background putih
              // ... (Tambahkan widget untuk menampilkan produk yang telah dilihat di sini)
            ),
          ],
        ),
      ),
    );
  }
}
