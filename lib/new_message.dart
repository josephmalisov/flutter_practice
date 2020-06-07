part of 'main.dart';

///Screen to input a new message
class MyScaffoldNewMessage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MyScaffold2();
  }
}

///Scaffold for new message screen
///Stateful because vars name, message, and newMessage are changed dynamically
class MyScaffold2 extends StatefulWidget {
  _MyScaffoldState2 createState() => _MyScaffoldState2();
}

class _MyScaffoldState2 extends State<MyScaffold2> {
  String name, message;
  Message newMessage;

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    // Material is a conceptual piece of paper on which the UI appears.
    return Scaffold(
        // Column is a vertical, linear layout.
        appBar: MyAppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name *',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    this.name =
                        value; //when form is saved, put value of textbox into name
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Message *',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a message';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    this.message =
                        value; //when form is saved, put value of textbox into message
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState
                            .save(); // Saves data within form (allows instruction in onSave to execute)
                        newMessage = new Message.newMessage(++id, name, message);
                        if (!addMessage(newMessage)) {
                          log("Can't add Message!");
                          return;
                        }
                        // messagesDisplay
                        //     .changeMyData(); //tell the messagesDisplay to update
                        Navigator.pop(context); //pop this screen off.
                      }
                    },
                    color: Colors.blue,
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  bool addMessage(Message message) { //TODO: validate data in Firestore
    if (!message.validate()) { //validate fields in message
      return false;
    }

    firestoreInstance
        .collection("messages")
        .add({
          "author": message.author,
        "date" : message.date,
        "message": message.message,
        "upvotes": message.upvotes,
        "downvotes": message.downvotes
        }).then((value) {
      print(value.documentID);
    }).catchError((error) {
      log("Error writing document: $error");
      return false;
    });
  return true;
  }
}
