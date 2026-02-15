import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../core/hive_boxes.dart';
import '../models/debts.dart';

class DebtorsService {
  static Box<Debts> get _box => Hive.box<Debts>(HiveBoxes.debts);

  // ── CREATE ───────────────────────────────────────
  static Future<int> addDebtor(Debts debts) {
    return _box.add(debts); // returns auto-generated integer key
  }

  // ── READ ─────────────────────────────────────────
  static List<Debts> getAll() => _box.values.toList();

  static Debts? getByKey(int key) => _box.get(key);

  static ValueListenable<Box<Debts>> get listenable => _box.listenable();

  // ── UPDATE ───────────────────────────────────────
  static Future<void> update(int key, Debts updated) {
    return _box.put(key, updated);
  }

  // ── DELETE ───────────────────────────────────────
  static Future<void> delete(int key) {
    return _box.delete(key);
  }

  static Future<void> clearAll() {
    return _box.clear();
  }
}
