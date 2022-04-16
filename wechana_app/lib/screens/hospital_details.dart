import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:wechana_app/config/map_config.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/widgets/appbar.dart';

class HospitalDetailScreen extends StatefulWidget {
  final Hospital hospital;
  const HospitalDetailScreen({Key? key, required this.hospital})
      : super(key: key);

  @override
  State<HospitalDetailScreen> createState() => _HospitalDetailScreenState();
}

class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: FlutterMap(
                options: MapOptions(
                  center: widget.hospital.geolocation,
                  zoom: 15.0,
                ),
                layers: [
                  osmLayer(),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: widget.hospital.geolocation,
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 15),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  widget.hospital.hospitalName,
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
