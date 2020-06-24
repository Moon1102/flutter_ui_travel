import 'package:flutter/material.dart';
import 'package:travel/components/IrregularBoxPainter.dart';

class IrregularBox extends StatefulWidget {
  final Color background;
  final Widget content;
  final double radiusAreaHeight;
  final double topFactor;

  IrregularBox(
      {@required this.topFactor,
      this.content,
      this.background = Colors.white,
      this.radiusAreaHeight = 140.0})
      : assert(topFactor > 0),
        assert(background != null),
        assert(radiusAreaHeight > 0.0);

  @override
  _IrregularBoxState createState() => _IrregularBoxState();
}

class _IrregularBoxState extends State<IrregularBox> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('2===${size.height.toString()}');
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: widget.topFactor * size.height),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CustomPaint(
                  size: Size(size.width, widget.radiusAreaHeight), //指定画布大小
                  painter: IrregularBoxPainter(color: widget.background),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * .07,
                      right: size.width * .07,
                      top: widget.radiusAreaHeight * 0.6),
                  child: Column(
                    children: <Widget>[
                      widget.content,
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
