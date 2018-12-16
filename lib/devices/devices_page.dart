import 'dart:math';

import 'package:bot/common/models/device.dart';
import 'package:bot/common/theme.dart';
import 'package:bot/devices/devices_bloc.dart';
import 'package:bot/devices/widgets/add_device_floating_button.dart';
import 'package:bot/devices/widgets/fancy_background.dart';
import 'package:bot/devices/widgets/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesPage extends StatefulWidget {
  DevicesPage({Key key}) : super(key: key);

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> with SingleTickerProviderStateMixin<DevicesPage> {
  final bloc = DevicesBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, ViewModel viewModel) {
          if (viewModel.showAddDevicesReveal) {
            return _buildAddDeviceRevealState(context);
          } else {
            return _buildDefaultState(context, viewModel.devices);
          }
        });
  }

  Widget _buildDefaultState(BuildContext context, List<Device> devices) {
    return Scaffold(
        appBar: _buildAppBar(context, title: "My devices", titleColor: Colors.black),
        body: Column(children: <Widget>[
          Image.asset("assets/images/list_empty.png"),
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Any device you add will be shown here",
                style: Theme.of(context).textTheme.body1,
              )),
        ]));
  }

  Widget _buildAddDeviceRevealState(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FancyBackground(),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _buildAppBar(context,
                  title: "Let's add new device",
                  titleColor: Colors.white,
                  enableProfileButton: false,
                  showAddDeviceButtonBorder: true),
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
    );
  }

  AppBar _buildAppBar(
    BuildContext context, {
    String title,
    Color titleColor,
    bool enableProfileButton: true,
    bool showAddDeviceButtonBorder: false,
  }) =>
      AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline.apply(color: titleColor),
        ),
        actions: <Widget>[
          ProfileFloatingButton(enabled: enableProfileButton),
          AddDeviceFloatingButton(bloc: bloc, showBorder: showAddDeviceButtonBorder),
        ],
      );

  _buildCancelButton(BuildContext context) {
    var degreesInRadian45 = pi / 4.0;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: FloatingActionButton(
        onPressed: () => bloc.dispatch(Event.HIDE_ADD_DEVICE_REVEAL),
        backgroundColor: Colors.white,
        child: Transform.rotate(
          angle: degreesInRadian45,
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
