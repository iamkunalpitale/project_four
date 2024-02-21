import 'package:flutter/material.dart';
import 'package:project_five/ui/task_screen.dart';
import 'package:provider/provider.dart';
import 'model/task_model.dart';
import 'view_model/task_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskListModel()),
        ChangeNotifierProxyProvider<TaskListModel, TaskListViewModel>(
          create: (_) => TaskListViewModel(Provider.of<TaskListModel>(context, listen: false)),
          update: (_, taskListModel, taskListViewModel) {
            return TaskListViewModel(taskListModel);
          },
        ),
      ],
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TaskScreen(),
      ),
    );
  }
}
