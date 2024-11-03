import 'package:flutter/material.dart';
import 'package:myapp/pemesanan_page.dart';

class PesananBerhasilPage extends StatelessWidget {
  const PesananBerhasilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Pesanan Berhasil!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Pesanan Anda telah diterima dan akan segera diproses.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PemesananPage()));
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
