import 'package:bloc_app/todo/blocs/bloc_exports.dart';
import 'package:bloc_app/todo/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasksList;
  const TasksList({Key? key, required this.tasksList}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.tasksList.length,
          itemBuilder: (context,index){
            var task = widget.tasksList[index];
            return TaskTile(task: task);
          }
      ),
    );
  }
}
