import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state <= 0) {
      emit(0);
    } else {
      emit(state - 1);
    }
  }

  void restart() {
    emit(0);
  }
}
