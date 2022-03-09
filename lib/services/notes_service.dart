import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/note.dart';

class NoteService {
  late Box<Note> _notes;

  Future<void> init() async {
    Hive.registerAdapter(NoteAdapter());
    _notes = await Hive.openBox<Note>('notes');
  }

  List<Note> getNotes() {
    final notes = _notes.values;
    return notes.toList();
  }

  void addNote(final Note note) {
    _notes.add(note);
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
}
