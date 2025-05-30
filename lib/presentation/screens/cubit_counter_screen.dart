import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void incrementCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().incrementBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // con el context.select no preciso esto y no se reconstruye el widget cada vez
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterCubit value) =>
              Text('Cubit Counter: ${value.state.transactionCount}'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // esto se precisaria si no usaramos equatable y no tuvieramos el watch de arriba
          // buildWhen: (previous, current) => previous.counter != current.counter,
          builder: (context, state) {
            return Text('Counter Value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => incrementCounterBy(context, 3),
            child: const Text('+3'),
          ),

          const SizedBox(height: 16),

          FloatingActionButton(
            heroTag: '2',
            onPressed: () => incrementCounterBy(context, 2),
            child: const Text('+2'),
          ),

          const SizedBox(height: 16),

          FloatingActionButton(
            heroTag: '3',
            onPressed: () => incrementCounterBy(context),
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
