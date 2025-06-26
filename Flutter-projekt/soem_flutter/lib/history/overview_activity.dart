// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import '../shared/base_scaffold.dart';

class OverviewActivity extends StatelessWidget {
  const OverviewActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentRoute: '/history',
      title: 'History',
      body: const Center(child: Text('Verlauf – noch in Arbeit')),
    );
  }
}
