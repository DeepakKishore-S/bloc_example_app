import 'package:bloc_example_app/bloc/counter_bloc.dart';
import 'package:bloc_example_app/cubit/counter_cubit.dart';
import 'package:bloc_example_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CounterCubit()),
            BlocProvider(create: (context) => CounterBloc()),
          ],
          child: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}
