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



class MyCurve extends Curve {
  @override
  double transform(double t) {
    if (t < 0.5) {
      return t;
    } else {
      return 1 - t;
    }
  }
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
    controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    //original code
//    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    //CurvedAnimation attempt
//    final Animation curve = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
//    animation = Tween(begin: 0.0, end: 1.0).animate(curve);

    //
//    animation = Tween(begin: 1.0, end: 0.0).animate(controller);
    animation = CurveTween(curve: MyCurve()).animate(controller);



    _startAnimation();
  }

  void _startAnimation() {
    controller.repeat().orCancel;
  }
  @override
  Widget build(BuildContext context) =>
      _AddDeviceFloatingButtonImpl(bloc: bloc, showBorder: showBorder, animation: animation);

  dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class _AddDeviceFloatingButtonImpl extends AnimatedWidget {
  final Bloc bloc;
  final bool showBorder;
  final Animation animation;
  final maxBorderSize = 26.0;

  _AddDeviceFloatingButtonImpl({this.bloc, this.showBorder, this.animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final borderSize = _getBorderSize();
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: BotDimens.actionButtonDiameter + maxBorderSize,
        height: BotDimens.actionButtonDiameter + maxBorderSize,
        alignment: Alignment.center,
        child: Container(
          width: BotDimens.actionButtonDiameter + borderSize,
          height: BotDimens.actionButtonDiameter + borderSize,
          alignment: Alignment.center,
          child: FloatingActionButton(
            heroTag: null,
//            onPressed: () => navigateTo(context, WizardPage()),
            onPressed: () => bloc.dispatch(Event.SHOW_ADD_DEVICE_REVEAL),
            child: ClipOval(
              child: Container(
                alignment: Alignment.center,
                width: BotDimens.actionButtonDiameter,
                height: BotDimens.actionButtonDiameter,
                child: Icon(Icons.add),
                color: BotColors.orange,
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  _getBorderSize() {
    if (!showBorder) {
      return 0.0;
    } else {
      return maxBorderSize * animation.value;
    }
  }
}
