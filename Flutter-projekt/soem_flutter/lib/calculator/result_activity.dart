// Verantwortlicher Mitarbeiter: Aaron Gensetter
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soem_flutter/generated/app_localizations.dart';
import '../util/bmi.dart';
import '../rating/detail_activity.dart';
import '../database/db_helper.dart';
import '../model/measurement.dart';

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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.bmiResultTitle)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.bmiLabel,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(bmi.toStringAsFixed(2), style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.categoryLabel(categoryName)),
            const SizedBox(height: 20),
            if (category != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailActivity(category: category),
                        ),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.details),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final sp = await SharedPreferences.getInstance();
                      final username = sp.getString('username') ?? 'Unknown';
                      final date = DateTime.now().toIso8601String();

                      final measurement = Measurement(
                        username: username,
                        heightCm: heightCm,
                        weightKg: weightKg,
                        bmi: bmi,
                        date: date,
                      );

                      await DBHelper().insertMeasurement(measurement);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context)!.saved),
                        ),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.saveMeasurement),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
