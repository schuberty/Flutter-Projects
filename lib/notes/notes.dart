import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/notes/bloc/notes_bloc.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesBloc>(
      create: (context) => NotesBloc(RepositoryProvider.of(context))
        ..add(InitRepositoryWithNodesEvent()),
      child: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesLoadedState) {
            print("Loaded");
            return ListView(
              children: state.notes
                  .map(
                    (e) => ListTile(
                      title: Text(e.title),
                      subtitle: Text(e.description),
                      trailing: Checkbox(
                        value: e.isCompleted,
                        onChanged: (context) {},
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
      ),
    );
  }
}
