import 'package:flutter/material.dart';
import 'package:myapp/pemesanan_page.dart';

class PesananBerhasilPage extends StatelessWidget {
  const PesananBerhasilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            const Text(
              'Pesanan Berhasil!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Pesanan Anda telah diterima dan akan segera diproses.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PemesananPage(orders: [],)));
                // Aksi setelah tombol ditekan, misalnya kembali ke halaman utama(context,
              },
              child: const Text('Lihat Pesanan'),
            ),
          ],
        ),
      ),
    );
  }
}
