import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/note.dart';
import 'package:todo_app/notes/bloc/notes_bloc.dart';
import 'package:todo_app/notes/widgets/update_note.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  const NoteTile({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(note.key.toString()),
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: const Icon(Icons.edit),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete_forever),
      ),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          context.read<NotesBloc>().add(DeleteNoteEvent(note));
        }
      },
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Removed note: ${note.title}',
                softWrap: true,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              behavior: SnackBarBehavior.fixed,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20), bottom: Radius.zero),
              ),
              backgroundColor: kAppBarBackgroundColor,
            ),
          );
          return true;
        } else if (direction == DismissDirection.startToEnd) {
          _startUpdateNote(context, note);
          return false;
        }
        return false;
      },
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.description),
        trailing: Checkbox(
          value: note.isCompleted,
          onChanged: (_) {
            context.read<NotesBloc>().add(ToggleNoteCompletition(note));
          },
        ),
      ),
    );
  }

  // TODO: Merge this dynamic function with NewNote building widget
  _startUpdateNote(BuildContext context, Note note) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: UpdateNote(note: note),
            behavior: HitTestBehavior.opaque,
          );
        });
  }
}
