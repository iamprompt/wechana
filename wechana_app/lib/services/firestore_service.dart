import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wechana_app/model/hospital.dart';

class FirestoreService {
  final geo = Geoflutterfire();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Singleton setup: prevents multiple instances of this class.
  FirestoreService._();
  static final FirestoreService _service = FirestoreService._();
  factory FirestoreService() => _service;

  static FirestoreService get instance => _service;

  Stream<List<Hospital>> getHospitals({int? limit}) {
    final CollectionReference collection =
        _firebaseFirestore.collection('hospitals');

    return collection
        .limit(limit ?? 10)
        .snapshots()
        .map<List<Hospital>>((event) {
      return event.docs.map<Hospital>(
        (snapshot) {
          final Map<String, dynamic> data =
              snapshot.data()! as Map<String, dynamic>;
          return Hospital.fromJson(data);
        },
      ).toList();
    });
  }

  Stream<Hospital> getHospitalById(String id) {
    final Stream<DocumentSnapshot> snapshots =
        _firebaseFirestore.doc('hospitals/$id').snapshots();

    return snapshots.map(
      (DocumentSnapshot snapshot) {
        final Map<String, dynamic> data =
            snapshot.data()! as Map<String, dynamic>;

        data['id'] = snapshot.id;

        return Hospital.fromJson(data);
      },
    );
  }

  Stream<List<Hospital>> getHospitalsByProvinceSlug(String slug) {
    final CollectionReference collection =
        _firebaseFirestore.collection('hospitals');

    return collection
        .where('province.slug', isEqualTo: slug)
        .snapshots()
        .map<List<Hospital>>((event) {
      return event.docs.map<Hospital>(
        (snapshot) {
          final Map<String, dynamic> data =
              snapshot.data()! as Map<String, dynamic>;
          return Hospital.fromJson(data);
        },
      ).toList();
    });
  }

  Stream<List<Hospital>> getNearbyHospital(double lat, double lng,
      {double? radius, int? limit}) {
    GeoFirePoint center = geo.point(latitude: lat, longitude: lng);
    var collection =
        _firebaseFirestore.collection('hospitals').limit(limit ?? 10);
    double _radius = radius ?? 10.0;
    String field = 'position';

    var stream = geo.collection(collectionRef: collection).within(
          center: center,
          radius: _radius,
          field: field,
          strictMode: true,
        );

    return stream.map<List<Hospital>>((event) {
      return event.map<Hospital>((snapshot) {
        final Map<String, dynamic> data = snapshot.data()!;
        return Hospital.fromJson(data);
      }).toList();
    });
  }
}
