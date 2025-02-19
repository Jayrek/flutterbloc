part of 'mask_unmask_bloc.dart';

class MaskUnmaskState extends Equatable {
  const MaskUnmaskState({this.isMask = false});

  final bool isMask;

  @override
  List<Object> get props => [isMask];
}
