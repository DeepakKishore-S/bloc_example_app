import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginAction>(loginAction);

    on<LogoutAction>(
      logoutaction,
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }

  FutureOr<void> loginAction(event, emit) async {
    emit(Loading());
    if (event.email.isEmpty) {
      emit(AuthFailure(errorMessage: "Enter a valid email address"));
      return;
    }
    if (event.password.length < 6) {
      emit(AuthFailure(errorMessage: "Password must be at least 6 characters"));
      return;
    }

    await Future.delayed(
      Duration(seconds: 2),
      () {
        emit(AuthSuccess(uid: event.email + Random().nextInt(10).toString()));
      },
    );
  }

  FutureOr<void> logoutaction(event, emit) async {
    emit(Loading());
    await Future.delayed(
      Duration(seconds: 2),
      () {
        emit(AuthInitial());
      },
    );
  }
}
