import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/services/firestore_service.dart';
import 'package:wechana_app/widgets/appbar.dart';

class HospitalDetailScreen extends StatefulWidget {
  final String hId;
  const HospitalDetailScreen({Key? key, required this.hId}) : super(key: key);

  @override
  State<HospitalDetailScreen> createState() => _HospitalDetailScreenState();
}

class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
  final FirestoreService _firestoreService = FirestoreService.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Hospital>(
      stream: _firestoreService.getHospitalById(widget.hId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          Hospital hospital = snapshot.data!;
          return Scaffold(
            appBar: customAppBar(),
            body: Column(
              children: <Widget>[
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        hospital.geolocation.latitude + 0.002,
                        hospital.geolocation.longitude,
                      ),
                      zoom: 15.0,
                    ),
                    myLocationButtonEnabled: false,
                    myLocationEnabled: false,
                    markers: <Marker>{
                      Marker(
                        markerId: MarkerId(hospital.id.toString()),
                        position: LatLng(
                          hospital.geolocation.latitude,
                          hospital.geolocation.longitude,
                        ),
                        infoWindow: InfoWindow(
                          title: hospital.name['en']!,
                          snippet: hospital.region['en']!,
                        ),
                        icon: BitmapDescriptor.defaultMarker,
                      ),
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      hospital.name['en']!,
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
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
