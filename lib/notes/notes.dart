import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/notes/bloc/notes_bloc.dart';
import 'package:todo_app/notes/widgets/note_tile.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      // TODO: Add a Separator after n % 2, n being Notes, for better visualize Notes in list
      builder: (context, state) {
        if (state is NotesLoadedState) {
          return state.notes.isNotEmpty
              ? ListView(
                  children: state.notes
                      .map(
                        (e) => NoteTile(note: e),
                      )
                      .toList(),
                )
              : Container(
                  alignment: Alignment.topCenter,
                  child: _infoWhenEmptyNotes(),
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

  Column _infoWhenEmptyNotes() {
    return Column(
      children: [
        const SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(text: 'You have no Notes!\nType the '),
              WidgetSpan(
                  child: Icon(
                    Icons.add,
                  ),
                  alignment: PlaceholderAlignment.middle),
              TextSpan(text: ' to add a new ToDo Note'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(text: 'After you added a note you can:\n\n'),
              WidgetSpan(
                child: Icon(
                  Icons.swipe_left,
                  color: Colors.red,
                ),
                alignment: PlaceholderAlignment.middle,
              ),
              TextSpan(
                  text: ' Swipe the note to the left to delete it, or\n\n'),
              WidgetSpan(
                child: Icon(
                  Icons.swipe_right,
                  color: Colors.green,
                ),
                alignment: PlaceholderAlignment.middle,
              ),
              TextSpan(text: ' Swipe the note to the right to edit it!'),
            ],
          ),
        )
      ],
    );
  }
}
