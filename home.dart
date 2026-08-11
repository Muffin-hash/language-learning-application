import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'quiz.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Spanish'),
        actions: [
          IconButton(
            icon: const Icon(Icons.quiz),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const QuizScreen()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.green.shade100,
            child: const Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.green, size: 40),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Daily Tip: Practice 10 minutes every day to improve your vocabulary!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Vocabulary Categories',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
              ),
              itemCount: provider.categories.length,
              itemBuilder: (context, index) {
                final category = provider.categories[index];
                return Card(
                  color: Colors.green.shade50,
                  child: InkWell(
                    onTap: () {
                      // Show words in this category
                    },
                    child: Center(
                      child: Text(
                        category,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recent Words',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: provider.vocabulary.length,
              itemBuilder: (context, index) {
                final word = provider.vocabulary[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: ListTile(
                    title: Text(word.original, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    subtitle: Text(word.pronunciation),
                    trailing: Text(word.translation, style: const TextStyle(fontSize: 16, color: Colors.grey)),
                    leading: const Icon(Icons.translate),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
