// lib/pages/order_confirmation_page.dart
import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatelessWidget {
  final List<Map<String, dynamic>> orderedItems;
  final int totalPrice;

  OrderConfirmationPage({required this.orderedItems, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesanan Berhasil"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Order Success Message
            Center(
              child: Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 80),
                  SizedBox(height: 10),
                  Text(
                    "Pesanan Anda Berhasil!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("Nomor Pesanan: #123456789"),
                  Text("Estimasi Pengiriman: 3-5 Hari Kerja"),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Section: Order Summary
            Text(
              "Ringkasan Pesanan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildOrderSummary(),

            SizedBox(height: 20),

            // Section: Shipping & Payment Info
            Text(
              "Informasi Pengiriman",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildShippingInfo(),

            SizedBox(height: 20),

            Text(
              "Metode Pembayaran",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildPaymentMethod(),

            SizedBox(height: 20),

            // Total and Done Button
            _buildTotalSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: orderedItems.length,
      itemBuilder: (context, index) {
        final item = orderedItems[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Image.asset(item['image'], width: 60, height: 60, fit: BoxFit.cover),
            title: Text(item['name']),
            subtitle: Text("Jumlah: 1"),
            trailing: Text("Rp ${item['price']}"),
          ),
        );
      },
    );
  }

  Widget _buildShippingInfo() {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Alamat: Jl. Mawar No. 10, Jakarta"),
          Text("Kode Pos: 12345"),
          Text("Telepon: 081234567890"),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Metode: Transfer Bank"),
          Text("Nomor Rekening: 1234 5678 91011"),
        ],
      ),
    );
  }

  Widget _buildTotalSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total Pembayaran:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "Rp $totalPrice",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12.0), backgroundColor: Colors.green,
            textStyle: TextStyle(fontSize: 16),
          ),
          child: Text("Kembali ke Beranda"),
        ),
      ],
    );
  }
}
