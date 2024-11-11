// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:myapp/notifikasi_page.dart';
import 'package:myapp/pesan_page.dart';
import 'package:myapp/profil_page.dart';
import 'detail_produk_page.dart';
import 'keranjang_page.dart';
import 'pemesanan_page.dart'; // Import halaman Pemesanan
import 'profile_page.dart'; // Import halaman Profil
import 'product.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<Product> products = [
    Product(
      name: 'Dress Casual',
      imagePath: 'assets/images/dress7.jpeg',
      price: 500000,
      description: 'Casual dress, perfect for daily wear, made from soft cotton material, breathable and comfortable for all-day wear.',
      rating: 4,
      reviews: 23,
      reviewsList: [
        Review(username: 'Alice', rating: 5, comment: 'Love it! So comfortable and stylish.'),
        Review(username: 'Bob', rating: 4, comment: 'Great dress for casual wear, but I wish the fabric was a bit thicker.'),
        Review(username: 'Carla', rating: 3, comment: 'The dress is nice but the size was a bit off for me.')
      ]
    ),
    Product(
      name: 'Dress Formal',
      imagePath: 'assets/images/dress8.jpeg',
      price: 750000,
      description: 'Elegant dress for formal events, made from satin fabric that shines beautifully. Perfect for weddings or evening parties.',
      rating: 5,
      reviews: 12,
      reviewsList: [
        Review(username: 'David', rating: 5, comment: 'Absolutely stunning! Fits perfectly and looks amazing at night events.'),
        Review(username: 'Emma', rating: 5, comment: 'This dress was a showstopper at the gala I attended! Highly recommend!'),
      ]
    ),
  ];

  List<Product> cart = [];

  void addToCart(Product product) {
    setState(() {
      cart.add(product);
    });
  }

  void _onCheckout(List<Product> cart) {
    setState(() {
      this.cart.clear(); // Menghapus semua produk dari keranjang setelah checkout
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        actions: [
          
          // Ikon Notifikasi
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
                                                                         Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));

              // Tindakan untuk membuka halaman notifikasi
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Notifikasi')));
            },
          ),
          // Ikon Pesan
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
                                                                           Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessagePage()));
              // Tindakan untuk membuka halaman pesan
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pesan')));
            },
          ),
          // Ikon Pemesanan
          IconButton(
            icon: const Icon(Icons.list_alt),
            onPressed: () {
              // Navigasi ke halaman pemesanan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PemesananPage(orders: [],), // Ganti dengan halaman Pemesanan Anda
                ),
              );
            },
          ),
          // Ikon Keranjang
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigasi ke halaman keranjang
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KeranjangPage(cart: cart, onCheckout: _onCheckout), // Ganti dengan halaman Keranjang Anda
                ), //MatwrialPageRoute
              );
            },
          ),
          // Ikon Profil
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Navigasi ke halaman profil
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilPage(), // Ganti dengan halaman Profil Anda
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              // Navigasi ke halaman detail produk saat produk ditekan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProdukPage(
                    product: product,
                    onAddToCart: addToCart,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(product.imagePath, height: 120, fit: BoxFit.cover),
                  Text(product.name),
                  Text('Rp ${product.price.toStringAsFixed(0)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
