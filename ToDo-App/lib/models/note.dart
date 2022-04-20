import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject with EquatableMixin {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late bool isCompleted;

  Note({
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [key];

  @override
  String toString() {
    return 'Note $key: [$title][$isCompleted]: $description';
  }

  Note copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Note(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
