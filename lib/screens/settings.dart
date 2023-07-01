import 'package:flutter/material.dart';
import '../config/navigation/global_nav.dart';
import '../config/constants.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool truthSettings;

  @override
  void initState() {
    truthSettings = GlobalNav.instance.sharedPreferences!.getBool(AppConstants.truthSettingsKey)!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            SwitchListTile(
              title: const Text('Truthful Questions only'),
              value: truthSettings,
              onChanged: (value) {
                setState(() {
                  GlobalNav.instance.sharedPreferences!.setBool(AppConstants.truthSettingsKey, value);
                  truthSettings = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
