import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'message_bloc_listener_event.dart';
part 'message_bloc_listener_state.dart';

class MessageBlocListenerBloc
    extends Bloc<MessageBlocListenerEvent, MessageBlocListenerState> {
  MessageBlocListenerBloc() : super(MessageInitial()) {
    on<SendMessageEvent>((event, emit) {
      debugPrint('message: ${event.message}');
      if (event.message != 'test') {
        emit(const MessageResult(result: 'This is not for TESTING!'));
      } else {
        emit(const MessageResult(result: 'TEST TEST TEST'));
      }
    });
  }
}
