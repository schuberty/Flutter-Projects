import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/models/note.dart';
import 'package:todo_app/repositories/notes_repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NoteRepository _noteRepository;

  NotesBloc(this._noteRepository) : super(NotesInitialState()) {
    on<InitRepositoryWithNotesEvent>(((event, emit) async {
      await _noteRepository.init().whenComplete(() {
        final notes = _noteRepository.getNotes();
        emit(NotesLoadedState(notes));
      });
    }));

    on<AddNoteEvent>(((event, emit) async {
      await _noteRepository
          .addNote(Note(title: event.title, description: event.description));
      final notes = _noteRepository.getNotes();
      emit(NotesLoadedState(notes));
    }));

    on<UpdateNoteEvent>(((event, emit) async {
      final newNote = event.note;
      newNote.isCompleted = !newNote.isCompleted;
      final notes = _noteRepository.getNotes();
      await _noteRepository
          .updateNote(event.note, newNote)
          .whenComplete(() => emit(NotesLoadedState(notes)));
    }));
  }
}
