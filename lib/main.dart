import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/bloc/display_text_bloc.dart' as display_bloc;
import 'package:flutterbloc/cubit/cubit/display_text_cubit.dart';
// import 'package:flutterbloc/cubit/cubit/display_text_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            // create: (context) => DisplayTextCubit(),
            create: (context) => display_bloc.DisplayTextBloc(),
          ),
          BlocProvider(
            create: (context) => DisplayTextCubit(),
          ),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter BLoC'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // BlocBuilder<DisplayTextCubit, DisplayTextState>(
              BlocBuilder<display_bloc.DisplayTextBloc,
                  display_bloc.DisplayTextState>(
                builder: (context, state) {
                  return Text(
                    state.textFromBloc,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    // context.read<DisplayTextCubit>().updateText('na update!');
                    context.read<display_bloc.DisplayTextBloc>().add(
                        const display_bloc.UpdateTextEvent(
                            updatedText: 'Updated From BLoC'));
                  },
                  child: const Text('Submit')),
              OutlinedButton(
                  onPressed: () {
                    // context.read<DisplayTextCubit>().backToPreviousText();
                    context
                        .read<display_bloc.DisplayTextBloc>()
                        .add(const display_bloc.BackToPreviousTextEvent());
                  },
                  child: const Text('Back!'))
            ],
          ),
        ));
  }
}
