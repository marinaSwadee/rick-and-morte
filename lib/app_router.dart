import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/data/repository/chararters_repository.dart';
import 'package:untitled/data/web_services/charaters_web_services.dart';
import 'package:untitled/presentation/screens/characters_screen.dart';
import 'package:untitled/presentation/screens/characters_details.dart';
import 'business_logic/cubit/chararters_cubit.dart';
import 'constants/strings.dart';
import 'data/models/Results.dart';

class AppRouter {
  late CharartersRepository charartersRepository;
  late CharartersCubit charactersCubit;

  AppRouter() {
    charartersRepository = CharartersRepository(Charaters_web_services());
    charactersCubit = CharartersCubit(
        charartersRepository: charartersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            //create: (context) => CharartersCubit(charartersRepository: charartersRepository),
          create: (BuildContext context) =>
            charactersCubit,
            child: CharactersScreen(),
          ),
        );

      case characterDetails:
        final results =  settings.arguments as Results;
        return MaterialPageRoute(builder: (_) => CharactersDetails(results: results,));
    }
  }
}
