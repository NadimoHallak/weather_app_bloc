import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'waether_event.dart';
part 'waether_state.dart';

class WaetherBloc extends Bloc<WaetherEvent, WaetherState> {
  WaetherBloc() : super(WaetherInitial()) {
    on<WaetherEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
