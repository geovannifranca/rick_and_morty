// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/models/character_detail.model.dart';
import 'package:rick_and_morty/services/rick_and_morty.api.dart';

part 'detail_store.g.dart';

class DetailStore = DetailStoreBase with _$DetailStore;

abstract class DetailStoreBase with Store {
  final RickAndMortyService _rickAndMortyService = RickAndMortyService();

  @observable
  bool isLoading = false;

  @observable
  CharacterDetail? characterDetail;

  @action
  Future<void> loadDetailCharacter(int id) async {
    isLoading = true;

    characterDetail = await _rickAndMortyService.getDetail(id);

    isLoading = false;
  }
}
