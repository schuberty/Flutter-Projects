import 'package:flutter/material.dart';
import 'package:todo_app/notes/notes.dart';
import 'package:todo_app/widgets/new_note.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Dos'),
      ),
      body: const Notes(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewNote(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  _startAddNewNote(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: const NewNote(),
            behavior: HitTestBehavior.opaque,
          );
        });
  }
}
