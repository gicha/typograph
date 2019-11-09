part of auth_bloc;

@immutable
class AuthState {}

@immutable
class ProcessAuthState extends AuthState {}

@immutable
class IdleAuthState extends AuthState {}
