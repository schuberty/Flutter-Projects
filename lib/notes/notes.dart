import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/notes/bloc/notes_bloc.dart';
import 'package:todo_app/services/notes_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) => NotesBloc(
              RepositoryProvider.of<NoteService>(context),
            )),
        child: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            if (state is NotesLoadedState) {
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
            }
            return Container();
          },
        ));
  }
}
