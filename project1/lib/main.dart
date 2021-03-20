import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.lightGreen[100]),
      title: 'MineCraft Guide',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MineCraft Guide',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
      ),
      body: totalListView(),
    );
  }
}

class new_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Screen'),
        ),
        body: Center(child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
        )));
  }
}

void onpressed(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => new_screen()),
  );
}

class totalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        imageTile(),
        search_card(),
        guide_card(),
        community_card(),
      ],
    );
  }
}

class imageTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
          "https://t1.daumcdn.net/thumb/R720x0/?fname=https://t1.daumcdn.net/brunch/service/user/1YN0/image/ak-gRe29XA2HXzvSBowU7Tl7LFE.png"),
    );
  }
}

// Widget cardFunc(Widget innerWidget) {
//   return Card(child: Container(child: innerWidget));
// }

class search_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: ListTile(
        leading: Icon(Icons.search),
        title: Text('Search'),
      )),
    );
  }
}

class guide_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '가이드',
              style: TextStyle(
                color: Colors.lightGreen,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new_screen()),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text('button'),
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new_screen()),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text('button'),
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new_screen()),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text('button'),
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new_screen()),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text('button'),
                ],
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new_screen()),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text('button'),
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new_screen()),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text('button'),
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new_screen()),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text('button'),
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new_screen()),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text('button'),
                ],
              )),
            ],
          ),
        ],
      )),
    );
  }
}

class community_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                '커뮤니티',
                style: TextStyle(
                  color: Colors.lightGreen,
                ),
              ),
            ),
            make_tile()
          ],
        ),
      ),
    );
  }
}

ListTile make_tile() {
  return ListTile(
    title: Text('text example'),
  );
}

FlatButton buttonclick(string) {}
