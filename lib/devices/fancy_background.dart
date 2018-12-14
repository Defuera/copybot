import 'package:bot/common/theme.dart';
import 'package:flutter/material.dart';

class FancyBackground extends StatefulWidget {
  @override
  _FancyBackgroundState createState() => _FancyBackgroundState();
}

class _FancyBackgroundState extends State<FancyBackground> with SingleTickerProviderStateMixin<FancyBackground> {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => _FancyBackgroundImpl(animation: animation);

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _FancyBackgroundImpl extends AnimatedWidget {
  _FancyBackgroundImpl({@required animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    var screenWidth = MediaQuery.of(context).size.width;
    var width = screenWidth * animation.value;
    return Align(
      alignment: Alignment.topRight,
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(width * 2)),
        child: Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[darkColor, lightColor],
            ),
          ),
        ),
      ),
    );
  }
}
