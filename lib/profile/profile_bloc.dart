import 'package:bloc/bloc.dart';
import 'package:bot/common/models/device.dart';

class ProfileBloc extends Bloc<Event, ViewModel> {
  @override
  get initialState => ViewModel(showAddProfileReveal: true);

  @override
  Stream<ViewModel> mapEventToState(ViewModel viewModel, Event event)  async* {
    if (event.hideAddProfileReveal){
      yield ViewModel(showAddProfileReveal: false);
    }
  }
}

class ViewModel {
  bool showAddProfileReveal;
  List<Device> devices;

  ViewModel({this.showAddProfileReveal, this.devices});
}

class Event {
  bool hideAddProfileReveal;

  Event({
    this.hideAddProfileReveal,
  });
}
