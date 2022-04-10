import 'package:flutter/material.dart';
import 'package:wechana_app/components/custom_bottom_navbar.dart';
import 'package:wechana_app/screens/explore/components/body.dart';
import 'package:wechana_app/screens/explore/components/app_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exploreAppBar(context),
      body: const Body(),
      bottomNavigationBar: CustomBottonNavBar(),
    );
  }
}
