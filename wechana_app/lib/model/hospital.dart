import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospital.g.dart';

@JsonSerializable()
class Hospital {
  const Hospital({
    required this.id,
    required this.name,
    required this.address,
    required this.province,
    required this.district,
    required this.subDistrict,
    required this.region,
    required this.tel,
    required this.totalBed,
    required this.geolocation,
    required this.googleMapsPlaceId,
    required this.googleMapsPlusCode,
  });

  final String id;
  final Map<String, String> name;
  final Map<String, String> address;
  final Map<String, String> province;
  final Map<String, String> district;
  final Map<String, String> subDistrict;
  final Map<String, String> region;
  final List<String> tel;
  final int totalBed;
  final String googleMapsPlaceId;
  final String googleMapsPlusCode;

  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  final GeoPoint geolocation;

  static GeoPoint _fromJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  static GeoPoint _toJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);
  Map<String, dynamic> toJson() => _$HospitalToJson(this);
}
