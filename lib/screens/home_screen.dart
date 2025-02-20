import 'package:flutter/material.dart';
import 'package:flutterbloc/shared/constants.dart';

import '../shared/widgets/custom_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter BLoC')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomButtonWidget(
                label: 'SetState',
                onPressed: () =>
                    Navigator.pushNamed(context, setStateNavigationKey),
              ),
              const SizedBox(height: 10),
              CustomButtonWidget(
                label: 'Cubit',
                onPressed: () =>
                    Navigator.pushNamed(context, cubitNavigationKey),
              ),
              const SizedBox(height: 10),
              CustomButtonWidget(
                label: 'BLoC',
                onPressed: () =>
                    Navigator.pushNamed(context, blocNavigationKey),
              ),
              const SizedBox(height: 10),
              CustomButtonWidget(
                label: 'BlocSelector',
                onPressed: () =>
                    Navigator.pushNamed(context, blocSelectorNavigationKey),
              ),
              const SizedBox(height: 10),
              CustomButtonWidget(
                label: 'BlocListener',
                onPressed: () =>
                    Navigator.pushNamed(context, blocListenerNavigationKey),
              ),
              const SizedBox(height: 10),
              CustomButtonWidget(
                label: 'BlocConsumer',
                onPressed: () =>
                    Navigator.pushNamed(context, blocConsumerNavigationKey),
              ),
              const SizedBox(height: 10),
              CustomButtonWidget(
                label: 'RepositoryProvider',
                onPressed: () => Navigator.pushNamed(
                    context, repositoryProviderrNavigationKey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
