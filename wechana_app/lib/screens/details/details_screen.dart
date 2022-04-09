import 'package:flutter/material.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/screens/details/components/app_bar.dart';
import 'package:wechana_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Hospital hospital;

  const DetailsScreen({Key? key, required this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsAppBar(context),
      body: Body(
        hospital: hospital,
      ),
    );
  }
}
