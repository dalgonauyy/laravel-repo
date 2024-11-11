import 'package:flutter/material.dart';
import 'product.dart';

class CheckoutPage extends StatelessWidget {
  final List<Product> cart;
  final double totalAmount;
  final Function(List<Product>) onOrderConfirmed;

  CheckoutPage({
    required this.cart,
    required this.totalAmount,
    required this.onOrderConfirmed,
  });

  // Fungsi untuk menampilkan dialog konfirmasi pemesanan
  void _showOrderConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Tidak bisa menutup dialog dengan mengklik di luar dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pemesanan Berhasil'),
          content: const Text('Proses pemesanan Anda berhasil.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Kirim produk yang dipesan ke halaman Pemesanan
                Navigator.of(context).pop(); // Menutup dialog
                onOrderConfirmed(cart); // Mengirim data pesanan
                Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detail Pesanan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final product = cart[index];
                  return ListTile(
                    leading: Image.asset(product.imagePath, width: 50, height: 50),
                    title: Text(product.name),
                    subtitle: Text('Rp ${product.price.toStringAsFixed(0)}'),
                  );
                },
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Pembayaran:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp ${totalAmount.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              items: [
                const DropdownMenuItem(child: Text("Transfer Bank"), value: "bank_transfer"),
                const DropdownMenuItem(child: Text("Kartu Kredit"), value: "credit_card"),
              ],
              onChanged: (value) {},
              hint: const Text("Pilih metode pembayaran"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Menampilkan dialog konfirmasi pemesanan
                _showOrderConfirmationDialog(context);
              },
              child: const Text('Konfirmasi Pesanan'),
            ),
          ],
        ),
      ),
    );
  }
}
