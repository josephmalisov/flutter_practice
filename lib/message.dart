import 'package:flutter/material.dart';

///Message contains a individual new message
class Message {
  int id;
  DateTime date;
  String poster;
  String message;

  Message(this.id, this.poster, this.message) {
    this.date = new DateTime.now();
    //log out the new message
    print("Created new Message.\n   ID: $id\n   Date: $date\n   Name: $poster\n   Message: $message");
  }
}
