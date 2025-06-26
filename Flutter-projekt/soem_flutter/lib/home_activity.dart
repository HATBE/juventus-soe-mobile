// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soem_flutter/generated/app_localizations.dart';
import 'shared/base_scaffold.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'Benutzer';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentRoute: '/home',
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          AppLocalizations.of(context)!.greeting(username),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
