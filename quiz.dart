import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  bool _answered = false;
  String _feedback = '';

  void _checkAnswer(String selected, String correct) {
    if (_answered) return;
    setState(() {
      _answered = true;
      if (selected == correct) {
        _score++;
        _feedback = 'Correct! 🎉';
      } else {
        _feedback = 'Wrong! The correct answer was $correct.';
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentIndex++;
      _answered = false;
      _feedback = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    final vocabulary = provider.vocabulary;

    if (_currentIndex >= vocabulary.length) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz Finished')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Quiz Completed!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text('Your Score: $_score / ${vocabulary.length}', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      );
    }

    final currentWord = vocabulary[_currentIndex];
    final options = [currentWord.translation, 'Goodbye', 'Table', 'Water']..shuffle();

    return Scaffold(
      appBar: AppBar(title: const Text('Practice Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            LinearProgressIndicator(value: (_currentIndex + 1) / vocabulary.length),
            const SizedBox(height: 40),
            const Text('What is the translation for:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              currentWord.original,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 40),
            ...options.map((option) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: _answered && option == currentWord.translation ? Colors.green.shade100 : null,
                  ),
                  onPressed: () => _checkAnswer(option, currentWord.translation),
                  child: Text(option, style: const TextStyle(fontSize: 18)),
                ),
              ),
            )),
            const SizedBox(height: 20),
            Text(_feedback, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _feedback.contains('Correct') ? Colors.green : Colors.red)),
            const Spacer(),
            if (_answered)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  child: const Text('Next Question'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
