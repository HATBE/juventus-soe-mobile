class Measurement {
  final int? id;
  final String username;
  final double heightCm;
  final double weightKg;
  final double bmi;
  final String date;

  Measurement({
    this.id,
    required this.username,
    required this.heightCm,
    required this.weightKg,
    required this.bmi,
    required this.date,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'heightCm': heightCm,
    'weightKg': weightKg,
    'bmi': bmi,
    'date': date,
  };

  static Measurement fromMap(Map<String, dynamic> map) => Measurement(
    id: map['id'],
    username: map['username'],
    heightCm: map['heightCm'],
    weightKg: map['weightKg'],
    bmi: map['bmi'],
    date: map['date'],
  );
}
