// lib/providers/chat_provider.dart
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import '../models/message.dart';

class ChatProvider with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  void sendMessage(String text, bool isUser) {
    final message = Message(text: text, isUser: isUser);
    _messages.add(message);
    notifyListeners();
  }
}
