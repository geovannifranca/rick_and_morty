import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/store/detail_store.dart';

class DetailScreen extends StatefulWidget {
  final Character character;
  const DetailScreen({super.key, required this.character});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final detailStore = GetIt.I.get<DetailStore>();

  @override
  void initState() {
    super.initState();
    detailStore.loadDetailCharacter(widget.character.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 60,
            expandedHeight: 300,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: Key(widget.character.id.toString()),
                child: CachedNetworkImage(
                  imageUrl: widget.character.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return detailStore.isLoading
                  ? const SliverToBoxAdapter(
                      child: LinearProgressIndicator(color: Colors.white),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 30,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "${widget.character.name.toUpperCase()} | #${widget.character.id} ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Chip(label: Text(widget.character.status)),
                                Chip(label: Text(widget.character.species)),
                                Chip(label: Text(widget.character.gender)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Última localização conhecida:\n ${detailStore.characterDetail!.origin.name}',
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Local de origem:\n ${detailStore.characterDetail!.location.name}',
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Quantidades de vezes aparecidas:\n ${detailStore.characterDetail!.episode.length} episódios',
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
