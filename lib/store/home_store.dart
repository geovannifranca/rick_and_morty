import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/models/character_response.model.dart';
import 'package:rick_and_morty/services/rick_and_morty.api.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final RickAndMortyService _rickAndMortyService = RickAndMortyService();

  @observable
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @observable
  bool clicked = false;

  @observable
  ObservableList<Character> _character = <Character>[].asObservable();

  ObservableList<Character> get character => _character;

  @observable
  String? _search;

  String? get search => _search;

  @action
  void changeLayout() {
    clicked = !clicked;
  }

  @action
  void setSearch(String? text) => _search = text;

  @action
  Future<List<Character>> loadCharacter() async {
    _isLoading = true;

    try {
      CharacterResponse response = await _rickAndMortyService.getAllCharacter();
      _character.addAll(response.results);
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao carregar: $e');
    } finally {
      _isLoading = false;
    }
    return _character;
  }

  @action
  void updateCharacterColor({required int id, required Color color}) {
    final index = _character.indexWhere((element) => element.id == id);
    _character[index] = _character[index].copyWith(color: color);
  }
}
