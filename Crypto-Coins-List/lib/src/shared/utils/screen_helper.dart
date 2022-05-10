import 'package:flutter/cupertino.dart';

class ScreenHelper {
  late Size size;
  late double height;
  late double width;

  ScreenHelper({required BuildContext context}) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
  }
}
