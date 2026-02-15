import 'package:hive/hive.dart'; // Imports core Hive annotations & HiveObject

// runt the command below to auto-generate the 'task.g.dart' file
// flutter pub run build_runner build --delete-conflicting-outputs
part 'task.g.dart'; // ← Tells Dart that generated code lives here (created by build_runner)

// Marks this class as a HiveType so an adapter can be generated
@HiveType(
  typeId: 0,
) // typeId must be unique (0–223), used to identify type in storage
class Task extends HiveObject {
  // Extending HiveObject gives .key, .save(), .delete() convenience methods

  @HiveField(
    0,
  ) // Field index — must be unique & stable (never change after first use)
  String title; // The main task description

  @HiveField(1)
  bool isDone; // Completion status (defaults to false)

  @HiveField(2)
  DateTime createdAt; // Timestamp when task was created

  // Constructor with required fields + default values
  Task({required this.title, this.isDone = false, required this.createdAt});
}
