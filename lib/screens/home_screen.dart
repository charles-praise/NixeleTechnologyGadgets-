import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/task.dart';
import '../service/hive_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _titleController = TextEditingController(); // Controls text input field

  @override
  void dispose() {
    _titleController.dispose(); // Prevent memory leak
    super.dispose();
  }

  // Called when user presses ADD button
  void _addTask() async {
    if (_titleController.text.trim().isEmpty) return; // Prevent empty tasks

    // Create new Task instance with current input + timestamp
    final task = Task(
      title: _titleController.text.trim(),
      createdAt: DateTime.now(),
    );

    await HiveService.addTask(task); // Persist to Hive
    _titleController.clear(); // Reset input field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Todo CRUD'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () async {
              await HiveService.clearAll(); // Deletes everything (with confirmation in real app)
              // ScaffoldMessenger.of(context).showSnackBar(...); ← optional feedback
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Input area
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'New task...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(onPressed: _addTask, child: const Text('ADD')),
              ],
            ),
          ),

          // Reactive list — rebuilds automatically when box changes
          Expanded(
            child: ValueListenableBuilder<Box<Task>>(
              valueListenable:
                  HiveService.tasksListenable, // Listens to any put/add/delete
              builder: (context, box, _) {
                // Get tasks and sort newest first
                final tasks =
                    box.values.toList()
                      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

                if (tasks.isEmpty) {
                  return const Center(child: Text('No tasks yet ¯\\_(ツ)_/¯'));
                }

                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    // Important: get the real storage key for this position
                    final key = box.keyAt(index) as int;

                    return ListTile(
                      leading: Checkbox(
                        value: task.isDone,
                        onChanged: (value) {
                          // Create updated version (immutable pattern — good practice)
                          task.isDone = value ?? false;
                          HiveService.updateTask(key, task); // Save change
                        },
                      ),
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration:
                              task.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      subtitle: Text(
                        task.createdAt.toString().substring(0, 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => HiveService.deleteTask(key),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
