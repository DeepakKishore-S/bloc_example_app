import 'package:bloc_example_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocBuilder<CounterCubit, int>(builder: (context, count) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$count',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        );
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: context.read<CounterCubit>().increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 5,
          ),
          if(context.watch<CounterCubit>().state > 0)
            FloatingActionButton(
              onPressed: context.read<CounterCubit>().decrement,
              tooltip: 'Dec',
              child: const Icon(Icons.remove),
            ),
        ],
      ),
    );
  }
}
