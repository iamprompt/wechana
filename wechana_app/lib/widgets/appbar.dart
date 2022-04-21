import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget customAppBar({
  dynamic titleElement,
  BuildContext? context,
  bool? aboutus = true,
}) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: const Color(0xFF83D092),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFF8CCF75), Color(0xFF75CFB8)],
        ),
      ),
    ),
    title: GestureDetector(
      onLongPress: () {
        print('pressed');
        if (context != null && aboutus != false) {
          context.push('/aboutus');
        }
      },
      child: titleElement ??
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: [
                const TextSpan(
                  text: 'WeChana',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Container(
                    margin: const EdgeInsets.only(left: 5.0),
                    child: const Icon(Icons.local_hospital_rounded),
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
    ),
    toolbarHeight: kToolbarHeight + 20,
  );
}
