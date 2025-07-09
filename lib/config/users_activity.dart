// Verantwortlicher Mitarbeiter: Aaron Gensetter
// Letzte Änderung: 26.06.2025

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';
import '../database/db_helper.dart';
import 'package:soem_flutter/generated/app_localizations.dart';

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
    final sp = await SharedPreferences.getInstance();
    final saved = sp.getString('username');

    String? fallbackSelected;

    if (saved != null && users.any((u) => u.username == saved)) {
      fallbackSelected = saved;
    } else {
      fallbackSelected = null;
      if (saved != null) {
        print("ERROR: USER '$saved'does not exist!.");
      }
    }

    setState(() {
      _users = users;
      _selected = fallbackSelected;
    });
  }

  Future<void> _saveSelection(String username) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString('username', username);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.changedUser(username)),
      ),
    );
  }

  Future<void> _addUserDialog() async {
    final controller = TextEditingController();

    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text((AppLocalizations.of(context)!.createdUser)),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.username,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () {
              final trimmed = controller.text.trim();
              if (trimmed.isNotEmpty) {
                Navigator.pop(ctx, trimmed);
              }
            },
            child: Text(AppLocalizations.of(context)!.add),
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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.userManagement)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              isExpanded: true,
              value: _selected,
              hint: Text(AppLocalizations.of(context)!.selectUser),
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
              child: Text(AppLocalizations.of(context)!.createUser),
            ),
          ],
        ),
      ),
    );
  }
}
