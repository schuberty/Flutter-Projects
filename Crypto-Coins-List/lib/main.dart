import 'package:crypto_list/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  _initialConfiguration();

  runApp(const CoinsApp());
}

void _initialConfiguration() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF303030),
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
