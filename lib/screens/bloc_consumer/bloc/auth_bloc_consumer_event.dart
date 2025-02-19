part of 'auth_bloc_consumer_bloc.dart';

sealed class AuthBlocConsumerEvent extends Equatable {
  const AuthBlocConsumerEvent();

  @override
  List<Object> get props => [];
}

class AuthSignInEvent extends AuthBlocConsumerEvent {
  const AuthSignInEvent({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
