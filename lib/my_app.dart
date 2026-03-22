import 'package:flutter/material.dart';
import 'package:rick_and_morty/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',

      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
