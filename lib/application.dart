import 'package:bot/common/theme.dart';
import 'package:bot/devices/devices_page.dart';
import 'package:bot/profile/profile_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: BotColors.bgColor,
        textTheme: textTheme,
      ),
      routes: {
        '/': (context) => DevicesPage(),
        ProfilePage.route: (context) => ProfilePage(),
      },
    );
  }
}
