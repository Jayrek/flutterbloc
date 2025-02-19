part of 'display_text_bloc.dart';

sealed class DisplayTextEvent extends Equatable {
  const DisplayTextEvent();

  @override
  List<Object> get props => [];
}

class UpdateTextEvent extends DisplayTextEvent {
  const UpdateTextEvent({required this.updatedText});

  final String updatedText;

  @override
  List<Object> get props => [updatedText];
}

class BackToPreviousTextEvent extends DisplayTextEvent {
  const BackToPreviousTextEvent();
}
