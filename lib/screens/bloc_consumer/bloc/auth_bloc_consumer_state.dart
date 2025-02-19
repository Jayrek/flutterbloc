part of 'auth_bloc_consumer_bloc.dart';

class AuthBlocConsumerState extends Equatable {
  const AuthBlocConsumerState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthBlocConsumerState {}

final class AuthLoading extends AuthBlocConsumerState {}

final class AuthSuccess extends AuthBlocConsumerState {}

final class AuthFailure extends AuthBlocConsumerState {}
