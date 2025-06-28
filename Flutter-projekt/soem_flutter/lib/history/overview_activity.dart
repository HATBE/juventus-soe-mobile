import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soem_flutter/generated/app_localizations.dart';
import '../database/db_helper.dart';
import '../model/measurement.dart';
import '../shared/base_scaffold.dart';

class OverviewActivity extends StatefulWidget {
  const OverviewActivity({super.key});

  @override
  State<OverviewActivity> createState() => _OverviewActivityState();
}

class _OverviewActivityState extends State<OverviewActivity> {
  List<Measurement> _measurements = [];

  @override
  void initState() {
    super.initState();
    _loadMeasurements();
  }

  Future<void> _loadMeasurements() async {
    final sp = await SharedPreferences.getInstance();
    final username = sp.getString('username') ?? '';
    final data = await DBHelper().getMeasurements(username);
    setState(() {
      _measurements = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentRoute: '/history',
      title: AppLocalizations.of(context)!.history,
      body: _measurements.isEmpty
          ? Center(
              child: Text(
                AppLocalizations.of(context)!.noEntry,
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _measurements.length,
              itemBuilder: (context, index) {
                final m = _measurements[index];
                return ListTile(
                  title: Text(
                    '${m.date.split("T").first} – BMI: ${m.bmi.toStringAsFixed(1)}',
                  ),
                  subtitle: Text(
                    'Size: ${m.heightCm} cm | Weight: ${m.weightKg} kg',
                  ),
                );
              },
            ),
    );
  }
}
