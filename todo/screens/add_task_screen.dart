import 'package:bloc_app/todo/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class AddTaskScreen extends StatelessWidget {
  final TextEditingController titleController;
  const AddTaskScreen({Key? key, required this.titleController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Add Task",style: TextStyle(fontSize: 24),),
          SizedBox(height: 10,),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text("Title"),
                border: OutlineInputBorder( )
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child:const Text("Cancel")
              ),
              ElevatedButton(
                  onPressed: (){
                    var task = Task(
                      id: uuid.v1(),
                        title: titleController.text
                    );
                    if(titleController.text.trim() != "") {
                      context.read<TasksBloc>().add(AddTask(task: task));
                    }
                    titleController.text = "";
                    Navigator.pop(context);
                  },
                  child: const Text("Add")
              )
            ],
          ),
        ],
      ),
    );
  }
}
