import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget customAppBar({dynamic titleElement}) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: const Color(0xFF83D092),
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.vertical(
    //     bottom: Radius.circular(30),
    //   ),
    // ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.vertical(
        //   bottom: Radius.circular(30),
        // ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFF8CCF75), Color(0xFF75CFB8)],
        ),
      ),
    ),
    title: titleElement ??
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
    toolbarHeight: kToolbarHeight + 20,
  );
}
