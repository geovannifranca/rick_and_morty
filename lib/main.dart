import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/my_app.dart';
import 'package:rick_and_morty/store/home_store.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<HomeStore>(HomeStore());
  runApp(const MyApp());
}
