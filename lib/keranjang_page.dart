import 'package:flutter/material.dart';
import 'package:myapp/checkout_page.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  List<Map<String, dynamic>> keranjang = [
    {
      'nama': 'Dress Batik',
      'gambar': 'assets/images/batik.jpg',
      'harga': 200000,
      'deskripsi': 'Dress batik modern dengan motif parang',
      'jumlah': 1,
      'isChecked': true
    },
    {
      'nama': 'Long Dress',
      'gambar': 'assets/images/dress1.jpeg',
      'harga': 350000,
      'deskripsi': 'Long dress elegan untuk acara formal',
      'jumlah': 1,
      'isChecked': true
    },
    {
      'nama': 'Simple Blouse',
      'gambar': 'assets/images/bajuberanda3.jpeg',
      'harga': 150000,
      'deskripsi': 'Simpel blouse dengan gaya terbaru',
      'jumlah': 1,
      'isChecked': false
    },
    {
      'nama': 'Dress Elegan',
      'gambar': 'assets/images/dresskeranjang1.jpeg',
      'harga': 200000,
      'deskripsi': 'Dress yang dibuat dengan bahan premium',
      'jumlah': 1,
      'isChecked': false
    }

    // ... Tambahkan produk lainnya
  ];

  void _ubahJumlah(int index, int perubahan) {
    setState(() {
      keranjang[index]['jumlah'] += perubahan;
      if (keranjang[index]['jumlah'] < 1) {
        keranjang[index]['jumlah'] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Keranjang'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0, // Menghilangkan shadow
      ),
      body: Container(
        color: Colors.white, // Background putih
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: keranjang.length,
                itemBuilder: (context, index) {
                  final item = keranjang[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(item['gambar']),
                      title: Text(item['nama']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['deskripsi']),
                          Text('Rp ${item['harga']}'),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () => _ubahJumlah(index, -1),
                              ),
                              Text(item['jumlah'].toString()),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => _ubahJumlah(index, 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Checkbox(
                        value: item['isChecked'],
                        onChanged: (value) {
                          setState(() {
                            item['isChecked'] = value;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: Rp ${_hitungTotal()}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutPage()));
                      // Aksi saat ikon pesan ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.black, // Warna latar belakang tombol
                      foregroundColor: Colors.white, // Warna teks tombol
                    ),
                    child: const Text('Checkout'),
                    // Aksi ketika tombol checkout ditekan
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _hitungTotal() {
    double total = 0;
    for (var item in keranjang) {
      if (item['isChecked']) {
        total += item['harga'] * item['jumlah'];
      }
    }
    return total;
  }
}
