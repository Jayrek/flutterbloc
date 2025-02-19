import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'display_text_event.dart';
part 'display_text_state.dart';

class DisplayTextBloc extends Bloc<DisplayTextEvent, DisplayTextState> {
  DisplayTextBloc() : super(const DisplayTextState()) {
    on<UpdateTextEvent>((event, emit) {
      emit(DisplayTextState(textFromBloc: event.updatedText));
    });
    on<BackToPreviousTextEvent>((event, emit) {
      emit(const DisplayTextState(textFromBloc: '**********'));
    });
  }
}
