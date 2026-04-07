import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character_detail.model.dart';
import 'package:rick_and_morty/models/character_response.model.dart';

class RickAndMortyService {
  final Dio _dio;
  RickAndMortyService()
    : _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<CharacterResponse> getAllCharacter({required int page}) async {
    final response = await _dio.get('/character/?page=$page');

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar os dados");
    }

    return CharacterResponse.fromMap(response.data);
  }

  Future<CharacterDetail> getDetail(int id) async {
    final response = await _dio.get('/character/$id');

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar os dados");
    }

    return CharacterDetail.fromMap(response.data);
  }

  Future<CharacterResponse> call(int page) async {
    final response = await _dio.get('/character/?page=$page');

    return CharacterResponse.fromMap(
      response.data is Map ? response.data : {'error': response.data},
    );
  }
}
