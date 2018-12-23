import 'dart:math';

import 'package:flutter/material.dart';

class FancyButtonWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color color;

  const FancyButtonWrapper({
    Key key,
    @required this.child,
    @required this.color,
    this.padding = const EdgeInsets.all(4.0),
  })  : assert(child != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: FancyDecoration(color),
      child: Padding(
        padding: this.padding,
        child: child,
      ),
    );
  }
}

class FancyDecoration extends Decoration {
  final Color _color;

  FancyDecoration(this._color);

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return FancyBoxPainter(_color);
  }
}

class FancyBoxPainter extends BoxPainter {
  final Color _color;
  final Paint _strokePaint = Paint();
  final Paint _solidPaint = Paint();

  FancyBoxPainter(this._color) {
    _strokePaint
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    _solidPaint
      ..color = _color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var size = configuration.size;
    var x = offset.dx;
    var y = offset.dy;
    var side = size.shortestSide;
    var rect = Rect.fromLTWH(x, y, side, side);

    // draw top segment
    var topPath = Path();
    topPath.addArc(rect, pi, pi / 2);
    topPath.lineTo(x + size.width / 2, y);
    canvas.drawPath(topPath, _strokePaint);
    canvas.drawCircle(Offset(x, y + size.height / 2), 2, _solidPaint);

    // draw bottom segment
    var bottomPath = Path();
    bottomPath.addArc(rect.translate(size.width - side, 0), pi * 2, pi / 2);
    bottomPath.lineTo(x + size.width / 2, y + size.height);
    canvas.drawPath(bottomPath, _strokePaint);
    canvas.drawCircle(
        Offset(x + size.width, y + size.height / 2), 2, _solidPaint);
  }
}
