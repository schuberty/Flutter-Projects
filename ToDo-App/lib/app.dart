import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/notes/bloc/notes_bloc.dart';
import 'package:todo_app/repositories/notes_repository.dart';

final ThemeData _kThemeData = _buildThemeData();

ThemeData _buildThemeData() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith();
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NoteRepository(),
      child: BlocProvider(
        create: (context) => NotesBloc(RepositoryProvider.of(context))
          ..add(InitRepositoryWithNotesEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _kThemeData,
          title: 'ToDo Notes',
          home: const HomePage(),
        ),
      ),
    );
  }
}
