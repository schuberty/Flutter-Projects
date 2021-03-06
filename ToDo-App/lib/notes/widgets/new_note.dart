import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/notes/bloc/notes_bloc.dart';

// TODO: Modify and merge this with UpdateNote to avoid repetition as both are basically equal
class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitNote(BuildContext context) {
    final titleText = _titleController.text;
    final descriptionText = _descriptionController.text;

    if (titleText.isEmpty || descriptionText.isEmpty) {
      return;
    }

    context.read<NotesBloc>().add(AddNoteEvent(titleText, descriptionText));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: [
              const Text('New note'),
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                textInputAction: TextInputAction.next,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                controller: _descriptionController,
                onSubmitted: (_) => _submitNote(context),
                keyboardType: TextInputType.text,
              ),
              Container(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  child: const Text('Add Note'),
                  onPressed: () => _submitNote(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
