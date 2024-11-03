import 'package:flutter/material.dart';
import 'package:myapp/detail_produk_page.dart';
import 'package:myapp/keranjang_page.dart';
import 'package:myapp/notifikasi_page.dart';
import 'package:myapp/pesan_page.dart';
import 'package:myapp/profil_page.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<Map<String, dynamic>> products = [
    {
      'gambar': 'assets/images/dressberanda1.jpeg',
      'nama': 'Dress Elegan',
      'deskripsi': 'Dress dengan nuansa elegan membuat 1',
      'harga': 'Rp 500.000',
    },
    {
      'gambar': 'assets/images/dressberanda2.jpeg',
      'nama': 'Long Dress',
      'deskripsi': 'Dress dengan nuansa elegan membuat 2',
      'harga': 'Rp 300.000',
    },
    {
      'gambar': 'assets/images/dressberanda3.jpeg',
      'nama': 'Blouse Modern',
      'deskripsi': 'Dress dengan nuansa elegan membuat 3',
      'harga': 'Rp 180.000',
    },
    {
      'gambar': 'assets/images/dress8.jpeg',
      'nama': 'Dress',
      'deskripsi': 'Dress dengan nuansa elegan membuat 4',
      'harga': 'Rp 150.000',
    },
    // ... tambahkan data produk lainnya
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glam Boutique'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotifikasiPage()));
              // Navigator.pushNamed(context, route)
              // Aksi saat ikon notifikasi ditekan
            },
          ),
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PesanPage()));
              // Aksi saat ikon pesan ditekan
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KeranjangPage()));
              // Aksi saat ikon keranjang ditekan
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilPage()));
              // Aksi saat ikon profil ditekan
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Banner Iklan
          Image.asset(
            'assets/images/banner.jpeg', // Ganti dengan path gambar banner Anda
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          // Daftar Produk
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Koleksi Terbaru',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return _buildProductItem(
                        context, index, products[index], products);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index,
      Map<String, dynamic> product, List<Map<String, dynamic>> products) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductPage(product: product, index: index, products: products),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product['gambar'],
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['nama'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(product['harga']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
