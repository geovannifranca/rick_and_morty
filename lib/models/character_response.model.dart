import 'dart:convert';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/models/info.model.dart';

class CharacterResponse {
  final Info info;
  final List<Character> results;
  CharacterResponse({required this.info, required this.results});

  CharacterResponse copyWith({Info? info, List<Character>? results}) {
    return CharacterResponse(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'info': info.toMap(),
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory CharacterResponse.fromMap(Map<String, dynamic> map) {
    return CharacterResponse(
      info: Info.fromMap(map['info'] as Map<String, dynamic>),
      results: List<Character>.from(
        (map['results'] as List<dynamic>).map<dynamic>(
          (x) => Character.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterResponse.fromJson(String source) =>
      CharacterResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
