import 'package:flutter/material.dart';
import 'package:flutter_appl_tasklist_sqllite/dbhelper.dart';
import 'package:flutter_appl_tasklist_sqllite/task_model.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final dbHelper = DatabaseHelper.instance;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  List<Task> tasks = [];

  @override
  initState() {
    super.initState();
    _refreshTaskList();
  }

  void _refreshTaskList() async {
    List<Task> tasksList = await dbHelper.getAllTasks();
    setState(() {
      tasks = tasksList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQL Task List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addTask() async {
    if (titleController.text.isEmpty) return;
    await dbHelper.insertTask(
      Task(
        title: titleController.text,
        description: descriptionController.text,
        createdAt: DateTime.now(),
      ),
    );
    titleController.clear();
    descriptionController.clear();
  }
}
