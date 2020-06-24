import 'package:flutter/material.dart';
import 'package:travel/components/IrregularBox.dart';
import 'package:travel/global/Global.dart';

class NextPage extends StatefulWidget {
  final String heroTag;

  NextPage({@required this.heroTag}) : assert(heroTag.isNotEmpty);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(children: <Widget>[
      Hero(
          tag: widget.heroTag,
          child: Image.network(
            'https://tse4-mm.cn.bing.net/th/id/OIP.Muomi6vm05a_eSjNBwmVowHaHa?w=208&h=208&c=7&o=5&dpr=2&pid=1.7',
            fit: BoxFit.fill,
          )),
      Positioned(
        top: 40,
        left: 8,
        child: GestureDetector(
          child: Container(
            width: 50,
            height: 50,
            child: Icon(Icons.arrow_back, color: Colors.white, size: 34),
          ),
          onTap: () {
            Navigator.of(context).maybePop();
          },
        ),
      ),
      IrregularBox(
        topFactor: .27,
        background: Color.fromRGBO(255, 245, 245, 1),
        content: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _rowItem(
                Icon(
                  Icons.star,
                  size: 34,
                  color: Colors.amber,
                ),
                '5.0'),
            _rowItem(
                Icon(
                  Icons.cloud,
                  size: 34,
                  color: Color.fromRGBO(142, 200, 244, 1),
                ),
                '19°C',
                true),
            _rowItem(
                Icon(
                  Icons.timelapse,
                  size: 34,
                  color: Color.fromRGBO(245, 192, 232, 1),
                ),
                '4 Days'),
          ],
        )),
      ),
      IrregularBox(
        topFactor: .395,
        content: Container(
            child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Recommended',
                    style: TextStyle(
                        color: Global.titleFontColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 16),
                child: Row(children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Global.titleFontColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  )
                ])),
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 32),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Iceland/s Laugavegur Trail is likely to be one of the most surreal hiking experiences you\'ll ever encounter.The scenery here is otherworldly Black volcanic ash that make you fell like you are taking a stroll on the moon.',
                        style: TextStyle(
                            color: Global.bodyFontColor, fontSize: 17),
                      ),
                    )
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '\$ ${350}',
                        style: TextStyle(
                            color: Global.titleFontColor,
                            fontSize: 27,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ' / per one',
                        style: TextStyle(
                            color: Global.bodyFontColor, fontSize: 17),
                      ),
                    ],
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      height: 55,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(198, 117, 155, 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(120 * 0.5))),
                      child: Center(
                        child: Text(
                          'Book Now',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            )
          ],
        )),
      )
    ]);
  }

  Widget _rowItem(Icon icon, String text, [bool isWeather = false]) {
    return Flexible(
      flex: 1,
      child: Row(
        children: <Widget>[
          icon,
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Text(
              text,
              style: TextStyle(
                  color: isWeather
                      ? Color.fromRGBO(142, 200, 244, 1)
                      : Global.bodyFontColor,
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
