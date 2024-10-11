import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class Prac5Screen extends StatelessWidget {
  const Prac5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    String platformMessage = "Не удалось определить платформу.";
    Widget platformSpecificContent;

    if (kIsWeb) {
      platformMessage = "Приложение запущено на Веб.";
      platformSpecificContent = WebFileSystemContent();
    } else if (Platform.isAndroid) {
      platformMessage = "Приложение запущено на Android.";
      platformSpecificContent = AndroidFileSystemContent();
    } else if (Platform.isMacOS) {
      platformMessage = "Приложение запущено на macOS.";
      platformSpecificContent = MacOSFileSystemContent();
    } else {
      platformMessage = "Приложение запущено на другой платформе.";
      platformSpecificContent = DefaultFileSystemContent();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Практическая работа 5"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(platformMessage, style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          platformSpecificContent,
        ],
      ),
    );
  }
}

class WebFileSystemContent extends StatelessWidget {
  const WebFileSystemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Вы используете веб-платформу. Доступ к файловой системе недоступен.",
        style: TextStyle(fontSize: 18, color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AndroidFileSystemContent extends StatefulWidget {
  const AndroidFileSystemContent({super.key});

  @override
  State<StatefulWidget> createState() => _AndroidFileSystemContentState();
}

class _AndroidFileSystemContentState extends State<AndroidFileSystemContent> {
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: const Text("Выбрать файл (Android)"),
          ),
          if (_fileName != null) ...[
            const SizedBox(height: 20),
            Text('Выбранный файл: $_fileName'),
          ],
        ],
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileName = file.name;
      });
    } else {
      setState(() {
        _fileName = null;
      });
    }
  }
}

class MacOSFileSystemContent extends StatefulWidget {
  const MacOSFileSystemContent({super.key});

  @override
  State<StatefulWidget> createState() => _MacOSFileSystemContentState();
}

class _MacOSFileSystemContentState extends State<MacOSFileSystemContent> {
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: const Text("Выбрать файл (macOS)"),
          ),
          if (_fileName != null) ...[
            const SizedBox(height: 20),
            Text('Выбранный файл: $_fileName'),
          ],
        ],
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileName = file.name;
      });
    } else {
      setState(() {
        _fileName = null;
      });
    }
  }
}

class DefaultFileSystemContent extends StatefulWidget {
  const DefaultFileSystemContent({super.key});

  @override
  State<StatefulWidget> createState() => _DefaultFileSystemContentState();
}

class _DefaultFileSystemContentState extends State<DefaultFileSystemContent> {
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: const Text("Выбрать файл (Linux/Windows)"),
          ),
          if (_fileName != null) ...[
            const SizedBox(height: 20),
            Text('Выбранный файл: $_fileName'),
          ],
        ],
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileName = file.name;
      });
    } else {
      setState(() {
        _fileName = null;
      });
      print('Файл не был выбран.');
    }
  }
}