import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Flutter extensions + path helpers

import 'models/task.dart'; // data model + generated adapter
import 'screens/home_screen.dart'; // home screen

void main() async {
  // Ensures Flutter engine is ready before using platform channels / async init
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes Hive with app documents directory (creates .hive files there)
  await Hive.initFlutter();

  // Registers the generated adapter so Hive knows how to serialize/deserialize Task
  Hive.registerAdapter(TaskAdapter());

  // Opens (or creates) a box named 'tasks' that stores Task objects
  // This is asynchronous — must await before reading/writing
  await Hive.openBox<Task>('tasks');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NixGadgets',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}
