import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/store/home_store.dart';

class CharacterGridCard extends StatefulWidget {
  final Character character;
  const CharacterGridCard({super.key, required this.character});

  @override
  State<CharacterGridCard> createState() => _CharacterGridCardState();
}

class _CharacterGridCardState extends State<CharacterGridCard> {
  final homeStore = GetIt.I.get<HomeStore>();

  Future<void> getPaletteColor() async {
    if (widget.character.color != Colors.white) return;

    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.character.imageUrl),
    );

    if (paletteGenerator.dominantColor != null && mounted) {
      homeStore.updateCharacterColor(
        id: widget.character.id,
        color: paletteGenerator.dominantColor!.color,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getPaletteColor();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.character.color,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              '${widget.character.id}',
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Center(
                child: Image.network(
                  widget.character.imageUrl,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.character.name,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
