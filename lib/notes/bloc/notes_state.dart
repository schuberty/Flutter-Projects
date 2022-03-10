part of 'notes_bloc.dart';

abstract class NotesState extends Equatable {}

class NotesInitialState extends NotesState {
  @override
  List<Object?> get props => [];
}

class NotesLoadedState extends NotesState {
  final List<Note> notes;

  NotesLoadedState(this.notes);

  @override
  List<Object?> get props => [notes];

  NotesLoadedState copyWith({
    List<Note>? notes,
  }) {
    return NotesLoadedState(
      notes ?? this.notes,
    );
  }
}
