class Message {
  int id;
  var date;
  String poster;
  String message;
  
  Message(this.id, this.poster, this.message) {
    date = new DateTime.now();
  }
}