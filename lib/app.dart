import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To-Dos App',
      home: HomePage(),
    );
  }
}
