import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screens/cubit/cubit_screen.dart';
import 'package:flutterbloc/screens/home_screen.dart';
import 'package:flutterbloc/screens/repository_provider/bloc/auth_repository_bloc.dart';

import 'screens/bloc/bloc_screen.dart';
import 'screens/bloc_consumer/bloc/auth_bloc_consumer_bloc.dart';
import 'screens/bloc_consumer/bloc_consumer_screen.dart';
import 'screens/bloc_listener/bloc/message_bloc_listener_bloc.dart';
import 'screens/bloc_listener/bloc_listener_screen.dart';
import 'screens/bloc_selector/bloc/auth_bloc_selector_bloc.dart';
import 'screens/bloc_selector/bloc_selector_screen.dart';
import 'screens/cubit/mask_unmask_text_cubit.dart';
import 'screens/repository_provider/auth_repository.dart';
import 'screens/repository_provider/repository_provider_screen.dart';
import 'screens/set_state/set_state_screen.dart';
import 'shared/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaskUnmaskTextCubit()),
          BlocProvider(create: (context) => AuthBlocSelectorBloc()),
          BlocProvider(create: (context) => AuthBlocConsumerBloc()),
          BlocProvider(create: (context) => MessageBlocListenerBloc()),
          BlocProvider(
              create: (context) => AuthRepositoryBloc(
                  authRepositotry: context.read<AuthRepository>())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: homeNavigationKey,
          routes: {
            setStateNavigationKey: (context) => const SetStateScreen(),
            homeNavigationKey: (context) => const HomeScreen(),
            cubitNavigationKey: (context) => const CubitScreen(),
            blocNavigationKey: (context) => const BlocScreen(),
            blocSelectorNavigationKey: (context) => BlocSelectorScreen(),
            blocListenerNavigationKey: (context) => BlocListenerScreen(),
            blocConsumerNavigationKey: (context) => BlocConsumerScreen(),
            repositoryProviderrNavigationKey: (context) =>
                RepositoryProviderScreen(),
          },
        ),
      ),
    );
  }
}
