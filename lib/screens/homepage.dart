import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_card.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  homePageState createState() => homePageState();
}

class homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: (){

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
                    margin: const EdgeInsets.fromLTRB(15,0,15,0),
                    child: ClipRRect(
                        child: Image.asset(
                          'images/todo.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.scaleDown,
                        )),
                  ),
                  const taskCard(),
                  const taskCard(),
                ],
              ))),
    );
  }
}
