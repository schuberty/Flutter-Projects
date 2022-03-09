import 'package:flutter/material.dart';
import 'package:todo_app/notes/notes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Dos'),
      ),
      body: Notes(),
    );
  }
}
