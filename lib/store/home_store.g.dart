// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$_isLoadingAtom = Atom(
    name: 'HomeStoreBase._isLoading',
    context: context,
  );

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$clickedAtom = Atom(
    name: 'HomeStoreBase.clicked',
    context: context,
  );

  @override
  bool get clicked {
    _$clickedAtom.reportRead();
    return super.clicked;
  }

  @override
  set clicked(bool value) {
    _$clickedAtom.reportWrite(value, super.clicked, () {
      super.clicked = value;
    });
  }

  late final _$_characterAtom = Atom(
    name: 'HomeStoreBase._character',
    context: context,
  );

  @override
  ObservableList<Character> get _character {
    _$_characterAtom.reportRead();
    return super._character;
  }

  @override
  set _character(ObservableList<Character> value) {
    _$_characterAtom.reportWrite(value, super._character, () {
      super._character = value;
    });
  }

  late final _$_searchAtom = Atom(
    name: 'HomeStoreBase._search',
    context: context,
  );

  @override
  String? get _search {
    _$_searchAtom.reportRead();
    return super._search;
  }

  @override
  set _search(String? value) {
    _$_searchAtom.reportWrite(value, super._search, () {
      super._search = value;
    });
  }

  late final _$loadCharacterAsyncAction = AsyncAction(
    'HomeStoreBase.loadCharacter',
    context: context,
  );

  @override
  Future<List<Character>> loadCharacter() {
    return _$loadCharacterAsyncAction.run(() => super.loadCharacter());
  }

  late final _$HomeStoreBaseActionController = ActionController(
    name: 'HomeStoreBase',
    context: context,
  );

  @override
  void changeLayout() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.changeLayout',
    );
    try {
      return super.changeLayout();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String? text) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.setSearch',
    );
    try {
      return super.setSearch(text);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCharacterColor({required int id, required Color color}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.updateCharacterColor',
    );
    try {
      return super.updateCharacterColor(id: id, color: color);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clicked: ${clicked}
    ''';
  }
}
