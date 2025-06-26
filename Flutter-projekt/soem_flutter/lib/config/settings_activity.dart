// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import 'users_activity.dart';
import '../shared/base_scaffold.dart';

class SettingsActivity extends StatelessWidget {
  const SettingsActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentRoute: '/settings', // Wichtig für aktives Menü-Item
      title: 'Einstellungen',
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UsersActivity()),
            );
          },
          child: const Text('Benutzer verwalten'),
        ),
      ),
    );
  }
}
