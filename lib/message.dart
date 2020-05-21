import 'package:flutter/material.dart';

class Message {
  int id;

  String poster;
  String message;

  Message(this.id, this.poster, this.message) {
    print("Created new Message.   Name: $poster   Message: $message");
  }
}
