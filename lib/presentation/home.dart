import 'package:demo_new/logic/bloc_logic/counter_bloc.dart';
import 'package:demo_new/logic/bloc_logic/counter_event.dart';
import 'package:demo_new/logic/cubit_logic/counter_cubit.dart';
import 'package:demo_new/logic/cubit_logic/counter_state.dart';
import 'package:flutter/material.dart';

import '../constant/string_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CounterCubit counterCubit; ///cubit state
  late CounterBloc counterBloc; ///bloc state

  @override
  void initState() {
    counterCubit = CounterCubit(); ///cubit_state
    counterBloc = CounterBloc(); ///bloc_state
    super.initState();
  }

  void _incrementCounter(){
    counterCubit.increment(); ///cubit_state
    counterBloc.add(CounterIncrementEvent()); ///bloc_state
  }

  @override
  Widget build(BuildContext context) {
    return cubitStateScreen(context);
  }

  Widget cubitStateScreen(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context)=> counterCubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppStrings.appbarText),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(AppStrings.cubitCounter),
                BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state)
                    => Text('${state.value}')),
                OutlinedButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                          color: Colors.black,
                          width: 1.5,))),
                    onPressed: () {
                      _incrementCounter();
                    },
                    child: const Text('+', style: TextStyle(fontSize: 25),))
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget blocStateScreen(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context)=> counterBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppStrings.appbarText),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(AppStrings.blocCounter),
                BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state)
                    => Text('${state.value}')),
                OutlinedButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                          color: Colors.black,
                          width: 1.5,))),
                    onPressed: () {
                      _incrementCounter();
                    },
                    child: const Text('+', style: TextStyle(fontSize: 25),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
