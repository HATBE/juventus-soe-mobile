// Verantwortlicher Mitarbeiter: Aaron Gensetter
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import 'users_activity.dart';
import '../shared/base_scaffold.dart';
import 'package:soem_flutter/generated/app_localizations.dart';

class SettingsActivity extends StatelessWidget {
  const SettingsActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentRoute: '/settings',
      title: AppLocalizations.of(context)!.settings,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UsersActivity()),
            );
          },
          child: Text(AppLocalizations.of(context)!.manageUsers),
        ),
      ),
    );
  }
}
