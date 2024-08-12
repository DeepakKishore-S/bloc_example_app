import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginAction>((event, emit) {
      emit(Loading());
      if (event.email.isEmpty) {
        emit(AuthFailure(errorMessage: "Enter a valid email address"));
        return;
      }
      if (event.password.length < 6) {
        emit(AuthFailure(
            errorMessage: "Password must be at least 6 characters"));
      }

       Future.delayed(
        Duration(seconds: 2),
        () {
          emit(AuthSuccess(uid: event.email+Random().nextInt(10).toString()));
        },
      );
    });
  }
}
