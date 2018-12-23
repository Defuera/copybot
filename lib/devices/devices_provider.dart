import 'package:bot/devices/devices_bloc.dart';
import 'package:flutter/widgets.dart';

class DevicesProvider extends InheritedWidget {
  final DevicesBloc devicesBloc;

  static DevicesBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(DevicesProvider) as DevicesProvider)
          .devicesBloc;

  DevicesProvider({Key key, DevicesBloc devicesBloc, Widget child})
      : devicesBloc = devicesBloc ?? DevicesBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}