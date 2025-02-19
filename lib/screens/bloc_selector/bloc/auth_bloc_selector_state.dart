part of 'auth_bloc_selector_bloc.dart';

class AuthBlocSelectorState extends Equatable {
  const AuthBlocSelectorState({
    this.email = '',
    this.password = '',
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [
        email,
        password,
      ];

  AuthBlocSelectorState copyWith({
    String? email,
    String? password,
  }) {
    return AuthBlocSelectorState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
