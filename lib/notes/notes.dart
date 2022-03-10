import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/note.dart';
import 'package:todo_app/notes/bloc/notes_bloc.dart';
import 'package:todo_app/notes/widgets/note_tile.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        if (state is NotesLoadedState) {
          return ListView(
            children: state.notes
                .map(
                  (e) => NoteTile(note: e),
                )
                .toList(),
          );
        } else if (state is NotesInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}
