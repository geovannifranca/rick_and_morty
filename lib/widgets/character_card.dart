import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/screens/detail_screen.dart';
import 'package:rick_and_morty/store/home_store.dart';

class CharacterCard extends StatefulWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.green;
      case 'dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  void initState() {
    super.initState();
    getPaletteColor();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(character: widget.character),
          ),
        );
      },
      child: Card(
        color: widget.character.color,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: Key(widget.character.id.toString()),
                child: CachedNetworkImage(
                  imageUrl: widget.character.imageUrl,
                  width: 136,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.character.name,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: _getStatusColor(widget.character.status),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${widget.character.status} - ${widget.character.species}',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.character.species,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${widget.character.id}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
