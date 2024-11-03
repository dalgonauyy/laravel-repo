import 'package:flutter/material.dart';

class PesanPage extends StatefulWidget {
  const PesanPage({super.key});

  @override
  State<PesanPage> createState() => _PesanPageState();
}

class _PesanPageState extends State<PesanPage> {
  final TextEditingController _pesanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pesan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          // Nama Admin
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Admin Toko', // Ganti dengan nama admin
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // Isi Pesan
          Expanded(
            child: ListView(
              children: [
                // Contoh pesan dari penjual
                _buildPesanItem(
                    'Admin Tasya', 'Halo, pesanan Anda sedang diproses.', true),
                // Contoh pesan dari pembeli
                _buildPesanItem('Nana', 'Terima kasih!', false),
                // Tambahkan pesan-pesan lain di sini
              ],
            ),
          ),

          // Kolom untuk mengetik pesan
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _pesanController,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Aksi saat tombol kirim ditekan
                    setState(() {
                      // Tambahkan pesan ke list
                    });
                    _pesanController.clear();
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPesanItem(String pengirim, String isiPesan, bool isPenjual) {
    return Align(
      alignment: isPenjual ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isPenjual ? Colors.grey[300] : Colors.blue[100],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pengirim,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(isiPesan),
          ],
        ),
      ),
    );
  }
}
