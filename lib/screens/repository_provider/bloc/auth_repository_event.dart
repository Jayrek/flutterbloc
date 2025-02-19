part of 'auth_repository_bloc.dart';

sealed class AuthRepositoryEvent extends Equatable {
  const AuthRepositoryEvent();

  @override
  List<Object> get props => [];
}

class AuthSignIn extends AuthRepositoryEvent {
  const AuthSignIn({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
