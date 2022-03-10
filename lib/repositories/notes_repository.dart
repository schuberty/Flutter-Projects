import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/note.dart';

class NoteRepository {
  late Box<Note> _notes;

  Future<void> init() async {
    Hive.registerAdapter(NoteAdapter());
    _notes = await Hive.openBox<Note>('notes');

    if (_notes.isEmpty) {
      await _notes.add(Note(
        title:
            'This is a titleThis is a titleThis is a titleThis is a titleThis is a title',
        description: 'And this is the description',
        isCompleted: false,
      ));
      await _notes.add(Note(
        title: 'This is a title',
        description: 'And this is the description',
        isCompleted: false,
      ));
      await _notes.add(Note(
        title: 'This is a title',
        description: 'And this is the description',
        isCompleted: false,
      ));
    }
  }

  List<Note> get notes => [..._notes.values.toList()];

  Future<void> addNote(final Note note) async {
    await _notes.add(note);
  }

  Future<void> removeNote(final Note note) async {
    final noteToRemove = _notes.values.firstWhere((element) => element == note);
    await noteToRemove.delete();
  }

  Future<void> updateNote(final Note oldNote, final Note newNote) async {
    final noteToUpdate =
        _notes.values.firstWhere((element) => element == oldNote);
    final index = noteToUpdate.key as int;
    await _notes.put(index, newNote);
  }

  bool get isEmpty => _notes.isEmpty;
}
