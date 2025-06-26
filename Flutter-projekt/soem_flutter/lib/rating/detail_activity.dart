// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import '../util/bmi.dart';

class DetailActivity extends StatelessWidget {
  final BMICategory category;

  const DetailActivity({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details: ${category.specific}')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Allgemein: ${category.general}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text('Spezifisch: ${category.specific}'),
            const SizedBox(height: 10),
            Text(
              'Minimalwert: ${category.min != null ? category.min!.toStringAsFixed(1) : "< 15.0"}',
            ),
            Text(
              'Maximalwert: ${category.max != double.infinity ? category.max.toStringAsFixed(1) : "∞"}',
            ),
          ],
        ),
      ),
    );
  }
}
