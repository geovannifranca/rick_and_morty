import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/store/home_store.dart';
import 'package:rick_and_morty/widgets/character_grid_view.dart';
import 'package:rick_and_morty/widgets/character_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeStore = GetIt.I.get<HomeStore>();
  final _scrollController = ScrollController();

  void scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      homeStore.loadCharacter();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(scrollListener);
    homeStore.loadCharacter();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rick and Morty',
                style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Procure pelo seu personagem',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: homeStore.setSearch,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Nome ou identificador',
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: homeStore.changeLayout,
                  icon: Observer(
                    builder: (context) {
                      return homeStore.clicked
                          ? const Icon(Icons.list, size: 36)
                          : const Icon(Icons.grid_view, size: 36);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (context) {
                    if (homeStore.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return homeStore.clicked
                        ? CharacterGridView(
                            characterList: homeStore.filteredCharacter,
                            scrollController: _scrollController,
                          )
                        : CharacterListView(
                            characterList: homeStore.filteredCharacter,
                            scrollController: _scrollController,
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
