// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:myapp/beranda_page.dart';
import 'package:myapp/checkout_page.dart';
import 'keranjang_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(
      {Key? key,
      required this.product,
      required this.index,
      required this.products})
      : super(key: key);

  final Map<String, dynamic> product;
  final int index;
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    // Data produk
    final selectedProduct = products[index];

    // final String productName = 'Dress Wanita';
    // final String imagePath =
    //     'assets/images/dressberanda1.jpeg'; // Ganti dengan path aset gambar Anda
    // final String description = 'Dress dengan nuansa elegan membuat  ';
    // final String price = 'Rp. 500.000';

    // Data ulasan
    final List<Map<String, String>> reviews = [
      {
        'name': 'Nama Pembeli 1',
        'review': 'Ulasan produk dari pembeli 1.',
      },
      {
        'name': 'Nama Pembeli 2',
        'review': 'Ulasan produk dari pembeli 2.',
      },
      // Tambahkan ulasan lainnya di sini
    ];
    // Data rating
    final double rating = 4.5; // Ganti dengan rating yang sesuai

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BerandaPage()));
          },
        ),
        title: const Text('Detail Produk'),
        actions: [],
        // ... (AppBar tetap sama)
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              selectedProduct['gambar'],
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    selectedProduct['nama'],
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    selectedProduct['deskripsi'],
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '${selectedProduct['harga']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutPage()));
                      // Aksi untuk tombol "Beli Sekarang"
                    },
                    child: const Text('Beli Sekarang'),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    // Tombol "Masukkan ke Keranjang"
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KeranjangPage()));
                    },
                    child: const Text('Masukkan ke Keranjang'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
