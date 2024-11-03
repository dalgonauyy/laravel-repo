import 'package:flutter/material.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  List<Notifikasi> daftarNotifikasi = [
    Notifikasi(
      judul: 'Barang Baru!',
      deskripsi: 'Kemeja flanel terbaru sudah tersedia, yuk dibeli!',
      jenis: JenisNotifikasi.barangBaru,
    ),
    Notifikasi(
      judul: 'Stok Ditambah!',
      deskripsi: 'Stok baju kaos polos warna hitam sudah ditambah!',
      jenis: JenisNotifikasi.stokDitambah,
    ),
    Notifikasi(
      judul: 'Ulasan Produk',
      deskripsi:
          'Ulasan untuk produk sepatu lari dari Budi: "Sepatunya nyaman dipakai!"',
      jenis: JenisNotifikasi.ulasan,
    ),
    Notifikasi(
      judul: 'Promo Spesial!',
      deskripsi: 'Dapatkan diskon 20% untuk semua produk jaket!',
      jenis: JenisNotifikasi.promo,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar: AppBar(
  title: const Text('Notifikasi'),
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
  actions: [
    // ... kode untuk angka notifikasi
  ],
),
      body: ListView.builder(
        itemCount: daftarNotifikasi.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(daftarNotifikasi[index].icon),
            title: Text(daftarNotifikasi[index].judul),
            subtitle: Text(daftarNotifikasi[index].deskripsi),
          );
        },
      ),
    );
  }
}

class Notifikasi {
  final String judul;
  final String deskripsi;
  final JenisNotifikasi jenis;

  Notifikasi({
    required this.judul,
    required this.deskripsi,
    required this.jenis,
  });

  IconData get icon {
    switch (jenis) {
      case JenisNotifikasi.barangBaru:
        return Icons.new_releases;
      case JenisNotifikasi.stokDitambah:
        return Icons.add_shopping_cart;
      case JenisNotifikasi.ulasan:
        return Icons.star;
      case JenisNotifikasi.promo:
        return Icons.local_offer;
      default:
        return Icons.notifications;
    }
  }
}

enum JenisNotifikasi {
  barangBaru,
  stokDitambah,
  ulasan,
  promo,
}
