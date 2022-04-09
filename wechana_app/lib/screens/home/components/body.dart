import 'package:flutter/material.dart';
import 'package:wechana_app/components/text_headline.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/model/hospital_data.dart';
import 'package:wechana_app/screens/home/components/header.dart';
import 'package:wechana_app/screens/home/components/map_container.dart';
import 'package:wechana_app/screens/home/components/hospital_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        // const Header(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Column(
                children: <Widget>[
                  // TextHeadline(text: "My Location"),
                  // MapHomeContainer(),
                  TextHeadline(text: "Nearby Places"),
                  Column(
                    children: [
                      for (var hospital in hospitals.take(10))
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: HospitalCard(hospital: hospital),
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
