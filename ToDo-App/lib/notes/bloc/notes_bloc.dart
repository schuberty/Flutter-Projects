import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/models/note.dart';
import 'package:todo_app/repositories/notes_repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NoteRepository _noteRepository;

  // TODO: Move each event handler body to a standalone function
  NotesBloc(this._noteRepository) : super(NotesInitialState()) {
    on<InitRepositoryWithNotesEvent>(((event, emit) async {
      await _noteRepository.init().whenComplete(() {
        emit(NotesLoadedState(_noteRepository.notes));
      });
    }));

    on<AddNoteEvent>(((event, emit) async {
      await _noteRepository.addNote(Note(
          title: event.title,
          description: event.description,
          isCompleted: false));
      emit(NotesLoadedState(_noteRepository.notes));
    }));

    on<DeleteNoteEvent>(((event, emit) async {
      await _noteRepository.removeNote(event.note);
      emit(NotesLoadedState(_noteRepository.notes));
    }));

    on<UpdateNoteEvent>(((event, emit) async {
      final newNote = event.noteToUpdate
          .copyWith(title: event.title, description: event.description);
      await _noteRepository.updateNote(event.noteToUpdate, newNote);
      emit(NotesLoadedState(_noteRepository.notes));
    }));

    on<ToggleNoteCompletition>(((event, emit) async {
      final newNote = event.note.copyWith(isCompleted: !event.note.isCompleted);
      await _noteRepository.updateNote(event.note, newNote);
      // .whenComplete(() => emit(NotesLoadedState(_noteRepository.notes)));
      emit(NotesLoadedState(_noteRepository.notes));
    }));
  }
}
