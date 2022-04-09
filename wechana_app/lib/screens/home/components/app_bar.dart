import 'package:flutter/material.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    // backgroundColor: Colors.white,
    elevation: 3,
    title: RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.titleLarge,
        children: const [
          TextSpan(
            text: "We",
            style: TextStyle(
              color: Colors.amberAccent,
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          TextSpan(
            text: "Chana",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
        ],
      ),
    ),
  );
}
