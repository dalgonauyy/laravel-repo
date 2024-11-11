import 'package:flutter/material.dart';
import 'product.dart';

class PemesananPage extends StatefulWidget {
  final List<Product> orders;

  const PemesananPage({required this.orders, Key? key}) : super(key: key);

  @override
  _PemesananPageState createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  late List<Product> orders;

  @override
  void initState() {
    super.initState();
    orders = widget.orders;
    // Set status pemesanan menjadi 'Diproses'
    for (var product in orders) {
      product.status = 'Diproses';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemesanan'),
      ),
      body: orders.isEmpty
          ? const Center(child: Text('Belum ada pesanan.'))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final product = orders[index];
                return ListTile(
                  leading: Image.asset(product.imagePath, width: 50, height: 50),
                  title: Text(product.name),
                  subtitle: Text('Status: ${product.status}'),
                );
              },
            ),
    );
  }
}
