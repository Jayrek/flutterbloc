part of 'display_text_bloc.dart';

class DisplayTextState extends Equatable {
  const DisplayTextState({this.textFromBloc = 'default'});

  final String textFromBloc;

  @override
  List<Object> get props => [textFromBloc];
}
