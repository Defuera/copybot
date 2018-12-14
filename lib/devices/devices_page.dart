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
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'You have pushed the button this many times: 0',
                        ),
                      ],
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
            Icons.add,
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
}
