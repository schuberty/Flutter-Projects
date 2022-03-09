import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/repositories/notes_repository.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NoteRepository(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-Dos App',
        home: HomePage(),
      ),
    );
  }
}
