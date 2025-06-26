// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import '../util/bmi.dart';
import '../rating/detail_activity.dart';

class ResultActivity extends StatelessWidget {
  final double heightCm;
  final double weightKg;

  const ResultActivity({
    super.key,
    required this.heightCm,
    required this.weightKg,
  });

  @override
  Widget build(BuildContext context) {
    final bmi = BMI.calculate(heightCm: heightCm, weightKg: weightKg);
    final categoryName = BMI.classify(bmi);
    final category = BMI.getCategoryBySpecific(categoryName);

    return Scaffold(
      appBar: AppBar(title: const Text('BMI Ergebnis')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dein BMI beträgt:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(bmi.toStringAsFixed(2), style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            Text('Kategorie: $categoryName'),
            const SizedBox(height: 20),
            if (category != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailActivity(category: category),
                    ),
                  );
                },
                child: const Text('Details anzeigen'),
              ),
          ],
        ),
      ),
    );
  }
}
