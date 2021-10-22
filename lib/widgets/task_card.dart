import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todo_app/models/task.dart';

class taskCard extends StatefulWidget {
  
  const taskCard({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  _taskCardState createState() => _taskCardState();
}

class _taskCardState extends State<taskCard> {
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
