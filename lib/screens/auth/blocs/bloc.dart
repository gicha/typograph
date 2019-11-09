library auth_bloc;

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part './event.dart';
part './state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static final AuthBloc _authBlocSingleton = AuthBloc._internal();
  factory AuthBloc() {
    return _authBlocSingleton;
  }
  AuthBloc._internal();

  @override
  dispose() {
    _authBlocSingleton.dispose();
    super.dispose();
  }

  AuthState get initialState => IdleAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is ProcessAuthEvent) {
      yield ProcessAuthState();
    }
    if (event is IdleAuthEvent) {
      yield IdleAuthState();
    }
  }
}
