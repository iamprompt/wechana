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

  Stream<List<Hospital>> getHospitals() {
    const String path = 'hospitals';
    final CollectionReference collection = _firebaseFirestore.collection(path);

    return collection.limit(10).snapshots().map<List<Hospital>>((event) {
      print(event.docs);
      return event.docs.map<Hospital>(
        (snapshot) {
          final Map<String, dynamic> data =
              snapshot.data()! as Map<String, dynamic>;
          print(data);
          return Hospital.fromJson(data);
        },
      ).toList();
    });
  }

  Stream<Hospital> getHospitalById(String id) {
    final String path = 'hospitals/$id';
    final Stream<DocumentSnapshot> snapshots =
        _firebaseFirestore.doc(path).snapshots();

    return snapshots.map(
      (DocumentSnapshot snapshot) {
        final Map<String, dynamic> data =
            snapshot.data()! as Map<String, dynamic>;

        data['id'] = snapshot.id;

        return Hospital.fromJson(data);
      },
    );
  }

  Stream<List<Hospital>> getNearbyHospital(double lat, double lng) {
    GeoFirePoint center = geo.point(latitude: lat, longitude: lng);
    var collection = _firebaseFirestore.collection('hospitals');
    double radius = 10;
    String field = 'position';
    print('${center.latitude}, ${center.longitude}');

    var stream = geo.collection(collectionRef: collection).within(
          center: center,
          radius: radius,
          field: field,
        );

    return stream.map<List<Hospital>>((event) {
      return event.map<Hospital>((snapshot) {
        final Map<String, dynamic> data = snapshot.data()!;
        return Hospital.fromJson(data);
      }).toList();
    });
  }
}
