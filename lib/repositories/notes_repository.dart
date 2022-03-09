import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/note.dart';

class NoteRepository {
  late Box<Note> _notes;

  Future<void> init() async {
    Hive.registerAdapter(NoteAdapter());
    _notes = await Hive.openBox<Note>('notes');

    // if (_notes.isEmpty) {
    //   await _notes.add(
    //     Note(title: 'AOC II', description: 'Class 1'),
    //   );
    //   await _notes.add(
    //     Note(title: 'Intro to AI', description: 'Class 2'),
    //   );
    // }
  }

  List<Note> getNotes() {
    final notes = _notes.values;
    return notes.toList();
  }

  Future<void> addNote(final Note note) async {
    await _notes.add(note);
  }

  Future<void> removeNote(final Note note) async {
    final noteToRemove = _notes.values.firstWhere((element) => element == note);
    await noteToRemove.delete();
  }

  Future<void> updateNote(final Note note, final Note newNote) async {
    final noteToUpdate = _notes.values.firstWhere((element) => element == note);
    final index = noteToUpdate.key as int;
    await _notes.put(index, newNote);
  }

  bool get isEmpty => _notes.isEmpty;
}
