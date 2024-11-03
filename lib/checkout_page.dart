import 'package:flutter/material.dart';
import 'package:myapp/pesananberhasil_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        // Agar konten dapat discroll jika melebihi tinggi layar
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Alamat Pengiriman
            Text(
              'Alamat Pengiriman',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Nama Penerima: Karina Darmawati'),
            Text('Jln. Mawar no.5, Jakarta Selatan'),
            Text('Nomor Telepon: 081234567890'),
            SizedBox(height: 20),

            // Opsi Pengiriman
            Text(
              'Opsi Pengiriman',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('JNE Reguler - Rp18.000'),
            SizedBox(height: 20),

            // Detail Pesanan
            Text(
              'Detail Pesanan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:492085114.
                  'assets/images/dressberanda1.jpeg', // Ganti dengan URL gambar produk
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Long White Dress',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Harga: Rp500.000'),
                      Text('Jumlah: 1'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Rincian Pembayaran
            Text(
              'Rincian Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Subtotal: Rp500.000'),
            Text('Ongkos Kirim: Rp18.000'),
            Text('Total: Rp518.000'),
            SizedBox(height: 30),

            // Tombol Checkout
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PesananBerhasilPage()));
                // Aksi yang dilakukan saat tombol ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Warna latar belakang tombol
                foregroundColor: Colors.white, // Warna teks tombol
              ),
              child: const Text('Checkout'),
            )
          ],
        ),
      ),
    );
  }
}
