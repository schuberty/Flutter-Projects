part of 'notes_bloc.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

class NotesInitialState extends NotesState {}

class NotesLoadedState extends NotesState {
  final List<Note> notes;

  const NotesLoadedState(this.notes);
}
