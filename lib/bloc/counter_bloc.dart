import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>(fn);
    on<CounterDecrement>(fn);
  }

  oncounterIncrement(event, emit) {
    emit(state + 1);
  }
  oncounterDecrement(event, emit) {
    emit(state - 1);
  }

void fn(CounterEvent event, emit){
  switch (event) {
    case CounterIncrement():
      emit(state + 1);
    case CounterDecrement():
       emit(state - 1);
  }
}
}
