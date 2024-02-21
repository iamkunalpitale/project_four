import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/task_model.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TextEditingController _taskController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController();
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TaskListModel>(
              builder: (context, taskListModel, child) {
                return ListView.builder(
                  itemCount: taskListModel.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskListModel.tasks[index];
                    return ListTile(
                      title: Text(task.title),
                      trailing: Checkbox(
                        value: task.isDone,
                        onChanged: (_) {
                          taskListModel.toggleTaskStatus(index);
                        },
                      ),
                      onLongPress: () {
                        taskListModel.deleteTask(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _taskController, // Assign the controller
              decoration: InputDecoration(
                labelText: 'Enter a task',
              ),
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  Provider.of<TaskListModel>(context, listen: false).addTask(value);
                  _taskController.clear(); // Clear the text field
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
