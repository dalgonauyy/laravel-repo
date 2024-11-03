import 'package:flutter/material.dart';

class PemesananPage extends StatelessWidget {
  const PemesananPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            // Menambahkan tombol navigasi kembali
            icon:
                const Icon(Icons.arrow_back, color: Colors.black), // Ikon putih
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
          title: const Text('Pemesanan'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Diproses', icon: Icon(Icons.access_time)), 
              Tab(text: 'Dikirim', icon: Icon(Icons.local_shipping)),
              Tab(text: 'Selesai', icon: Icon(Icons.check_circle)),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1: Barang Diproses
                  Center(child: Text('Barang diproses'),),

                  // Tab 2: Barang Dikirim
                  Center(child: Text('Belum ada pesanan dikirim')),

                  // Tab 3: Barang Selesai
                  Center(child: Text('Belum ada pesanan selesai')),
                ],
              ),
            ),
            // Rekomendasi Outfit
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Rekomendasi Outfit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildOutfitCard(
                            'assets/images/dress7.jpeg', 'Casual Style'),
                        _buildOutfitCard(
                            'assets/images/dress8.jpeg', 'Formal Style'),
                        // Tambahkan outfit card lainnya disini
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi yang dilakukan saat tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.black, // Warna latar belakang hitam
                      foregroundColor: Colors.white, // Warna teks putih
                    ),
                    child: const Text('Tampilkan Lebih Banyak Produk'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutfitCard(String imagePath, String tema) {
    return Card(
      child: Container(
        width: 200,
        child: Column(
          children: [
            Image.asset(imagePath, height: 200, width: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(tema, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
