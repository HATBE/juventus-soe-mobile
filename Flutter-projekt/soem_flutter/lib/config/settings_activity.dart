// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import '../shared/base_scaffold.dart';

class SettingsActivity extends StatelessWidget {
  const SettingsActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentRoute: '/settings',
      title: 'Settings',
      body: const Center(child: Text('Einstellungen – noch in Arbeit')),
    );
  }
}
