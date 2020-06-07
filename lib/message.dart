import 'package:cloud_firestore/cloud_firestore.dart';

///Message contains a individual new message
class Message {
  int id;
  Timestamp date;
  String author;
  String message;
  int upvotes;
  int downvotes;

  Message.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> map = snapshot.data;

    author = map['author'];
    message = map['message'];
    date = map['date'];
    upvotes = map['upvotes'];
    downvotes = map['downvotes'];
  }

  Message.newMessage(this.id, this.author, this.message) {
    this.date = new Timestamp.now();
    upvotes = 0;
    downvotes = 0;
    //log out the new message
    print(
        "Created new Message.\n   ID: $id\n   Date: $date\n   Name: $author\n   Message: $message");
  }

  bool validate() {
    return ((date != null) &&
        (author != null) &&
        (message != null) &&
        (upvotes != null) &&
        (downvotes != null));
  }

  int score() {
    return upvotes - downvotes;
  }
}
