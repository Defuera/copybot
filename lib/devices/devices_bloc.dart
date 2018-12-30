import 'package:bloc/bloc.dart';
import 'package:bot/common/models/device.dart';

class DevicesBloc extends Bloc<_Event, ViewModel> {
  @override
  get initialState => ViewModel(showAddDevicesReveal: true);

  @override
  Stream<ViewModel> mapEventToState(ViewModel viewModel, _Event event) async* {
    switch (event) {
      case _Event.HIDE_ADD_DEVICE_REVEAL:
        yield ViewModel(showAddDevicesReveal: false);
        break;
      case _Event.SHOW_ADD_DEVICE_REVEAL:
        yield ViewModel(showAddDevicesReveal: true);
        break;
//      case Event.NAVIGATE_TO_PROFILE:
//        break;
//      case Event.NAVIGATE_TO_ADD_DEVICE:
//        break;
      default:
        throw Exception("unkown state");
    }
  }

  void hideReveal() => dispatch(_Event.HIDE_ADD_DEVICE_REVEAL);

  void showReveal() => dispatch(_Event.SHOW_ADD_DEVICE_REVEAL);
}

class ViewModel {
  bool showAddDevicesReveal;
  List<Device> devices;

  ViewModel({this.showAddDevicesReveal, this.devices});
}

enum _Event {
  HIDE_ADD_DEVICE_REVEAL,
  SHOW_ADD_DEVICE_REVEAL,
//  NAVIGATE_TO_PROFILE,
//  NAVIGATE_TO_ADD_DEVICE
}
