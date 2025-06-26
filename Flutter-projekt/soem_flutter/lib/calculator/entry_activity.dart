// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import 'package:soem_flutter/generated/app_localizations.dart';
import '../shared/base_scaffold.dart';
import 'result_activity.dart';

class EntryActivity extends StatefulWidget {
  const EntryActivity({super.key});

  @override
  State<EntryActivity> createState() => _EntryActivityState();
}

class _EntryActivityState extends State<EntryActivity> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  void _navigateToResult() {
    final height = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);

    if (height != null && weight != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultActivity(heightCm: height, weightKg: weight),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentRoute: '/calculator',
      title: 'BMI Eingabe',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Größe (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Gewicht (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToResult,
              child: Text(AppLocalizations.of(context)!.calculate),
            ),
          ],
        ),
      ),
    );
  }
}
