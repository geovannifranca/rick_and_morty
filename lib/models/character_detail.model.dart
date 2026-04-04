import 'dart:convert';
import 'package:rick_and_morty/models/location.model.dart';

class CharacterDetail {
  final int id;
  final Location origin;
  final List<String> episode;
  CharacterDetail({
    required this.id,
    required this.origin,
    required this.episode,
  });

  CharacterDetail copyWith({int? id, Location? origin, List<String>? episode}) {
    return CharacterDetail(
      id: id ?? this.id,
      origin: origin ?? this.origin,
      episode: episode ?? this.episode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'origin': origin.toMap(),
      'episode': episode,
    };
  }

  factory CharacterDetail.fromMap(Map<String, dynamic> map) {
    return CharacterDetail(
      id: map['id'] as int,
      origin: Location.fromMap(map['origin'] as Map<String, dynamic>),
      episode: List<String>.from((map['episode'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterDetail.fromJson(String source) =>
      CharacterDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CharacterDetail(id: $id, origin: $origin, episode: $episode)';
}
