import 'package:bloc/bloc.dart';
import 'package:bot/common/models/device.dart';

class DevicesBloc extends Bloc<Event, ViewModel> {
  @override
  get initialState => ViewModel(showAddDevicesReveal: true);

  @override
  Stream<ViewModel> mapEventToState(ViewModel viewModel, Event event) async* {
    switch (event) {
      case Event.HIDE_ADD_DEVICE_REVEAL:
        yield ViewModel(showAddDevicesReveal: false);
        break;
//      case Event.NAVIGATE_TO_PROFILE:
//        break;
//      case Event.NAVIGATE_TO_ADD_DEVICE:
//        break;
      default:
        throw Exception("unkown error");
    }
  }
}

class ViewModel {
  bool showAddDevicesReveal;
  List<Device> devices;

  ViewModel({this.showAddDevicesReveal, this.devices});
}

enum Event {
  HIDE_ADD_DEVICE_REVEAL,
//  NAVIGATE_TO_PROFILE,
//  NAVIGATE_TO_ADD_DEVICE
}
