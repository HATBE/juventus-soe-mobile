// Verantwortlicher Mitarbeiter: Aaron Gensetter
// Letzte Änderung: 26.06.2025

import 'package:collection/collection.dart';

class BMICategory {
  final String general;
  final String specific;
  final double? min;
  final double max;

  BMICategory({
    required this.general,
    required this.specific,
    this.min,
    required this.max,
  });
}

class BMI {
  static double calculate({
    required double heightCm,
    required double weightKg,
  }) {
    final heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  static String classify(double bmi) {
    for (var cat in categories) {
      if ((cat.min == null && bmi < cat.max) ||
          (cat.min != null && bmi >= cat.min! && bmi < cat.max)) {
        return cat.specific;
      }
    }
    return 'Unbekannt';
  }

  static BMICategory? getCategoryBySpecific(String specific) {
    return categories.firstWhereOrNull((c) => c.specific == specific);
  }

  static final List<BMICategory> categories = [
    BMICategory(
      general: 'untergewichtig',
      specific: 'sehr stark',
      min: null,
      max: 15.0,
    ),
    BMICategory(
      general: 'untergewichtig',
      specific: 'stark',
      min: 15.0,
      max: 16.0,
    ),
    BMICategory(
      general: 'untergewichtig',
      specific: 'mässig',
      min: 16.0,
      max: 17.0,
    ),
    BMICategory(
      general: 'untergewichtig',
      specific: 'leicht',
      min: 17.0,
      max: 18.5,
    ),
    BMICategory(
      general: 'normalgewichtig',
      specific: 'normal',
      min: 18.5,
      max: 25.0,
    ),
    BMICategory(
      general: 'übergewichtig',
      specific: 'übergewichtig',
      min: 25.0,
      max: 30.0,
    ),
    BMICategory(
      general: 'fettleibig',
      specific: 'mässig (Grad I)',
      min: 30.0,
      max: 35.0,
    ),
    BMICategory(
      general: 'fettleibig',
      specific: 'stark (Grad II)',
      min: 35.0,
      max: 40.0,
    ),
    BMICategory(
      general: 'fettleibig',
      specific: 'sehr stark (Grad III)',
      min: 40.0,
      max: double.infinity,
    ),
  ];
}
