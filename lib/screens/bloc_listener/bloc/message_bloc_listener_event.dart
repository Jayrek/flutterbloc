part of 'message_bloc_listener_bloc.dart';

sealed class MessageBlocListenerEvent extends Equatable {
  const MessageBlocListenerEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends MessageBlocListenerEvent {
  const SendMessageEvent({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
