import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
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
            appBar: customAppBar(
              titleElement: const Text(
                'Hospital Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
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
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 30),
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: GestureDetector(
                          onTap: () {
                            launch(
                                'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(hospital.name['en']!)}&query_place_id=${hospital.googleMapsPlaceId}');
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: Color(0xFF8CCF75),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    hospital.address['en']!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      hospital.tel.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    color: Color(0xFF8CCF75),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        hospital.tel.join(', '),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.single_bed_rounded,
                              color: Color(0xFF8CCF75),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '${hospital.totalBed.toString()} bed${hospital.totalBed > 1 ? 's' : ''}',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 15),
                        child: Wrap(
                          spacing: 20,
                          alignment: WrapAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                launch(
                                  'https://www.google.com/maps/dir/?api=1&destination=${Uri.encodeComponent(hospital.address['en']!)}&destination_place_id=${Uri.encodeComponent(hospital.googleMapsPlaceId)}',
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFF8CCF75),
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          child: const Icon(
                                            Icons.map_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const TextSpan(
                                        text: 'Navigate',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            hospital.tel.isNotEmpty
                                ? GestureDetector(
                                    onTap: () {
                                      launch(
                                        'tel:${hospital.tel[0]}',
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFF8CCF75),
                                      ),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                child: const Icon(
                                                  Icons.phone_in_talk_rounded,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            const TextSpan(
                                              text: 'Call Now',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ],
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
