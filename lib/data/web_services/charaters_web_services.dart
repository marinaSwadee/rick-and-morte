import 'package:dio/dio.dart';
import 'package:untitled/constants/strings.dart';

class Charaters_web_services {
  late Dio dio;

  Charaters_web_services() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 60),
      connectTimeout: Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());
      return response.data["results"];
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
