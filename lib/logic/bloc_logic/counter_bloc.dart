import 'package:demo_new/logic/bloc_logic/counter_event.dart';
import 'package:demo_new/logic/cubit_logic/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(CounterInitState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async*{
    switch (event.runtimeType){
      case CounterIncrementEvent:
        int value = state.value;
        value++;
        yield CounterResultState(value);
        break;
      default:
    }
  }
}