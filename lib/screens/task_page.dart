import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todo_app/database/db_helper.dart';
import 'package:todo_app/models/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  int taskId = 0;
  String taskTitle = "";
  String taskDescription = "";

  late FocusNode titleFocus, descriptionFocus;

  @override
  void initState() {
    if (widget.task.id != null) {
      taskId = widget.task.id ?? 0;
      taskTitle = widget.task.title ?? "No Title";
      taskDescription = widget.task.description ?? "No description";
    }

    titleFocus = FocusNode();
    descriptionFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    titleFocus.dispose();
    descriptionFocus.dispose();

    super.dispose();
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
                        maxLines: 1,
                        focusNode: titleFocus,
                        onSubmitted: (value) async {
                          if (value != "") {
                            if (widget.task.id == null) {
                              Task _newTask = Task(title: value);
                              taskId =
                                  await databaseHelper.insertTask(_newTask);

                              setState(() {
                                taskTitle = value;
                              });
                            } else {
                              databaseHelper.updateTask(taskId, value);
                            }
                          }

                          descriptionFocus.requestFocus();
                        },
                        controller: TextEditingController()..text = taskTitle,
                        decoration: const InputDecoration(
                            hintText: "Enter Task Title",
                            border: InputBorder.none),
                        style: const TextStyle(
                            fontSize: 22,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              TextField(
                focusNode: descriptionFocus,
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
