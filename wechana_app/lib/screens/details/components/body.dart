import 'package:flutter/material.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/screens/details/components/map_container.dart';

class Body extends StatelessWidget {
  final Hospital hospital;
  const Body({Key? key, required this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          MapDetailsContainer(
            geoLocation: hospital.geolocation,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    hospital.hospitalName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "- ${hospital.province}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
