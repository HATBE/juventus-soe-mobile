// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_activity.dart';
import 'calculator/entry_activity.dart';
import 'rating/legend_activity.dart';
import 'history/overview_activity.dart';
import 'config/settings_activity.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:soem_flutter/generated/app_localizations.dart';

void main() {
  runApp(const FitApp());
}

class FitApp extends StatelessWidget {
  const FitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitApp',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainActivity(),
        '/home': (context) => const HomeActivity(),
        '/calculator': (context) => const EntryActivity(),
        '/rating': (context) => const LegendActivity(),
        '/history': (context) => const OverviewActivity(),
        '/settings': (context) => const SettingsActivity(),
      },
    );
  }
}

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _handleLogin() async {
    final username = _usernameController.text.trim();
    if (username.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeActivity()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Benutzername',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text(AppLocalizations.of(context)!.login),
            ),
          ],
        ),
      ),
    );
  }
}
