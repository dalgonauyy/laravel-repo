import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Product {
  final String name;
  final double price;
  final int quantity;
  final String status;
  final DateTime orderDate;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.status,
    required this.orderDate,
  });
}

class ProsesPage extends StatelessWidget {
  final List<Product> products = [
    // Contoh data produk
    Product(
      name: 'Dress',
      price: 250000,
      quantity: 1,
      status: 'Sedang Diproses',
      orderDate: DateTime.now(),
    ),
    // Tambahkan produk lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan Sedang Diproses'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(
              'Harga: Rp${product.price}, Jumlah: ${product.quantity}\n'
              'Tanggal Pesanan: ${DateFormat('dd MMMM yyyy').format(product.orderDate)}'
            ),
            trailing: Text(product.status),
          );
        },
      ),
    );
  }
}