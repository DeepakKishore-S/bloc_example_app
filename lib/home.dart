import 'package:bloc_example_app/bloc/auth_bloc.dart';
import 'package:bloc_example_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  static const String id = "MyHomePage";
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("title"),
        ),
        body: Container(
          child: BlocConsumer<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is Loading) {
                return CircularProgressIndicator();
              } else {
                if (state is AuthSuccess) {
                  return Center(
                    child: Column(
                      children: [
                        Text(state.uid),
                        ElevatedButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(LogoutAction());
                            },
                            child: Text("Logout"))
                      ],
                    ),
                  );
                }
              }
              return SizedBox();
            },
            listener: (context, state) {
              if (state is AuthInitial) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginScreen.id,
                  (route) => false,
                );
              }
            },
          ),
        ));
  }
}
