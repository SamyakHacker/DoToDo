import 'package:dotodo/models/task.dart';
import 'package:dotodo/screens/home/task_list.dart';
import 'package:dotodo/screens/home/task_tile.dart';
import 'package:dotodo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dotodo/services/database.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Task>>.value(
      value: DatabaseService().tasks,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent[500],
            title: Text("Do-ToDo"),
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                label: Text('LogOut'),
                icon: Icon(Icons.person_outline),
              ),
            ],
          ),
          body: TaskList()),
    );
  }


}
