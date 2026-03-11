import 'package:counter_with_cubit/bloc/counter_event.dart';
import 'package:counter_with_cubit/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(CounterInitialState()) {
    on((event, emit) async {
      if (event is CounterIncrementEvent) {
        await increment(emit);
      } else if (event is CounterDecrementEvent) {
        await decrement(emit);
      }
    });
  }

  int counter = 0;

  Future<void> increment(Emitter<CounterBlocState> emit) async {
    emit(CounterLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    counter++;
    emit(CounterUpdatedState());
  }

  Future<void> decrement(Emitter<CounterBlocState> emit) async {
    emit(CounterLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    counter--;
    emit(CounterUpdatedState());
  }
}
