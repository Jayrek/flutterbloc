part of 'mask_unmask_bloc.dart';

class MaskUnmaskEvent extends Equatable {
  const MaskUnmaskEvent();

  @override
  List<Object> get props => [];
}

class MaskUnMaskTextEvent extends MaskUnmaskEvent {
  const MaskUnMaskTextEvent({required this.isMask});

  final bool isMask;

  @override
  List<Object> get props => [isMask];
}
