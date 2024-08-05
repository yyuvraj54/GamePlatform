import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/home_bloc.dart';
import 'package:task/screens/Home.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/screens/TournamentScreen.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => HomeBloc(),
      child:  MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  TournamentScreen(),
    );
  }
}
