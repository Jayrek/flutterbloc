part of 'auth_bloc_selector_bloc.dart';

sealed class AuthBlocSelectorEvent extends Equatable {
  const AuthBlocSelectorEvent();

  @override
  List<Object> get props => [];
}

class EmailAuthBlocSelectorEvent extends AuthBlocSelectorEvent {
  const EmailAuthBlocSelectorEvent({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordAuthBlocSelectorEvent extends AuthBlocSelectorEvent {
  const PasswordAuthBlocSelectorEvent({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class SignInUserEvent extends AuthBlocSelectorEvent {
  const SignInUserEvent();
}
