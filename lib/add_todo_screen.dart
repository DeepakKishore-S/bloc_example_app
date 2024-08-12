import 'package:bloc_example_app/cubit/todo_cubit.dart';
import 'package:bloc_example_app/home.dart';
import 'package:bloc_example_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoScreen extends StatelessWidget {
  static const String id = "AddTodoScreen";
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<TodoCubit>().addTodo(
                    ToDo(name: controller.text, createdAt: DateTime.now()));
                Navigator.pop(context);
              },
              child: Text("Add"))
        ],
      ),
    );
  }
}
