import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/task.dart';

class HiveService {
  // Constant — name of the box (should match the one opened in main)
  static const String boxName = 'tasks';

  // Static reference — we'll assign it after opening
  static late Box<Task> _box;

  // Optional helper — can be called if you want cleaner service init
  // But in this example we already opened the box in main()
  static Future<void> init() async {
    _box = Hive.box<Task>(boxName);
  }

  // ── CREATE ───────────────────────────────────────────────
  // Adds new task → Hive automatically assigns next integer key
  static Future<void> addTask(Task task) async {
    await _box.add(
      task,
    ); // returns the auto-generated key (but we usually don't need it here)
  }

  // ── READ ─────────────────────────────────────────────────
  static List<Task> getAllTasks() {
    return _box.values.toList(); // .values returns Iterable<Task>
  }

  // Best way for reactive UI — listens to box changes automatically
  static ValueListenable<Box<Task>> get tasksListenable => _box.listenable();

  // ── UPDATE ───────────────────────────────────────────────
  // Replaces task at specific key with updated instance
  static Future<void> updateTask(int key, Task updatedTask) async {
    await _box.put(key, updatedTask); // put() overwrites if key exists
  }

  // ── DELETE ───────────────────────────────────────────────
  static Future<void> deleteTask(int key) async {
    await _box.delete(key); // removes entry with this key
  }

  // Clear entire box (useful for testing / reset)
  static Future<void> clearAll() async {
    await _box.clear();
  }

  // Get single task (returns null if key doesn't exist)
  static Task? getTask(int key) => _box.get(key);
}
