import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:todo_app/notes/bloc/notes_bloc.dart';
import 'package:todo_app/repositories/notes_repository.dart';

void main() {
  group(
    'NotesBloc',
    () {
      late NoteRepository noteRepository;
      late NotesBloc notesBloc;

      setUp(() async {
        await setUpTestHive();
        noteRepository = NoteRepository();
        notesBloc = NotesBloc(noteRepository);
      });

      test('check if first state is NotesInitialState() in bloc.state.', () {
        expect(notesBloc.state, NotesInitialState());
      });

      test('check if state props from NotesInitialState() is empty.', () {
        expect(notesBloc.state.props, []);
      });

      blocTest<NotesBloc, NotesState>(
        'emits InitRepositoryWithNotesEvent() to initialize repository and check if it\'s notes Box is empty.',
        build: () => notesBloc,
        act: (_) => notesBloc.add(InitRepositoryWithNotesEvent()),
        expect: () => [],
      );

      // TODO: Implement check if Note model copyWith is equal to copied Note.

      // TODO: Implement emit AddNoteEvent(...) and expect NotesLoadedState[...] with one and same added Note.
      // TODO: Implement emit ToggleNoteCompletition(...) and expect NotesLoadedState[...] with Note having isCompleted checked true.
      // TODO: Implement emition for testing DeleteNoteEvent and UpdateNoteEvent.
    },
  );
}
