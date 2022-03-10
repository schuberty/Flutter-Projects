import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/constants/colors.dart';

void main() async {
  await Hive.initFlutter();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarColor: kBottomNavigationBarColor),
  );

  runApp(const TodoApp());
}
