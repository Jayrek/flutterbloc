part of 'display_text_cubit.dart';

class DisplayTextState extends Equatable {
  const DisplayTextState({required this.text});

  final String text;

  @override
  List<Object> get props => [text];
}
