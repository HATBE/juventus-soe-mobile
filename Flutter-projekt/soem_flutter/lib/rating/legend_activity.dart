// Verantwortlicher Mitarbeiter: Aaron Gensetter
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import '../shared/base_scaffold.dart';
import '../util/bmi.dart';
import 'package:soem_flutter/generated/app_localizations.dart';

import 'detail_activity.dart';

class LegendActivity extends StatelessWidget {
  const LegendActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = BMI.categories;

    return BaseScaffold(
      currentRoute: '/rating',
      title: AppLocalizations.of(context)!.bmiCategories,
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return ListTile(
            title: Text('${cat.general} - ${cat.specific}'),
            subtitle: Text(
              'BMI: ${cat.min != null ? cat.min!.toStringAsFixed(1) : "<"} – ${cat.max != double.infinity ? cat.max.toStringAsFixed(1) : "∞"}',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailActivity(category: cat),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
