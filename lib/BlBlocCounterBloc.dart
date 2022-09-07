import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/BlBlocCounterState.dart';
import 'package:flutter_bloc_test/events.dart';

class BlBlocCounterBloc extends Bloc<BlBlocCounterEvent, BlBlocCounterState> {
  BlBlocCounterBloc() : super(BlBlocCounterState().init());

  @override
  Stream<BlBlocCounterState> mapEventToState(BlBlocCounterEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    } else if (event is CounterIncrementEvent) {
      yield increment();
    }
  }

  Future<BlBlocCounterState> init() async {
    return state.clone();
  }

  ///自增
  BlBlocCounterState increment() {
    return state.clone()..count = ++state.count;
  }
}
