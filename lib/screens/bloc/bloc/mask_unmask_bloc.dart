import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mask_unmask_event.dart';
part 'mask_unmask_state.dart';

class MaskUnmaskBloc extends Bloc<MaskUnmaskEvent, MaskUnmaskState> {
  MaskUnmaskBloc() : super(const MaskUnmaskState()) {
    on<MaskUnMaskTextEvent>((event, emit) {
      emit(MaskUnmaskState(isMask: event.isMask));
    });
  }
}
