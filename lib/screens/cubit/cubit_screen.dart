import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screens/cubit/mask_unmask_text_cubit.dart';
import 'package:flutterbloc/shared/widgets/custom_button_widget.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit')),
      body: BlocBuilder<MaskUnmaskTextCubit, MaskUnmaskTextState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.isMask ? 'H**** th***!' : 'Hello there!',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomButtonWidget(
                    onPressed: () {
                      context
                          .read<MaskUnmaskTextCubit>()
                          .maskUnMaskTextEvent(isMask: !state.isMask);
                    },
                    label: state.isMask ? '~UnMask~' : 'Mask',
                    backgroundColor: Colors.green.shade700,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
