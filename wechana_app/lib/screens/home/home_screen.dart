import 'package:flutter/material.dart';
import 'package:wechana_app/components/custom_bottom_navbar.dart';
import 'package:wechana_app/screens/home/components/app_bar.dart';
import 'package:wechana_app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CustomBottonNavBar(),
    );
  }
}
