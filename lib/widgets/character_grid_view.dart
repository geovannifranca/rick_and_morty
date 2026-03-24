import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/widgets/character_grid_card.dart';

class CharacterGridView extends StatelessWidget {
  final List<Character>? characterList;
  const CharacterGridView({super.key, required this.characterList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 607 / 913,
      ),
      itemBuilder: (context, index) {
        return CharacterGridCard(character: characterList![index]);
      },
    );
  }
}
