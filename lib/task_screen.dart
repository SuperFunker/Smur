import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smapp/task_manager.dart';

import 'Task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
        ),
        body: Consumer<TaskManager>(
          builder: (context, taskManager, _) {
            taskManager.fetchTasks();
            final tasks = taskManager.tasks;

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      final updatedTask = Task(
                        id: task.id,
                        title: task.title,
                        description: task.description,
                        dueDate: task.dueDate,
                        dateCreated: task.dateCreated,
                        isCompleted: value ?? false,
                      );
                      taskManager.updateTask(updatedTask);
                      taskManager.saveTasks(); // Save tasks after updating
                    },
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final newTask = Task(
              id: 1,
              title: 'New Task',
              description: 'Description',
              dueDate: DateTime.now(),
              dateCreated: DateTime.now(),
              isCompleted: false,
            );
            Provider.of<TaskManager>(context, listen: false).addTask(newTask);
            Provider.of<TaskManager>(context, listen: false).saveTasks(); // Save tasks after adding
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
