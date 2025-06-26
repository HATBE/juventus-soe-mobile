// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'FitApp';

  @override
  String get login => 'Login';

  @override
  String get username => 'Benutzername';

  @override
  String greeting(Object username) {
    return 'Willkommen, $username!';
  }

  @override
  String get bmiInput => 'BMI Eingabe';

  @override
  String get height => 'Größe (cm)';

  @override
  String get weight => 'Gewicht (kg)';

  @override
  String get calculate => 'Berechnen';

  @override
  String get result => 'Ergebnis';

  @override
  String get bmiLabel => 'Dein BMI beträgt:';

  @override
  String detailsTitle(Object specific) {
    return 'Details: $specific';
  }

  @override
  String category(Object category) {
    return 'Kategorie: $category';
  }

  @override
  String get details => 'Details anzeigen';

  @override
  String get bmiResultTitle => 'BMI Ergebnis';

  @override
  String generalLabel(Object value) {
    return 'Allgemein: $value';
  }

  @override
  String specificLabel(Object value) {
    return 'Spezifisch: $value';
  }

  @override
  String minLabel(Object value) {
    return 'Minimalwert: $value';
  }

  @override
  String maxLabel(Object value) {
    return 'Maximalwert: $value';
  }

  @override
  String categoryLabel(Object name) {
    return 'Kategorie: $name';
  }

  @override
  String get saveMeasurement => 'Messung speichern';

  @override
  String get saved => 'Messung gespeichert';

  @override
  String get settings => 'Einstellungen';

  @override
  String get manageUsers => 'User Verwalten';
}
