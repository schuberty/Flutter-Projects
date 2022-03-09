import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/models/note.dart';
import 'package:todo_app/repositories/notes_repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NoteRepository _noteRepository;

  NotesBloc(this._noteRepository) : super(NotesInitialState()) {
    on<InitRepositoryWithNodesEvent>(((event, emit) async {
      await _noteRepository.init().whenComplete(() {
        final notes = _noteRepository.getNotes();
        emit(NotesLoadedState(notes));
      });
    }));
  }

  Future initRepository() async {
    _noteRepository.init();
  }
}
