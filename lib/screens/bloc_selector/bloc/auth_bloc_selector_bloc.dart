import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_bloc_selector_event.dart';
part 'auth_bloc_selector_state.dart';

class AuthBlocSelectorBloc
    extends Bloc<AuthBlocSelectorEvent, AuthBlocSelectorState> {
  AuthBlocSelectorBloc() : super(const AuthBlocSelectorState()) {
    on<EmailAuthBlocSelectorEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<PasswordAuthBlocSelectorEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<SignInUserEvent>((event, emit) {
      debugPrint('EMAIL: ${state.email}');
      debugPrint('PASSWORD: ${state.password}');
    });
  }
}
