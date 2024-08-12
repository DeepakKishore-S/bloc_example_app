import 'package:bloc_example_app/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<ToDo>> {
  TodoCubit() : super([]);

  void addTodo(ToDo todo) {
    if (todo.name.isEmpty) {
      addError("Title cannot be empty");
    }
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<ToDo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
