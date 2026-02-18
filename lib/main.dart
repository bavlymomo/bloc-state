import 'package:bloc_tester/cubit/list_cubit.dart';
import 'package:bloc_tester/presentation/screens/about.dart';
import 'package:bloc_tester/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(create: (context) => ListCubit(), child: const Calc()));
}

class Calc extends StatelessWidget {
  const Calc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      initialRoute: '/',
      routes: {'/home': (context) => Home(), '/about': (context) => About()},
    );
  }
}
