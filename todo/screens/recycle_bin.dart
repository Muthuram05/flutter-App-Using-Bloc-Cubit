import 'package:flutter/material.dart';
import '../widgets/tasks_list.dart';
import 'drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recycle Bin"),
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(Icons.add) )
        ],
      ),
      drawer: const MyDrawer(),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text(
                'Tasks' ,
              ),
            ),
          ),
          TasksList(tasksList: [])
        ],
      ),
    );
  }
}
