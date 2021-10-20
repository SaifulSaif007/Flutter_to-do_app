import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';



class taskCard extends StatefulWidget {
  const taskCard({Key? key}) : super(key: key);

  @override
  _taskCardState createState() => _taskCardState();
}

class _taskCardState extends State<taskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      Column(
        children: const [
          ListTile(
            title: Text('Task Title here',
            style:
            TextStyle( fontSize: 16, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis,
                color: Colors.indigo ),
            ),
            subtitle: Text('Task Details ',
              maxLines: 2,
              style: TextStyle( fontSize: 14, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis,
              color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
