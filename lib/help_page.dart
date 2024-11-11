// lib/pages/help_page.dart
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bantuan"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle("Pertanyaan Umum"),
          _buildFAQItem(
            "Bagaimana cara melakukan pemesanan?",
            "Anda bisa memilih produk yang diinginkan, lalu klik tombol 'Beli'. Setelah itu, ikuti instruksi untuk menyelesaikan proses pembayaran.",
          ),
          _buildFAQItem(
            "Metode pembayaran apa saja yang tersedia?",
            "Kami mendukung pembayaran melalui transfer bank, kartu kredit, dan dompet digital seperti OVO atau GoPay.",
          ),
          _buildFAQItem(
            "Bagaimana cara melacak pesanan saya?",
            "Setelah pesanan diproses, Anda akan menerima nomor resi. Anda dapat melacak status pesanan Anda melalui aplikasi atau website kurir yang Anda pilih.",
          ),
          _buildFAQItem(
            "Apakah bisa mengembalikan barang?",
            "Ya, pengembalian barang dapat dilakukan sesuai dengan syarat dan ketentuan. Silakan hubungi layanan pelanggan untuk informasi lebih lanjut.",
          ),
          SizedBox(height: 20),
          _buildSectionTitle("Butuh Bantuan Lainnya?"),
          _buildContactOption(
            context,
            icon: Icons.phone,
            title: "Hubungi Kami",
            subtitle: "Dukungan telepon tersedia 021876889",
            onTap: () {
              // Aksi untuk menghubungi, bisa menggunakan plugin `url_launcher`
              // untuk melakukan panggilan telepon atau membuka email
            },
          ),
          _buildContactOption(
            context,
            icon: Icons.email,
            title: "Email Kami",
            subtitle: "Kirim email ke butikglam@butik.com",
            onTap: () {
              // Buka aplikasi email menggunakan url_launcher
            },
          ),
          _buildContactOption(
            context,
            icon: Icons.chat,
            title: "Live Chat",
            subtitle: "Chat dengan tim dukungan kami",
            onTap: () {
              // Navigasi ke halaman chat atau gunakan layanan chat support
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(answer),
        ),
      ],
    );
  }

  Widget _buildContactOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
