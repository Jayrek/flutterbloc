import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mask_unmask_text_state.dart';

class MaskUnmaskTextCubit extends Cubit<MaskUnmaskTextState> {
  MaskUnmaskTextCubit() : super(const MaskUnmaskTextState(isMask: false));

  void maskUnMaskTextEvent({required bool isMask}) {
    emit(MaskUnmaskTextState(isMask: isMask));
  }
}
