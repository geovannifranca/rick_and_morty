import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/widgets/character_card.dart';

class CharacterListView extends StatelessWidget {
  final List<Character>? characterList;
  const CharacterListView({super.key, required this.characterList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return CharacterCard(character: characterList![index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: characterList!.length,
    );
  }
}
