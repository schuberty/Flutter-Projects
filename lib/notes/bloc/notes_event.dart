part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class InitRepositoryWithNotesEvent extends NotesEvent {
  @override
  List<Object> get props => [];
}

class AddNoteEvent extends NotesEvent {
  final String title;
  final String description;

  const AddNoteEvent(this.title, this.description);

  @override
  List<Object> get props => [title, description];
}

class DeleteNoteEvent extends NotesEvent {
  final Note note;

  const DeleteNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}

class ToggleNoteCompletition extends NotesEvent {
  final Note note;

  const ToggleNoteCompletition(this.note);

  @override
  List<Object> get props => [note];
}
