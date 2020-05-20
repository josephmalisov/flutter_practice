import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}

class MyScaffold extends StatefulWidget {
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  bool pressed = false;

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
      body: MyPopup(
        isPressed: pressed,
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: _setPressed, child: Icon(Icons.add)),
    );
  }

  void _setPressed() {
    setState(() {
      pressed = !pressed;
    });
  }
}

/**
 * MyPopup stuff
 */
class MyPopup extends StatelessWidget {
  final bool isPressed;

  MyPopup({this.isPressed});

  Widget build(BuildContext context) {
    return Visibility(
        visible: isPressed,
        child: Container(
          height: 36.0,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.5),
            color: Colors.amber[500],
          ),
          child: Center(
            child: Text("Button Pressed!"),
          ),
        ));
  }
}
/* end MyPopup */