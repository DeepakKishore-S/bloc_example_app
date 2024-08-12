import 'package:bloc_example_app/bloc/auth_bloc.dart';
import 'package:bloc_example_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controller1,
            ),
            TextField(
              controller: controller2,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LoginAction(
                      email: controller1.text, password: controller2.text));
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
