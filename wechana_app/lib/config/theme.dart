import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme = ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
  ),
);
