import 'package:hive/hive.dart';

/// will be auto generated
/// run this command in the terminal to auto generate this file
/// ''' flutter pub run build_runner build --delete-conflicting-outputs '''
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool isDone;
  @HiveField(2)
  DateTime createdAt;

  Task({required this.title, required this.createdAt, required this.isDone});
}
