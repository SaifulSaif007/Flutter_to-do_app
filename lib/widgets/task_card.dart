import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todo_app/models/task.dart';

class TaskCard extends StatefulWidget {
  
  const TaskCard({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  TaskCardState createState() => TaskCardState();
}

class TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.task.title ?? "Un-named task",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.indigo),
            ),
            subtitle: Text(
              widget.task.description ?? "No description added",
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
