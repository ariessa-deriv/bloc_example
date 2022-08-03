import 'package:flutter_bloc/flutter_bloc.dart';

class CalculationCubit extends Cubit<int> {
  CalculationCubit() : super(0);

  void multiplication() {
    emit(0);
  }

  void division() {
    emit(1);
  }
}
