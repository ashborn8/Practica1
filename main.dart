import 'package:flutter/material.dart';
import 'user_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Agregamos el parámetro 'key'

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Preferences',
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key}); // Agregamos el parámetro 'key'
  @override
  SettingsScreenState createState() => SettingsScreenState(); // Cambiamos el tipo a público
}

class SettingsScreenState extends State<SettingsScreen> { // Hacemos la clase pública
  bool _darkMode = false;
  bool _notifications = true;
  String _language = 'en';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final darkMode = await UserPreferences.getDarkMode();
    final notifications = await UserPreferences.getNotifications();
    final language = await UserPreferences.getLanguage();

    setState(() {
      _darkMode = darkMode;
      _notifications = notifications;
      _language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                  UserPreferences.setDarkMode(value);
                });
              },
            ),
            SwitchListTile(
              title: const Text('Notifications'),
              value: _notifications,
              onChanged: (value) {
                setState(() {
                  _notifications = value;
                  UserPreferences.setNotifications(value);
                });
              },
            ),
            DropdownButton<String>(
              value: _language,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'es', child: Text('Spanish')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _language = value;
                    UserPreferences.setLanguage(value);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
