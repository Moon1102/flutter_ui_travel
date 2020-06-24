import 'package:flutter/material.dart';
import 'package:travel/components/IrregularBox.dart';
import 'package:travel/components/Tab.dart';

import 'global/Global.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      theme: new ThemeData(brightness: Brightness.light),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 236, 236, 1),
              Color.fromRGBO(255, 251, 251, 1)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )),
          child: _body()),
    );
  }

  Widget _body() {
    final size = MediaQuery.of(context).size;
    print('1===${size.height.toString()}');
    return Container(
      margin: EdgeInsets.only(top: 105),
//      padding: EdgeInsets.only(left: 24),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Discover',
                    style:
                        TextStyle(color: Global.titleFontColor, fontSize: 44),
                  ),
                  margin: EdgeInsets.only(left: 12),
                ),
                TabView()
              ]),
          IrregularBox(
            topFactor: .52,
            content: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            'Popular Categories',
                            style: TextStyle(
                                color: Global.titleFontColor, fontSize: 24),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                                color: Global.bodyFontColor, fontSize: 17),
                          )
                        ],
                      ),
                      Container(
                          height: 100,
                          width: 320,
                          child: GridView(
                              padding: EdgeInsets.only(top: 12),
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4, crossAxisSpacing: 8),
                              children: [
                                _cell(
                                    'Beach',
                                    Color.fromRGBO(245, 192, 232, 1),
                                    Icon(
                                      Icons.beach_access,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                _cell(
                                    'Camping',
                                    Color.fromRGBO(142, 200, 244, 1),
                                    Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                _cell(
                                    'Car',
                                    Color.fromRGBO(191, 166, 236, 1),
                                    Icon(
                                      Icons.directions_car,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                _cell(
                                    'Food',
                                    Color.fromRGBO(246, 191, 192, 1),
                                    Icon(
                                      Icons.fastfood,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              ]))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cell(String title, Color color, Icon icon) {
    assert(color != null);
    assert(icon != null);

    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: color),
                child: icon)),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            title,
            style: TextStyle(color: Global.bodyFontColor),
          ),
        )
      ],
    );
  }
}
