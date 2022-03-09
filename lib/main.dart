import 'package:flutter/material.dart';
import 'package:todo_app/app.dart';

void main() {
  runApp(const TodoApp());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
