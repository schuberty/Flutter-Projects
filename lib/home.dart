import 'package:flutter/material.dart';
import 'package:todo_app/notes/notes.dart';
import 'package:todo_app/notes/widgets/new_note.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Notes'),
      ),
      // TODO: Fix FloatingActionButton overriding Notes when list gets out of screen
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewNote(context),
        child: const Icon(Icons.add),
      ),
      body: const Notes(),
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
      },
    );
  }
}
