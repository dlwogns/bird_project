import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //1. 앱바 색상, 배경색상, 텍스트 글씨체 등등 앱의 전체적인 디자인 테마는 화면마다 설정해주지 말고 여기서 한번에 지정해줄 것.
      //특별한 화면 구성이 필요할 때만 해당 화면에서 지정해주는 것이 좋다.(만들때, 수정할 때)
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.lightGreen[100],
          appBarTheme: AppBarTheme(
              color: Colors.white,
              textTheme: TextTheme(title: TextStyle(color: Colors.red)),
              centerTitle: true)),
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
        //centerTitle: true,
        title: Text(
          'MineCraft Guide',
          //style: TextStyle(color: Colors.green),
        ),
        //backgroundColor: Colors.white,
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

//2. 새로운 화면을 만드는 것(return Scaffold)가 아닌 이상 이런식으로 위젯을 상속받아서 클래스 만드는 것은 좋지 않은 방법 같음(Scaffold 아닌 위젯을 이렇게 하는걸 본적이 없음)
//내가 설명했듯이 Widget을 리턴하는 함수형으로 짜는게 훨씬 간편함
//나도 궁금해서 찾아보니 플러터 가이드 문서에서 일반 위젯을 만들 때 함수형으로 함. 아래가 거기서 긁어온 코드.
//왜 그럴까 생각을 해봤는데... 보통 화면을 새로 그릴때는 데이터를 불러오거나 하는 과정이 필요하잖아?
//뭐 그 화면에 쓰일 변수를 선언한다거나, 그 변수에 값을 할당한다거나... 하는 경우가 있지
//   home: scaffold(body: Text() ) 이렇게 위젯 생성자만으로 위젯을 그리면 저렇게 일반적인 구문들을 쓸 자리가 없어
//   그래서 만약 저런 변수 선언이나, 값 할당같은 구문들이 필요할때만 Stateless/StatefulWidget을 상속받아서
//   그 안에 있는 build 함수나 init 함수에서 위젯 생성코드 말고 다른 구문을 쓸 자리를 만들어주기 위해? 쓰는 것 같아
//아무튼 결론적으로 ? 화면을 만들어 줄 때 빼고는 class 생성 및 상속이 아닌 위젯을 리턴하는 식으로 하는 것이 좋은 것 같다
//Widget _buildRow(WordPair pair) {
//  return ListTile(
//    title: Text(
//      pair.asPascalCase,
//      style: _biggerFont,
//    ),
//  );
//}

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
  Widget myButton(context, String buttonName, Icon buttonIcon) {
    return Expanded(
        child: Column(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => new_screen()),
            );
          },
          icon: buttonIcon,
        ),
        Text(buttonName),
      ],
    ));
  }

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
              //3. 가장 모듈화를 시켜줘야 할 부분(반복되는 부분이 많은 곳)에서 모듈화를 안시켜줬지?
              //코드를 깔끔하게 쓰기 위해서도 모듈화를 하는 것이 좋지만
              //반복되는 부분을 줄이기 위해선 꼭!!모듈화를 시켜주는게 좋다!!
              //그리고 모듈화를 잘 시키면 아래처럼 파라미터만 다르게해서 비슷한걸 바로바로 만들 수 있는점 꼭 알아둬야 함!!

              myButton(context, "버튼 1", Icon(Icons.delete)),
              myButton(context, "버튼 2", Icon(Icons.block)),
              myButton(context, "버튼 3", Icon(Icons.update)),
              myButton(context, "버튼 4", Icon(Icons.access_alarm)),
            ],
          ),
          Row(
            children: <Widget>[
              myButton(context, "버튼 5", Icon(Icons.delete)),
              myButton(context, "버튼 6", Icon(Icons.block)),
              myButton(context, "버튼 7", Icon(Icons.update)),
              myButton(context, "버튼 8", Icon(Icons.access_alarm)),
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
