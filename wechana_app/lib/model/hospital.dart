import 'package:latlong2/latlong.dart';

class Hospital {
  final String id,
      hospitalName,
      district,
      subDistrict,
      region,
      province,
      mapUrl,
      tel;
  final LatLng geolocation;

  Hospital({
    required this.id,
    required this.hospitalName,
    required this.district,
    required this.subDistrict,
    required this.region,
    required this.province,
    required this.mapUrl,
    required this.tel,
    required this.geolocation,
  });
}
