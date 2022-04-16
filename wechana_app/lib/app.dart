import 'package:flutter/material.dart';
import 'package:wechana_app/router.dart';
import 'package:wechana_app/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WeChana',
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: getTheme(),
    );
  }
}
