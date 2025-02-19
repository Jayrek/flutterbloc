part of 'message_bloc_listener_bloc.dart';

sealed class MessageBlocListenerState extends Equatable {
  const MessageBlocListenerState();

  @override
  List<Object> get props => [];
}

class MessageInitial extends MessageBlocListenerState {}

class MessageResult extends MessageBlocListenerState {
  const MessageResult({required this.result});
  final String result;

  @override
  List<Object> get props => [result];
}
