import 'package:bloc/bloc.dart';
import 'package:bot/common/theme.dart';
import 'package:bot/devices/devices_bloc.dart';
import 'package:flutter/material.dart';

class AddDeviceFloatingButton extends StatefulWidget {
  final Bloc bloc;
  final bool showBorder;

  AddDeviceFloatingButton({this.bloc, this.showBorder});

  @override
  _AddDeviceFloatingButtonState createState() => _AddDeviceFloatingButtonState(bloc: bloc, showBorder: showBorder);
}

class _AddDeviceFloatingButtonState extends State<AddDeviceFloatingButton>
    with SingleTickerProviderStateMixin<AddDeviceFloatingButton> {
  AnimationController controller;
  Animation<double> animation;

  final Bloc bloc;
  final bool showBorder;

  _AddDeviceFloatingButtonState({this.bloc, this.showBorder});

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) =>
      _AddDeviceFloatingButtonImpl(bloc: bloc, showBorder: showBorder, animation: animation);

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _AddDeviceFloatingButtonImpl extends AnimatedWidget {
  final Bloc bloc;
  final bool showBorder;
  final Animation animation;

  _AddDeviceFloatingButtonImpl({this.bloc, this.showBorder, this.animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final borderSize = _getBorderSize();
    return SizedBox(
        width: BotDimens.actionButtonDiameter + borderSize,
        height: BotDimens.actionButtonDiameter + borderSize,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: FloatingActionButton(
            heroTag: null,
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.white,
                width: borderSize,
              ),
            ),
//            onPressed: () => navigateTo(context, WizardPage()),
            onPressed: () => bloc.dispatch(Event.SHOW_ADD_DEVICE_REVEAL),
            child: Icon(Icons.add),
            backgroundColor: BotColors.orange,
          ),
        ));
  }

  _getBorderSize() {
    if (!showBorder) {
      return 0.0;
    } else {
      return 16.0 * animation.value;
    }
  }
}
