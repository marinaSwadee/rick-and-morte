import "package:bloc/bloc.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/data/repository/chararters_repository.dart';

import '../../data/models/Results.dart';

part 'chararters_state.dart';

class CharartersCubit extends Cubit<CharartersState> {

  final CharartersRepository charartersRepository;

        List<Results>? characters = [];

  CharartersCubit({required this.charartersRepository}) : super(CharartersInitial());


  List<Results>? getAllCharacters(){

    charartersRepository.getAllCharacters().then((character) {
      characters=character as List<Results>;
     emit(CharactersLoaded(characters!));

    });
    return characters ;
  }


}
