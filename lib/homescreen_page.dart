// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController usernameController = TextEditingController();

  // Fungsi untuk menambahkan pengguna
  Future<void> addUser() async {
    String username = usernameController.text;
    await FirebaseFirestore.instance.collection('users').add({
      'username': username,
      'created_at': FieldValue.serverTimestamp(),
    });
    usernameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Firestore Example')),
      body: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          ElevatedButton(
            onPressed: addUser,
            child: Text('Add User'),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                final users = snapshot.data?.docs ?? [];
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(users[index]['username']));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}