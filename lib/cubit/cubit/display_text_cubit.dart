import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'display_text_state.dart';

class DisplayTextCubit extends Cubit<DisplayTextState> {
  DisplayTextCubit() : super(const DisplayTextState(text: 'Hello'));

  void updateText(String updatedText) {
    emit(DisplayTextState(text: updatedText));
  }

  void backToPreviousText() {
    emit(const DisplayTextState(text: 'Hello'));
  }
}
