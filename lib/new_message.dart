part of 'main.dart';

class NewMessage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MyScaffold2();
  }
}

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
                this.name = value;
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
                this.message = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    newMessage = new Message(++id, name, message);
                    print("Created new Message");
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
