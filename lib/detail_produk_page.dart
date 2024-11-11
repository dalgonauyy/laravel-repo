import 'package:flutter/material.dart';
import 'product.dart';

class DetailProdukPage extends StatelessWidget {
  final Product product;
  final Function(Product) onAddToCart;

  const DetailProdukPage({required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView( // Membungkus konten dalam SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Image.asset(product.imagePath, height: 250, fit: BoxFit.cover),

            const SizedBox(height: 16),

            // Nama dan Harga Produk
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rp ${product.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Deskripsi Produk
            const Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(product.description),
            const SizedBox(height: 16),

            // Ulasan dan Rating
            const Text(
              'Ulasan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 24),
                Text('${product.rating} (${product.reviews} reviews)'),
              ],
            ),

            const SizedBox(height: 16),

            // Menampilkan Ulasan dari Pelanggan
            ListView.builder(
              itemCount: product.reviewsList.length,
              shrinkWrap: true,  // Agar ListView tidak mengambil ruang yang berlebihan
              physics: NeverScrollableScrollPhysics(), // Mencegah scroll pada ListView, karena sudah ada scroll di luar
              itemBuilder: (context, index) {
                final review = product.reviewsList[index];
                return ListTile(
                  title: Text(review.username),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(review.rating, (index) => Icon(Icons.star, color: Colors.yellow, size: 16)),
                      ),
                      Text(review.comment),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Tombol Tambah ke Keranjang
            ElevatedButton(
              onPressed: () {
                // Menambahkan produk ke keranjang
                onAddToCart(product);
                // Menampilkan snackbar sebagai konfirmasi
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} ditambahkan ke keranjang!')),
                );
              },
              child: const Text('Masukkan ke Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}
