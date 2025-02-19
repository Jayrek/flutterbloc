import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screens/repository_provider/auth_repository.dart';

part 'auth_repository_event.dart';
part 'auth_repository_state.dart';

class AuthRepositoryBloc
    extends Bloc<AuthRepositoryEvent, AuthRepositoryState> {
  // add the AuthRepository in the constructor
  final AuthRepository authRepositotry;
  AuthRepositoryBloc({required this.authRepositotry}) : super(AuthInitial()) {
    on<AuthSignIn>((event, emit) async {
      debugPrint('email: ${event.email}');
      debugPrint('password: ${event.password}');
      emit(AuthLoading());
      final response = await authRepositotry.signIn(
        email: event.email,
        password: event.password,
      );
      if (response) {
        emit(AuthSuccess(email: event.email));
      } else {
        emit(AuthFailure());
      }
    });
  }
}
