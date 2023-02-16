
abstract class CounterState {
  late final int value;
  @override
  CounterState(this.value);
}

class CounterInitState extends CounterState{
  CounterInitState(int value) : super(0);
}

class CounterResultState extends CounterState{
  CounterResultState(int value) : super(value);
}