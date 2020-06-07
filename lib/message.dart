///Message contains a individual new message
class Message {
  int id;
  DateTime date;
  String author;
  String message;

  Message(this.id, this.author, this.message) {
    this.date = new DateTime.now();
    //log out the new message
    print("Created new Message.\n   ID: $id\n   Date: $date\n   Name: $author\n   Message: $message");
  }

  bool validate() {
    return (date != null) && (author != null) && (message != null);
  }
}
