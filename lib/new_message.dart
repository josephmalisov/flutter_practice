part of 'main.dart';

///Screen to input a new message
class NewMessage extends StatelessWidget {
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
      appBar: AppBar(
        title: const Text('Sample Code'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child to fill the available space.
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
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
                this.name = value; //when form is saved, put value of textbox into name
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
                this.message = value; //when form is saved, put value of textbox into message
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save(); // Saves data within form (allows instruction in onSave to execute)
                    newMessage = new Message(++id, name, message);
                    messages.add(newMessage); //add new message to list
                    messagesDisplay.changeMyData(); //tell the messagesDisplay to update
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
    );
  }
}
