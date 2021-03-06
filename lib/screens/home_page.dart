import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/db_helper.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:todo_app/screens/task_page.dart';
import 'package:todo_app/widgets/slideable_widget.dart';
import 'package:todo_app/widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    Provider.of<TaskProvider>(context).getTasks();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskPage(task: Task())),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: ClipRRect(
                        child: Image.asset(
                      'images/todo.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.scaleDown,
                    )),
                  ),
                  Expanded(
                    child: Consumer<TaskProvider>(
                        builder: (context, taskprovider, _) => ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: taskprovider.taskList.length,
                            itemBuilder: (_, int index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TaskPage(
                                            task:
                                                taskprovider.taskList[index])),
                                  );
                                },
                                child: SlideableWidget(
                                    onSlideAction: (action) => onSlideAction(
                                        taskprovider.taskList[index]),
                                    child: TaskCard(
                                        task: taskprovider.taskList[index]))))),
                  )
                ],
              ))),
    );
  }

  onSlideAction(Task task) {
    if (task.id != null) {
      databaseHelper.deleteTask(task.id ?? 0);
    }

    final snackBar = SnackBar(
      content: const Text('Task deleted .'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            databaseHelper.insertTask(task);
          }),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
