import 'package:bloc_app/todo/blocs/bloc_exports.dart';
import 'package:bloc_app/todo/screens/add_task_screen.dart';
import 'package:bloc_app/todo/screens/drawer.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  void _addTask(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskScreen(titleController: titleController,)
          ),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc,TasksState>(
      builder: (context,state){
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: Text("Task App"),
            actions: [
              IconButton(onPressed: () => _addTask(context),
                  icon: Icon(Icons.add) )
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child:  Chip(
                  label: Text(
                    '${state.allTasks.length} Tasks' ,
                  ),
                ),
              ),
              TasksList(tasksList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed:() => _addTask(context),
            tooltip: "Add Task",
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}


