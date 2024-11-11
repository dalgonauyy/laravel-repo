// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'product.dart';
import 'checkout_page.dart';

class KeranjangPage extends StatefulWidget {
  final List<Product> cart;

  const KeranjangPage({required this.cart, Key? key, required void Function(List<Product> cart) onCheckout}) : super(key: key);

  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  late List<Product> cart;
  
  get orders => null;

  @override
  void initState() {
    super.initState();
    cart = widget.cart;
  }

  void _increaseQuantity(int index) {
    setState(() {
      cart[index].quantity += 1;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (cart[index].quantity > 1) {
        cart[index].quantity -= 1;
      }
    });
  }

void _removeProduct(int index) {
  setState(() {
    cart.removeAt(index);
  });
}


  @override
  Widget build(BuildContext context) {
    double totalAmount = cart.fold(0, (sum, item) => sum + item.price * item.quantity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: cart.isEmpty
          ? const Center(child: Text('Keranjang Anda Kosong'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final product = cart[index];
                      return ListTile(
                        leading: Image.asset(product.imagePath, width: 50, height: 50),
                        title: Text(product.name),
                        subtitle: Text('Rp ${product.price.toStringAsFixed(0)} x ${product.quantity}'),
                        trailing: Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove), iconSize: 15,
                              onPressed: () => _decreaseQuantity(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),iconSize: 15,
                              onPressed: () => _increaseQuantity(index),
                        
                            ),
                            IconButton(
        icon: const Icon(Icons.delete), iconSize: 15,
        onPressed: () {
          _removeProduct(index); 
        },
      ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Total: Rp ${totalAmount.toStringAsFixed(0)}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 17),
                      ElevatedButton(
                        onPressed: () {
                          // Navigasi ke halaman checkout dengan mengirimkan produk yang ada di keranjang
                          Navigator.push(
                            context,
  MaterialPageRoute(
    builder: (context) => CheckoutPage(
      cart: cart,
      totalAmount: totalAmount,
      onOrderConfirmed: (List<Product> orderedProducts) {
        // Tambahkan orderedProducts ke halaman Pemesanan
        orders.addAll(orderedProducts);
        setState(() {}); // Perbarui UI halaman Pemesanan jika diperlukan
      },
    ),
  ),
);
                        },
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
