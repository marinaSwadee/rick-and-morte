import 'package:untitled/data/web_services/charaters_web_services.dart';
import '../models/Results.dart';

class CharartersRepository {
  final Charaters_web_services charaters_web_services;

  CharartersRepository(this.charaters_web_services);

  Future<List<dynamic>> getAllCharacters() async {
    final characters = await charaters_web_services.getAllCharacters();
    return characters.map((character) => Results.fromJson(character)).toList();
  }
}
