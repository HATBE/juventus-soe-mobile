// Verantwortlicher Mitarbeiter: Max Mustermann
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';
import '../database/db_helper.dart';

class UsersActivity extends StatefulWidget {
  const UsersActivity({super.key});

  @override
  State<UsersActivity> createState() => _UsersActivityState();
}

class _UsersActivityState extends State<UsersActivity> {
  List<AppUser> _users = [];
  String? _selected;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await DBHelper().getUsers();
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('username');

    String? fallbackSelected;

    if (saved != null && users.any((u) => u.username == saved)) {
      fallbackSelected = saved;
    } else {
      fallbackSelected = null;
      if (saved != null) {
        print("⚠️ Gespeicherter Benutzer '$saved' existiert nicht mehr.");
      }
    }

    setState(() {
      _users = users;
      _selected = fallbackSelected;
    });
  }

  Future<void> _saveSelection(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Benutzer geändert zu $username')));
  }

  Future<void> _addUserDialog() async {
    final controller = TextEditingController();

    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Neuen Benutzer erstellen'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Benutzername'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Abbrechen'),
          ),
          TextButton(
            onPressed: () {
              final trimmed = controller.text.trim();
              if (trimmed.isNotEmpty) {
                Navigator.pop(ctx, trimmed);
              }
            },
            child: const Text('Hinzufügen'),
          ),
        ],
      ),
    );

    if (name != null && name.isNotEmpty) {
      await DBHelper().insertUser(AppUser(username: name));
      await _loadUsers();
      await _saveSelection(name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Benutzerverwaltung')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              isExpanded: true,
              value: _selected,
              hint: const Text('Benutzer wählen'),
              items: _users.map((u) {
                return DropdownMenuItem(
                  value: u.username,
                  child: Text(u.username),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _selected = val;
                });
                if (val != null) _saveSelection(val);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addUserDialog,
              child: const Text('Benutzer hinzufügen'),
            ),
          ],
        ),
      ),
    );
  }
}
