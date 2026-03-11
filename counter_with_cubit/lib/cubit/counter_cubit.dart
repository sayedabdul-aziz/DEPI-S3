import 'package:counter_with_cubit/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState());

  int counter = 0;

  Future<void> increment() async {
    emit(CounterLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    counter++;
    emit(CounterUpdatedState());
  }

  Future<void> decrement() async {
    emit(CounterLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    counter--;
    emit(CounterUpdatedState());
  }
}

// Actions => increment, decrement
// States => CounterUpdated, LoginLoading, LoginSuccess, LoginFailure

// Shape
// Circle , Rectangle , Triangle

// Shape circle = Triangle(5);

// getArea(Shape s){
//    s.getArea();
// }
