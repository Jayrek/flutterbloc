import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screens/bloc/bloc/mask_unmask_bloc.dart';

import '../../shared/widgets/custom_button_widget.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MaskUnmaskBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('BLoC')),
        body: BlocBuilder<MaskUnmaskBloc, MaskUnmaskState>(
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.isMask ? 'fool you' : 'f*** y**',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    CustomButtonWidget(
                      onPressed: () {
                        context
                            .read<MaskUnmaskBloc>()
                            .add(MaskUnMaskTextEvent(isMask: !state.isMask));
                      },
                      label: state.isMask ? 'Mask' : 'unMask',
                      backgroundColor:
                          state.isMask ? Colors.red : Colors.green.shade700,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
