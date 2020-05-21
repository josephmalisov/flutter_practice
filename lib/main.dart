import 'package:flutter/material.dart';
import 'package:practice/message.dart';

part 'new_message.dart';

int id = 0;
List<Message> messages = [];

class MyScaffold extends StatefulWidget {
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {

  Widget build(BuildContext context) {
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
      body: MessagesDisplay(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewMessage()),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}

class MessagesDisplay extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            child: Column(
              children: <Widget>[
                Text(messages[index].poster),
                Center(
                  child: Text(messages[index].message),
                )
              ],
            ),
          );
        });
  }
}

/**
 *  main 
 * */
void main() {
  messages.add(new Message(1, "a", "a"));
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: MyScaffold(),
  ));
}
