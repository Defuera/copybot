import 'dart:math';

import 'package:bot/common/theme.dart';
import 'package:bot/common/utils/navigation_utils.dart';
import 'package:bot/devices/fancy_background.dart';
import 'package:bot/new_device_wizard/wizard_page.dart';
import 'package:flutter/material.dart';

class DevicesPage extends StatefulWidget {
  DevicesPage({Key key}) : super(key: key);

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Scaffold(
          body: Stack(
            children: <Widget>[
              FancyBackground(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _buildAppBar(context),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildCancelButton(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  AppBar _buildAppBar(BuildContext context) => AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Let's add new device",
          style: Theme.of(context).textTheme.headline,
        ),
        actions: <Widget>[
          _buildProfileButton(context),
          _buildAddDeviceButton(context),
        ],
      );

  _buildProfileButton(BuildContext context) => SizedBox(
      //todo inactive
      width: BotDimens.actionButtonDiameter,
      height: BotDimens.actionButtonDiameter,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: FloatingActionButton(
          shape: CircleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          onPressed: () => navigateTo(context, WizardPage()),
          tooltip: 'Increment',
          child: Icon(
            Icons.person_outline,
            color: BotColors.orange,
          ),
          backgroundColor: Colors.white,
        ),
      ));

  _buildAddDeviceButton(BuildContext context) {
    final borderSize = 6; //todo animate
    return SizedBox(
        width: BotDimens.actionButtonDiameter + borderSize,
        height: BotDimens.actionButtonDiameter + borderSize,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: FloatingActionButton(
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.white,
                width: 6.0,
              ),
            ),
            onPressed: () => navigateTo(context, WizardPage()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
            backgroundColor: BotColors.orange,
          ),
        ));
  }

  _buildCancelButton(BuildContext context) {
    var degreesInRadian45 = pi / 4.0;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Transform.rotate(
          angle:  degreesInRadian45,
          child: Icon(
            Icons.add,
            size: 38.0,
            color: BotColors.orange,
          ),
        ),
      ),
    );
  }
}
