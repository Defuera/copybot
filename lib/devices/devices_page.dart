import 'package:bot/common/utils/navigation_utils.dart';
import 'package:bot/new_device_wizard/wizard_page.dart';
import 'package:flutter/material.dart';

class DevicesPage extends StatefulWidget {
  DevicesPage({Key key}) : super(key: key);

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's add new device"),
        actions: <Widget>[
          _buildAddDeviceButton(context),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }

  _buildAddDeviceButton(BuildContext context) => FloatingActionButton(
        onPressed: () => navigateTo(context, WizardPage()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Color(0xffEF9358),
      );
}
