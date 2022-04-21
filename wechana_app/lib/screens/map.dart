import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/services/firestore_service.dart';
import 'package:wechana_app/services/geolocator_service.dart';
import 'package:wechana_app/widgets/title_card.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);
  static Widget titleElement = Text.rich(
    TextSpan(
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      children: [
        const TextSpan(
          text: 'Map',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Container(
            margin: const EdgeInsets.only(left: 5.0),
            child: const Icon(Icons.local_hospital_rounded),
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final FirestoreService _firestoreService = FirestoreService.instance;
  final Completer<GoogleMapController> _controller = Completer();
  final Map<String, Marker> _markers = {};

  Hospital? _selectedHospital = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
      future: determinePosition(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Position position = snapshot.data!;
          return Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 13.0,
                  ),
                  onMapCreated: _onMapCreated,
                  onCameraMove: (position) {
                    _queryNearbyHospital(
                      position.target.latitude,
                      position.target.longitude,
                    );
                  },
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  markers: _markers.values.toSet(),
                ),
              ),
              _selectedHospital != null
                  ? Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: titleCard(
                            context,
                            _selectedHospital!.name['en']!,
                            '/hospital/${_selectedHospital!.id}',
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Color(0xFF8CCF75),
        ));
      },
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    Position myPosition = await determinePosition();
    _queryNearbyHospital(myPosition.latitude, myPosition.longitude);
  }

  Future<void> _queryNearbyHospital(double latitude, double longitude) async {
    _firestoreService
        .getNearbyHospital(
      latitude,
      longitude,
      radius: 5.0,
    )
        .listen(
      (hospitals) {
        _updateMarkers(hospitals);
      },
    );
  }

  void _updateMarkers(List<Hospital> hospitals) async {
    setState(() {
      _markers.clear();
      for (final hospital in hospitals) {
        final marker = _createHospitalMarker(hospital);
        _markers[hospital.id] = marker;
      }
    });
  }

  Marker _createHospitalMarker(Hospital hospital) {
    return Marker(
      markerId: MarkerId(hospital.name['en']!),
      position:
          LatLng(hospital.geolocation.latitude, hospital.geolocation.longitude),
      onTap: () {
        setState(() {
          _selectedHospital = hospital;
        });
      },
    );
  }
}
