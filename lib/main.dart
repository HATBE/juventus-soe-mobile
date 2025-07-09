// Verantwortlicher Mitarbeiter: Aaron Gensetter
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ensureUserIsSet(); // ensure the user is set before running the app use anonymous user if not set
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
        '/': (context) => const HomeActivity(),
        '/home': (context) => const HomeActivity(),
        '/calculator': (context) => const EntryActivity(),
        '/rating': (context) => const LegendActivity(),
        '/history': (context) => const OverviewActivity(),
        '/settings': (context) => const SettingsActivity(),
      },
    );
  }
}

Future<void> ensureUserIsSet() async {
  final sp = await SharedPreferences.getInstance();
  if (!sp.containsKey('username')) {
    await sp.setString('username', '<anonymous>');
  }
}
