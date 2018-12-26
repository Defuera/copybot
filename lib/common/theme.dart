import 'package:flutter/material.dart';

class BotColors {
  static final darkColor = Color(0xFF0D7EA3);

  static final lightColor = Color(0xFF1DB2CD);

  static final bgColor = Color(0xFFF9F9FB);

  static final orange = Color(0xFFFF7D25);

  static final textGrey = Color(0xFF7A7E8F);

}

class BotDimens {
  static final actionButtonDiameter = 44.0;
}

final textTheme = TextTheme(
  body1: TextStyle(color: BotColors.textGrey, fontSize: 14.0),
//  title: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
  headline: TextStyle(
    color: Colors.white,
    fontFamily: 'Veritas',
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  ), //TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w600),
//  caption: TextStyle(color: Colors.white, fontSize: 12.0),
//  subtitle: TextStyle(color: Colors.white, fontSize: 22.0),
);
