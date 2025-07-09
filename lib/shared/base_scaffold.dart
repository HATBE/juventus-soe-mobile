// Verantwortlicher Mitarbeiter: Aaron Gensetter
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import 'package:soem_flutter/generated/app_localizations.dart';
import 'package:soem_flutter/generated/app_localizations.dart';

class BaseScaffold extends StatelessWidget {
  final String currentRoute;
  final String title;
  final Widget body;

  const BaseScaffold({
    super.key,
    required this.currentRoute,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                AppLocalizations.of(context)!.appTitle,
                style: TextStyle(color: Colors.white),
              ),
            ),
            _buildMenuItem(context, 'Home', '/home', currentRoute),
            _buildMenuItem(
              context,
              AppLocalizations.of(context)!.bmiCalculator,
              '/calculator',
              currentRoute,
            ),
            _buildMenuItem(
              context,
              AppLocalizations.of(context)!.rating,
              '/rating',
              currentRoute,
            ),
            _buildMenuItem(
              context,
              AppLocalizations.of(context)!.history,
              '/history',
              currentRoute,
            ),
            _buildMenuItem(
              context,
              AppLocalizations.of(context)!.settings,
              '/settings',
              currentRoute,
            ),
          ],
        ),
      ),
      body: body,
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String label,
    String route,
    String currentRoute,
  ) {
    if (route == currentRoute) return const SizedBox.shrink();
    return ListTile(
      title: Text(label),
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }
}
