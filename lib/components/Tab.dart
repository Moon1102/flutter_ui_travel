import 'package:flutter/material.dart';
import 'package:travel/components/CircleUnderlineTabIndicator.dart';
import 'package:travel/global/Global.dart';
import 'package:travel/views/NextPage.dart';

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final _data = [
    {'title': 'Best nature', 'urls': []},
    {'title': 'Most viewed', 'urls': []},
    {'title': 'Recommend', 'urls': []}
  ];

  List<String> get _keys =>
      _data.map((item) => item['title'].toString()).toList();

  final _scroll = ScrollController();
  int _selectIndex = 0;

  double get _wh => 200;

  Function get _listener => () {
        final index = ((_scroll.offset + _wh * 0.5) / _wh).floor();
        final tmp = index * 2 - 1;
        if (_selectIndex == 0 && tmp < 0 || _selectIndex == index) {
          return;
        }
        setState(() {
          _selectIndex = index;
        });
      };

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DefaultTabController(
            length: _data.length,
            child: TabBar(
              labelColor: Global.bodyFontColor,
              labelPadding: EdgeInsets.only(left: 3, right: 16),
              unselectedLabelColor: Global.tabUnselectFontColor,
              indicator: CircleUnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 10.0, color: Global.bodyFontColor)),
              indicatorColor: Global.bodyFontColor,
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 20),
              tabs: _tabs(),
            )),
        Container(
          height: 270,
          child: ListView.separated(
              controller: _scroll,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    width: _wh,
                    margin: EdgeInsets.fromLTRB(8, 8, 16, 0),
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 4),
                    decoration: index == _selectIndex
                        ? BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x55d1aaa6),
                                  offset: Offset(8.0, 16.0),
                                  blurRadius: 24.0,
                                  spreadRadius: 1.0)
                            ],
                          )
                        : null,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Hero(
                            tag: 'image$index', //唯一标记，前后两个路由页Hero的tag必须相同
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(300 * 0.1),
                              child: Image.network(
                                'https://tse1-mm.cn.bing.net/th/id/OIP.VmndMzrkYfOxagATy6DY1gHaHo?w=185&h=190&c=7&o=5&dpr=2&pid=1.7',
                                fit: BoxFit.cover,
                              ),
                            )),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 2, bottom: 8),
                                  child: Text(
                                    'Plitvice Lakes',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                    Text(
                                      'National Park of Croatia',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation animation,
                                Animation secondaryAnimation) =>
                            FadeTransition(
                                opacity: animation,
                                child: NextPage(
                                  heroTag: 'image$index',
                                ))));
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: 5),
        )
      ],
    );
  }

  List<Widget> _tabs() {
    return _keys
        .map((key) => Tab(
              text: key,
            ))
        .toList();
  }

  @override
  void dispose() {
    _scroll.removeListener(_listener);
    _scroll.dispose();
    super.dispose();
  }
}
