import 'dart:math';

import 'package:bot/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  static String route = "/profile";

  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final bloc = ProfileBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, ViewModel viewModel) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Profile",
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              body: Column(children: <Widget>[
//                Image.asset("assets/images/list_empty.png"),
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "This is a profile page with profile lists",
                      style: Theme.of(context).textTheme.body1,
                    )),
              ]));
        });
  }
}
