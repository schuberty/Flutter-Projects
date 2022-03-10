// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/models/note.dart';
import 'package:todo_app/repositories/notes_repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NoteRepository _noteRepository;

  NotesBloc(this._noteRepository) : super(NotesInitialState()) {
    print("### Current State is $state");

    on<InitRepositoryWithNotesEvent>(((event, emit) async {
      await _noteRepository.init().whenComplete(() {
        print("### Loading Notes ${_noteRepository.notes.toString()}");

        emit(NotesLoadedState(_noteRepository.notes));
      });
    }));

    on<AddNoteEvent>(((event, emit) async {
      await _noteRepository
          .addNote(Note(title: event.title, description: event.description));
      print("### Adding Note ${event.title} : ${event.description}");
      emit(NotesLoadedState(_noteRepository.notes));
    }));

    on<UpdateNoteEvent>(((event, emit) async {
      final newNote = event.note;
      newNote.isCompleted = !newNote.isCompleted;
      print("### Updating Note ${event.note.toString()}");
      await _noteRepository
          .updateNote(event.note, newNote)
          .whenComplete(() => emit(NotesLoadedState(_noteRepository.notes)));
    }));
  }
}
