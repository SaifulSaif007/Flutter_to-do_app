import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todo_app/database/db_helper.dart';
import 'package:todo_app/models/task.dart';

class TaskPage extends StatefulWidget {
  TaskPage({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String taskTitle = "";
  String taskDescription = "";

  @override
  void initState() {
    print(widget.task.id);

    if (widget.task.id != null) {
      taskTitle = widget.task.title ?? "No Title";
      taskDescription = widget.task.description ?? "No description";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.delete),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: ClipRRect(
                            child: Image.asset(
                          'images/back_arrow.png',
                          height: 35,
                          width: 25,
                          fit: BoxFit.scaleDown,
                        )),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) async {
                          if (value != "") {
                            DatabaseHelper databaseHelper = DatabaseHelper();
                            Task _newTask = Task(title: value);
                            await databaseHelper.insertTask(_newTask);
                          }
                        },
                        controller: TextEditingController()..text = taskTitle,
                        decoration: const InputDecoration(
                            hintText: "Enter Task Title",
                            border: InputBorder.none),
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
               TextField(
                controller: TextEditingController()..text = taskDescription,
                decoration: const InputDecoration(
                  hintText: "Enter Task Description",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 24),
                ),
              )
            ],
          ),
        ));
  }
}
