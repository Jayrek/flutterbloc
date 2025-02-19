import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/custom_button_widget.dart';
import '../../shared/widgets/custom_textfield_widget.dart';
import 'bloc/message_bloc_listener_bloc.dart';

class BlocListenerScreen extends StatelessWidget {
  BlocListenerScreen({super.key});

  final _formkey = GlobalKey<FormState>();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlocListener')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              BlocListener<MessageBlocListenerBloc, MessageBlocListenerState>(
            listener: (context, state) {
              if (state is MessageResult) {
                showResultDialog(context, state.result);
              }
            },
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  CustomTextFieldWidget(
                    controller: _messageController,
                    hintText: 'Message',
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Enter short message';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),
                  CustomButtonWidget(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        context.read<MessageBlocListenerBloc>().add(
                            SendMessageEvent(message: _messageController.text));
                      }
                    },
                    label: 'Send',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showResultDialog(
    BuildContext context,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Result'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
