// lib/pages/notification_page.dart
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'notification_detail_page.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Diskon 50% untuk Semua Produk!',
      'message': 'Nikmati diskon besar untuk semua produk di akhir pekan ini. Jangan sampai ketinggalan!',
      'isRead': false,
      'time': '10 menit lalu',
    },
    {
      'title': 'Pesanan Anda Sedang Diproses',
      'message': 'Pesanan #1234 sedang dalam proses. Kami akan memberi tahu Anda ketika pesanan dikirim.',
      'isRead': true,
      'time': '1 jam lalu',
    },
    {
      'title': 'Produk Baru: Koleksi Musim Dingin',
      'message': 'Lihat koleksi terbaru musim dingin kami dengan desain eksklusif. Temukan gaya yang sesuai untuk Anda!',
      'isRead': false,
      'time': '3 jam lalu',
    },
    {
      'title': 'Flash Sale! Diskon hingga 70%',
      'message': 'Flash sale selama 24 jam dengan diskon besar-besaran. Segera cek koleksi produk pilihan!',
      'isRead': false,
      'time': '6 jam lalu',
    },
    {
      'title': 'Pesanan Anda Telah Dikirim',
      'message': 'Pesanan #1234 telah dikirim dan akan segera sampai di alamat Anda. Lacak status pengiriman untuk detail lebih lanjut.',
      'isRead': true,
      'time': '1 hari lalu',
    },
    {
      'title': 'Undangan Eksklusif untuk Event Fashion',
      'message': 'Kami mengundang Anda untuk hadir dalam acara peluncuran koleksi terbaru. RSVP sekarang!',
      'isRead': false,
      'time': '2 hari lalu',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifikasi"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return _buildNotificationTile(notification);
        },
      ),
    );
  }

  Widget _buildNotificationTile(Map<String, dynamic> notification) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: notification['isRead'] ? Colors.white : Colors.grey[200],
      child: ListTile(
        leading: Icon(
          notification['isRead'] ? Icons.notifications : Icons.notifications_active,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(notification['title']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification['message']),
            const SizedBox(height: 4),
            Text(
              notification['time'],
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            notification['isRead'] = true;
          });
          // Navigasi ke halaman detail notifikasi
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationDetailPage(
                title: notification['title'],
                message: notification['message'],
                time: notification['time'],
              ),
            ),
          );
        },
      ),
    );
  }
}
