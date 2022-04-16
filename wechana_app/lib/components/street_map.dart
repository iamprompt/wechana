import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class StreetMap extends StatelessWidget {
  final LatLng? center;
  final LatLng? geoLocation;
  const StreetMap({Key? key, this.center, this.geoLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: center ?? LatLng(13.7530071, 100.5070797),
        zoom: 13.0,
      ),
      children: <Widget>[
        TileLayerWidget(
            options: TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'])),
        MarkerLayerWidget(
            options: MarkerLayerOptions(
          markers: [
            Marker(
              width: 100.0,
              height: 100.0,
              point: geoLocation ?? LatLng(13.7530071, 100.5070797),
              builder: (ctx) => const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
            ),
          ],
        )),
      ],
    );
  }
}
