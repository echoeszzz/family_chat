// lib/screens/settings/settings_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/theme_provider.dart';
import '../data/settings_datasource.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsDataSource _settingsDataSource = SettingsDataSource();

  bool _notificationsEnabled = true;
  bool _darkThemeEnabled = false;
  String _selectedLanguage = 'Русский';

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final notifications = await _settingsDataSource.getNotificationsEnabled();
      final darkTheme = await _settingsDataSource.getDarkThemeEnabled();
      final language = await _settingsDataSource.getSelectedLanguage();

      setState(() {
        _notificationsEnabled = notifications;
        _darkThemeEnabled = darkTheme;
        _selectedLanguage = language;
        _isLoading = false;
      });

      Provider.of<ThemeProvider>(context, listen: false).toggleTheme(_darkThemeEnabled);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка загрузки настроек: $e')),
      );
    }
  }

  Future<void> _updateNotifications(bool value) async {
    try {
      await _settingsDataSource.setNotificationsEnabled(value);
      setState(() {
        _notificationsEnabled = value;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Настройки уведомлений обновлены')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка обновления уведомлений: $e')),
      );
    }
  }

  Future<void> _updateDarkTheme(bool value) async {
    try {
      await _settingsDataSource.setDarkThemeEnabled(value);
      setState(() {
        _darkThemeEnabled = value;
      });
      Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Тема обновлена')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка обновления темы: $e')),
      );
    }
  }

  Future<void> _updateLanguage(String language) async {
    try {
      await _settingsDataSource.setSelectedLanguage(language);
      setState(() {
        _selectedLanguage = language;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Язык обновлен')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка обновления языка: $e')),
      );
    }
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String tempSelectedLanguage = _selectedLanguage;
        return AlertDialog(
          title: Text('Выберите язык'),
          content: SingleChildScrollView(
            child: ListBody(
              children: ['Русский', 'English', 'Español'].map((language) {
                return RadioListTile(
                  title: Text(language),
                  value: language,
                  groupValue: tempSelectedLanguage,
                  onChanged: (String? value) async {
                    if (value != null) {
                      Navigator.of(context).pop(); // Закрыть диалог
                      await _updateLanguage(value);
                    }
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Настройки'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Уведомления'),
            subtitle: Text('Включить или отключить уведомления'),
            value: _notificationsEnabled,
            onChanged: (bool value) async {
              await _updateNotifications(value);
            },
          ),
          SwitchListTile(
            title: Text('Темная тема'),
            subtitle: Text('Использовать темную тему оформления'),
            value: _darkThemeEnabled,
            onChanged: (bool value) async {
              await _updateDarkTheme(value);
            },
          ),
          ListTile(
            title: Text('Язык'),
            subtitle: Text(_selectedLanguage),
            onTap: () {
              _showLanguageDialog();
            },
          ),
          ListTile(
            title: Text('О приложении'),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}
