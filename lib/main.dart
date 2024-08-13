import 'package:bloc_example_app/bloc/app_bloc_observer.dart';
import 'package:bloc_example_app/bloc/auth_bloc.dart';
import 'package:bloc_example_app/home.dart';
import 'package:bloc_example_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          routes: {
            MyHomePage.id: (context) => const MyHomePage(),
            LoginScreen.id: (context) => const LoginScreen(),
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginScreen()),
    );
  }
}
