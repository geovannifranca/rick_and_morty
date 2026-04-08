import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/widgets/character_card.dart';

class CharacterListView extends StatelessWidget {
  final List<Character>? characterList;
  final ScrollController _scrollController;
  const CharacterListView({
    super.key,
    required this.characterList,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.separated(
          key: const Key("listView"),
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index < characterList!.length) {
              return CharacterCard(character: characterList![index]);
            }
            return const Center(child: CircularProgressIndicator());
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: characterList!.length + 1,
        );
      },
    );
  }
}
