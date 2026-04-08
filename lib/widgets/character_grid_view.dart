import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/widgets/character_grid_card.dart';

class CharacterGridView extends StatelessWidget {
  final List<Character>? characterList;
  final ScrollController _scrollController;
  const CharacterGridView({
    super.key,
    required this.characterList,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GridView.builder(
          key: const Key("gridView"),
          itemCount: characterList!.length + 1,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 607 / 913,
          ),
          itemBuilder: (context, index) {
            if (index < characterList!.length) {
              return CharacterGridCard(character: characterList![index]);
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
