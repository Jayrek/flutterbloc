import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screens/cubit/cubit_screen.dart';
import 'package:flutterbloc/screens/home_screen.dart';

import 'screens/bloc/bloc_screen.dart';
import 'screens/cubit/mask_unmask_text_cubit.dart';
import 'shared/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MaskUnmaskTextCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: homeNavigationKey,
        routes: {
          homeNavigationKey: (context) => const HomeScreen(),
          cubitNavigationKey: (context) => const CubitScreen(),
          blocNavigationKey: (context) => const BlocScreen(),
        },
      ),
    );
  }
}
