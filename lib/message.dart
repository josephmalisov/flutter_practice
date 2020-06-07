///Message contains a individual new message
class Message {
  int id;
  DateTime date;
  String author;
  String message;
  int upvotes;
  int downvotes;

  Message(this.id, this.author, this.message) {
    this.date = new DateTime.now();
    upvotes = 0;
    downvotes = 0;
    //log out the new message
    print("Created new Message.\n   ID: $id\n   Date: $date\n   Name: $author\n   Message: $message");
  }

  bool validate() {
    return (date != null) && 
    (author != null) && 
    (message != null) &&
    (upvotes != null) &&
    (downvotes != null);
  }

  int score() {
    return upvotes - downvotes;
  }
}
