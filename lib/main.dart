import 'package:flutter/material.dart';
import 'package:practice/message.dart';

part 'new_message.dart';

///id counter for creating message id's
int id = 0;
///list of all messages
List<Message> messages = <Message>[];
///Notifier tells messagesDisplay to update upon an update.
MyNotifier messagesDisplay = MyNotifier(MessagesDisplay());

///Scaffold main home screen.
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

///Custom notifier class for MessagesDisplay
class MyNotifier extends ValueNotifier<MessagesDisplay> {
  MyNotifier(MessagesDisplay messagesDisplay) : super(messagesDisplay);

  void changeMyData (){
    notifyListeners();
  }
}

///Widget to display list of all messages
class MessagesDisplay extends StatelessWidget {
  Widget build(BuildContext context) {
    return ValueListenableBuilder<MessagesDisplay>(
      builder: (BuildContext context, messagesDisplay, Widget child) {
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
      },
      valueListenable: messagesDisplay,
    );
  }
}

///Main function to begin program
void main() {
  messages.add(new Message(1, "a", "a"));
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: MyScaffold(),
  ));
}
