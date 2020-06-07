part of 'main.dart';

class MyScaffoldSearch extends StatefulWidget {
  _MyScaffoldSearchState createState() => _MyScaffoldSearchState();
}

class _MyScaffoldSearchState extends State<MyScaffoldSearch> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchAppBar(),
        body: Container(
            padding: EdgeInsets.all(8),
            child: Column(children: <Widget>[
              SearchBox(),
              QueriedMessages(),
            ])));
  }
}

///MyAppBar to run inside of MyScaffold
class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text('Sample Code'),
    );
  }
}

class SearchBox extends StatefulWidget {
  _MySearchBoxState createState() => _MySearchBoxState();
}

class _MySearchBoxState extends State<SearchBox> {
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 30,
      onChanged: (value) {
        query.value = value;
      },
    );
  }
}

ValueNotifier<String> query = ValueNotifier("");

class QueriedMessages extends StatelessWidget {
  Widget build(BuildContext context) {
    //will hold queried list of messages
    Iterable<Message> queriedMessagesList;

    return ValueListenableBuilder(
        valueListenable: query,
        builder: (BuildContext context, query, Widget child) {
          if (query == "") {
            //if no query, return nothing
            return Container();
          }

          //make our list
          queriedMessagesList =
              messages.where((myMessage) => myMessage.message.contains(query));

          return Expanded(
              child: Container(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: queriedMessagesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.green,
                          margin: EdgeInsets.all(5),
                          child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    queriedMessagesList.elementAt(index).author,
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.5,
                                  ),
                                  Center(
                                    child: Text(
                                      queriedMessagesList
                                          .elementAt(index)
                                          .message,
                                      textAlign: TextAlign.center,
                                      textScaleFactor: 3,
                                    ),
                                  )
                                ],
                              )),
                        );
                      })));
        });
  }
}
