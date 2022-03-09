import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/models/note.dart';
import 'package:todo_app/services/notes_service.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NoteService _noteService;

  NotesBloc(this._noteService) : super(NotesInitial()) {
    on<NotesEvent>((event, emit) {});
    on<LoadNotesEvent>(((event, emit) {
      final notes = _noteService.getNotes();
      emit(NotesLoadedState(notes));
    }));
  }
}
