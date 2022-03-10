import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/note.dart';
import 'package:todo_app/notes/bloc/notes_bloc.dart';

// TODO: Modify and merge this with NewNote to avoid repetition as both are basically equal
class UpdateNote extends StatefulWidget {
  final Note note;

  const UpdateNote({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.note.title;
    _descriptionController.text = widget.note.description;

    void _updateNote(BuildContext context) {
      final titleText = _titleController.text;
      final descriptionText = _descriptionController.text;

      if (titleText.isEmpty || descriptionText.isEmpty) {
        return;
      }

      context
          .read<NotesBloc>()
          .add(UpdateNoteEvent(widget.note, titleText, descriptionText));

      Navigator.of(context).pop();
    }

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
              const Text('Editing note'),
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                textInputAction: TextInputAction.next,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                controller: _descriptionController,
                onSubmitted: (_) => _updateNote(context),
                keyboardType: TextInputType.text,
              ),
              Container(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  child: const Text('Save Edited Note'),
                  onPressed: () => _updateNote(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
