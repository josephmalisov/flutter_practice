import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          MyHomePage(),
        ],
      ),
    );
  }
}

/**
 * MyHomePage stuff
 */
class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool pressed = false;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _setPressed();
          },
          child: MyButton(),
        ),
        MyPopup(isPressed: pressed),
      ],
    );
  }

  void _setPressed() {
    setState(() {
      pressed = !pressed;
    });
  }
}
/* end MyHomePage */

/**
 * MyButton Stuff
 */
class MyButton extends StatelessWidget {
  Widget build (BuildContext context) {
    return Container(
      height: 36.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.lightGreen[500],
      ),
      child: Center(
        child: Text('Button!'),
      ),
    );
  }
}
/* end MyButton */

/**
 * MyPopup stuff
 */
class MyPopup extends StatefulWidget {
  bool isPressed;

  MyPopup({this.isPressed});

  _MyPopupState createState() => _MyPopupState();
}

class _MyPopupState extends State<MyPopup> {
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isPressed,
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
      )
    );
  }
}
/* end MyPopup */

/**
 *  main 
 * */
void main() {
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: MyScaffold(),
  ));
}
