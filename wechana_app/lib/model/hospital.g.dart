// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hospital _$HospitalFromJson(Map<String, dynamic> json) => Hospital(
      id: json['id'] as String,
      name: Map<String, String>.from(json['name'] as Map),
      address: Map<String, String>.from(json['address'] as Map),
      province: Map<String, String>.from(json['province'] as Map),
      district: Map<String, String>.from(json['district'] as Map),
      subDistrict: Map<String, String>.from(json['subDistrict'] as Map),
      region: Map<String, String>.from(json['region'] as Map),
      tel: (json['tel'] as List<dynamic>).map((e) => e as String).toList(),
      totalBed: json['totalBed'] as int,
      geolocation: Hospital._fromJsonGeoPoint(json['geolocation'] as GeoPoint),
      googleMapsPlaceId: json['googleMapsPlaceId'] as String,
      googleMapsPlusCode: json['googleMapsPlusCode'] as String,
    );

Map<String, dynamic> _$HospitalToJson(Hospital instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'province': instance.province,
      'district': instance.district,
      'subDistrict': instance.subDistrict,
      'region': instance.region,
      'tel': instance.tel,
      'totalBed': instance.totalBed,
      'googleMapsPlaceId': instance.googleMapsPlaceId,
      'googleMapsPlusCode': instance.googleMapsPlusCode,
      'geolocation': Hospital._toJsonGeoPoint(instance.geolocation),
    };
