import 'package:bloc_example/calculation_cubit.dart';
import 'package:bloc_example/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CounterCubit(),
      ),
      BlocProvider(create: (context) => CalculationCubit())
    ], child: const HomePage()),
  ));
}
