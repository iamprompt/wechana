import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar detailsAppBar(BuildContext context) {
  return AppBar(
    elevation: 3,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () => context.pop(),
    ),
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
