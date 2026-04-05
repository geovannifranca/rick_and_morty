import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character_detail.model.dart';
import 'package:rick_and_morty/models/character_response.model.dart';

class RickAndMortyService {
  final Dio dio;
  RickAndMortyService()
    : dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<CharacterResponse> getAllCharacter() async {
    final response = await dio.get('/character');

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar os dados");
    }

    return CharacterResponse.fromMap(response.data);
  }

  Future<CharacterDetail> getDetail(int id) async {
    final response = await dio.get('/character/$id');

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar os dados");
    }

    return CharacterDetail.fromMap(response.data);
  }
}
