import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/word.dart';
import 'screens/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: const LanguageLearningApp(),
    ),
  );
}

class LanguageProvider extends ChangeNotifier {
  final List<Word> _vocabulary = [
    Word(original: 'Hola', translation: 'Hello', category: 'Basics', pronunciation: '/ˈo.la/'),
    Word(original: 'Gracias', translation: 'Thank you', category: 'Basics', pronunciation: '/ˈɡɾa.sjas/'),
    Word(original: 'Manzana', translation: 'Apple', category: 'Food', pronunciation: '/manˈθa.na/'),
    Word(original: 'Perro', translation: 'Dog', category: 'Animals', pronunciation: '/ˈpe.ro/'),
  ];

  List<Word> get vocabulary => [..._vocabulary];

  List<String> get categories => _vocabulary.map((w) => w.category).toSet().toList();
}

class LanguageLearningApp extends StatelessWidget {
  const LanguageLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Learner',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
