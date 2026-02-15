import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nixgadget/models/task.dart';

void main() async {
  /// always bind the widget before any event is been called
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize Hive + register adapter
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());

  /// open the box (do this once)
  await Hive.openBox<Task>('task');
}
