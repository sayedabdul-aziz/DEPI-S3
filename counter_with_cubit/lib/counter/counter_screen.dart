import 'package:counter_with_cubit/bloc/counter_bloc.dart';
import 'package:counter_with_cubit/bloc/counter_event.dart';
import 'package:counter_with_cubit/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Counter Screen')),
        body: BlocConsumer<CounterBloc, CounterBlocState>(
          listener: (context, state) {
            if (state is CounterUpdatedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Counter Updated'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            var bloc = context.read<CounterBloc>();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${bloc.counter}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 20),
                  state is! CounterLoadingState
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton.filled(
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () {
                                bloc.add(CounterDecrementEvent());
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            IconButton.filled(
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () {
                                bloc.add(CounterIncrementEvent());
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        )
                      : const CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
