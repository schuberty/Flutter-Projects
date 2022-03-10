import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/notes/bloc/notes_bloc.dart';

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
                  (e) => Dismissible(
                    key: Key(e.key.toString()),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete_forever),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        context.read<NotesBloc>().add(DeleteNoteEvent(e));
                      }
                    },
                    child: ListTile(
                      title: Text(e.title),
                      subtitle: Text(e.description),
                      trailing: Checkbox(
                        value: e.isCompleted,
                        onChanged: (_) {
                          context
                              .read<NotesBloc>()
                              .add(ToggleNoteCompletition(e));
                        },
                      ),
                    ),
                  ),
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
