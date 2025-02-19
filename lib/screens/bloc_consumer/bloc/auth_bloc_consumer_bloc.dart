import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_bloc_consumer_event.dart';
part 'auth_bloc_consumer_state.dart';

class AuthBlocConsumerBloc
    extends Bloc<AuthBlocConsumerEvent, AuthBlocConsumerState> {
  AuthBlocConsumerBloc() : super(AuthInitial()) {
    on<AuthSignInEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 3));
      debugPrint('email: ${event.email}');
      debugPrint('password: ${event.password}');
      emit(AuthSuccess());
    });
  }
}
