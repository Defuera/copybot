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
        body: Stack(
          children: <Widget>[
            FancyBackground(),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                AppBar(
                  leading: Icon(Icons.people),
                  iconTheme: IconThemeData(color: Colors.orange),
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  title: Text("Let's add rnew device"),
                  actions: <Widget>[
                    _buildAddDeviceButton(context),
                  ],
                ),
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
      );

  _buildAddDeviceButton(BuildContext context) => SizedBox(
      width: 54.0,
      height: 54.0,
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
          child: Icon(Icons.add),
          backgroundColor: Color(0xffEF9358),
        ),
      ));
}
