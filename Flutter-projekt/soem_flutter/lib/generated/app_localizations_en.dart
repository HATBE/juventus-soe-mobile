// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FitApp';

  @override
  String get login => 'Login';

  @override
  String get username => 'Username';

  @override
  String greeting(Object username) {
    return 'Welcome, $username!';
  }

  @override
  String get bmiInput => 'BMI Input';

  @override
  String get height => 'Height (cm)';

  @override
  String get weight => 'Weight (kg)';

  @override
  String get calculate => 'Calculate';

  @override
  String get result => 'Result';

  @override
  String get bmiLabel => 'Your BMI is:';

  @override
  String detailsTitle(Object specific) {
    return 'Details: $specific';
  }

  @override
  String category(Object category) {
    return 'Category: $category';
  }

  @override
  String get details => 'Show details';

  @override
  String get bmiResultTitle => 'BMI Result';

  @override
  String generalLabel(Object value) {
    return 'General: $value';
  }

  @override
  String specificLabel(Object value) {
    return 'Specific: $value';
  }

  @override
  String minLabel(Object value) {
    return 'Min value: $value';
  }

  @override
  String maxLabel(Object value) {
    return 'Max value: $value';
  }

  @override
  String categoryLabel(Object name) {
    return 'Category: $name';
  }

  @override
  String get saveMeasurement => 'Save measurement';

  @override
  String get saved => 'Measurement saved';

  @override
  String get settings => 'Settings';

  @override
  String get manageUsers => 'Manage Users';

  @override
  String get insertBmi => 'Insert BMI';

  @override
  String changedUser(Object username) {
    return 'Changed User to $username';
  }

  @override
  String get createdUser => 'Created new user';

  @override
  String get cancel => 'Cancel';

  @override
  String get add => 'Add';

  @override
  String get userManagement => 'User Management';

  @override
  String get selectUser => 'Select User';

  @override
  String get createUser => 'Create User';

  @override
  String get bmiCategories => 'BMI Categories';

  @override
  String get rating => 'Rating';

  @override
  String get history => 'History';
}
