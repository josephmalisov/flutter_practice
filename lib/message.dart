class Message {
  int id;
  var date = new DateTime.now();
  String poster;
  String message;
  
  Message(this.id, this.date, this.poster, this.message);
}