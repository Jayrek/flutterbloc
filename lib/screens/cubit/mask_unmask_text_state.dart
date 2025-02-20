part of 'mask_unmask_text_cubit.dart';

class MaskUnmaskTextState extends Equatable {
  const MaskUnmaskTextState({required this.isMask});

  final bool isMask;

  @override
  List<Object> get props => [isMask];
}
