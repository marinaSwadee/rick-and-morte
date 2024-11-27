part of 'chararters_cubit.dart';

@immutable
sealed class CharartersState {}

final class CharartersInitial extends CharartersState {}



class CharactersLoaded extends CharartersState{
  final List<Results> characters;

  CharactersLoaded(this.characters);



  }