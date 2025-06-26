// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';

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
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('FitApp Menü', style: TextStyle(color: Colors.white)),
            ),
            _buildMenuItem(context, 'Home', '/home', currentRoute),
            _buildMenuItem(context, 'Calculator', '/calculator', currentRoute),
            _buildMenuItem(context, 'Rating', '/rating', currentRoute),
            _buildMenuItem(context, 'History', '/history', currentRoute),
            _buildMenuItem(context, 'Settings', '/settings', currentRoute),
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
