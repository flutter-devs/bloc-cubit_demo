import 'package:demo_new/logic/cubit_logic/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterInitState(0));

  void increment() async{
    int value = state.value;
    value++;
    
    emit(CounterResultState(value));
  }
}