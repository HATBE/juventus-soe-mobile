class AppUser {
  final String username;

  AppUser({required this.username});

  Map<String, dynamic> toMap() => {'username': username};

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(username: map['username']);
  }
}
