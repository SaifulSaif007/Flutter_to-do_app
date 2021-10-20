import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
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
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Task Title", border: InputBorder.none),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: "Enter Task Description",
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
            ),
          )
        ],
      )),
    ));
  }
}
