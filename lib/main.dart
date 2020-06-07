import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/message.dart';

part 'new_message.dart';
part 'search.dart';

///id counter for creating message id's
int id = 0;

///list of all messages
List<Message> messages = <Message>[];

//Firestore variables
final firestoreInstance = Firestore.instance;

///Scaffold main home screen.
class MyScaffold extends StatefulWidget {
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Scaffold(
      // Column is a vertical, linear layout.
      appBar: MyAppBar(),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyScaffoldNewMessage()),
            );
          },
          child: Icon(Icons.add)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreInstance.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Message.fromSnapshot(data);

    return Padding(
        key: ValueKey(record.author),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              return messageView(record);
            }));
  }

  Widget messageView(Message record) {
    int score = record.upvotes - record.downvotes;
    return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                color: Colors.lightGreen,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      record.author,
                      textAlign: TextAlign.left,
                      textScaleFactor: 1.5,
                    ),
                    Center(
                      child: Text(
                        record.message,
                        textAlign: TextAlign.center,
                        textScaleFactor: 3,
                      ),
                    ),
                    Center(
                        child: Text(
                      score.toString(),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.5,
                    ))
                  ],
                ),
              );
  }
}



///MyAppBar to run inside of MyScaffold
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text('Sample Code'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Search',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyScaffoldSearch()),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null, // null disables the button
        ),
      ],
    );
  }
}

///Custom notifier class for MessagesDisplay
class MyNotifier extends ValueNotifier<_MyScaffoldState> {
  MyNotifier(_MyScaffoldState messagesDisplay) : super(messagesDisplay);

  void changeMyData() {
    notifyListeners();
  }
}


///Main function to begin program
void main() {
  runApp(MaterialApp(
    title: 'Social Media App', // used by the OS task switcher
    home: MyScaffold(),
  ));
}
