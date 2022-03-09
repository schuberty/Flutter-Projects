part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class InitRepositoryWithNodesEvent extends NotesEvent {
  @override
  List<Object> get props => [];
}
