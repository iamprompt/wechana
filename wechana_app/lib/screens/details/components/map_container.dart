import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:wechana_app/components/street_map.dart';

class MapDetailsContainer extends StatelessWidget {
  final LatLng geoLocation;
  const MapDetailsContainer({
    Key? key,
    required this.geoLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: StreetMap(
        center: geoLocation,
        geoLocation: geoLocation,
      ),
    );
  }
}
