import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/screens/TournamentScreen.dart';
import 'bloc/tournament_bloc.dart';
import 'repositories/tournament_repository.dart';

void main() {
  // Ensure that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Restrict the app to portrait mode only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create an instance of TournamentRepository
    final tournamentRepository = TournamentRepository();

    return BlocProvider(
      // Provide TournamentBloc with the repository
      create: (context) => TournamentBloc(tournamentRepository),
      child: MaterialApp(
        title: 'Tournament App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TournamentScreen(),
      ),
    );
  }
}
