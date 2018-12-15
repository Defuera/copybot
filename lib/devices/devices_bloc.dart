import 'package:bloc/bloc.dart';
import 'package:bot/common/models/device.dart';

class DevicesBloc extends Bloc<Event, ViewModel> {
  @override
  get initialState => ViewModel(showAddDevicesReveal: true);

  @override
  Stream<ViewModel> mapEventToState(ViewModel viewModel, Event event)  async* {
    if (event.hideAddDevicesReveal){
      yield ViewModel(showAddDevicesReveal: false);
    }
  }
}

class ViewModel {
  bool showAddDevicesReveal;
  List<Device> devices;

  ViewModel({this.showAddDevicesReveal, this.devices});
}

class Event {
  bool hideAddDevicesReveal;

  Event({
    this.hideAddDevicesReveal,
  });
}
