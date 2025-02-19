part of 'auth_repository_bloc.dart';

sealed class AuthRepositoryState extends Equatable {
  const AuthRepositoryState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthRepositoryState {}

class AuthLoading extends AuthRepositoryState {}

class AuthSuccess extends AuthRepositoryState {
  const AuthSuccess({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}

class AuthFailure extends AuthRepositoryState {}
