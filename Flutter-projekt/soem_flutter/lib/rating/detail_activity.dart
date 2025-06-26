// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import '../util/bmi.dart';
import 'package:soem_flutter/generated/app_localizations.dart';

class DetailActivity extends StatelessWidget {
  final BMICategory category;

  const DetailActivity({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.detailsTitle(category.specific),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.generalLabel(category.general),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.specificLabel(category.specific),
            ),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.minLabel(
                category.min != null
                    ? category.min!.toStringAsFixed(1)
                    : "< 15.0",
              ),
            ),
            Text(
              AppLocalizations.of(context)!.maxLabel(
                category.max != double.infinity
                    ? category.max.toStringAsFixed(1)
                    : "∞",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
