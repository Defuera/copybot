import 'dart:math';

import 'package:bot/common/models/device.dart';
import 'package:bot/common/theme.dart';
import 'package:bot/common/utils/navigation_utils.dart';
import 'package:bot/devices/devices_bloc.dart';
import 'package:bot/devices/fancy_background.dart';
import 'package:bot/new_device_wizard/wizard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesPage extends StatefulWidget {
  DevicesPage({Key key}) : super(key: key);

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
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
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Text("Any device you add will be shown here"),
          )
        ],
      ),
    );
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
                  title: "Let's add new device", titleColor: Colors.white, enableProfileButton: false, showAddDeviceButtonBorder: true),
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
          _buildProfileButton(context, enableProfileButton),
          _buildAddDeviceButton(context, showAddDeviceButtonBorder),
        ],
      );

  _buildProfileButton(BuildContext context, bool enable) => SizedBox(
      width: BotDimens.actionButtonDiameter,
      height: BotDimens.actionButtonDiameter,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Opacity(
          opacity: () {
            if (enable) {
              return 1.0;
            } else {
              return 0.5;
            }
          }(),
          child: FloatingActionButton(
            onPressed: () {
              if (enable) {
                return () => navigateTo(context, WizardPage());
              } else {
                return null;
              }
            }(),
            tooltip: 'Increment',
            child: Icon(
              Icons.person_outline,
              color: BotColors.orange,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ));

  _buildAddDeviceButton(BuildContext context, bool showBorder) {
    final borderSize = () {
      if (showBorder)
        return 6.0;
      else
        return 0.0;
    }(); //todo animate
    return SizedBox(
        width: BotDimens.actionButtonDiameter + borderSize,
        height: BotDimens.actionButtonDiameter + borderSize,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: FloatingActionButton(
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.white,
                width: borderSize,
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
        onPressed: () => bloc.dispatch(Event(hideAddDevicesReveal: true)),
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
