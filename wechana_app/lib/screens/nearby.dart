import 'package:flutter/material.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/services/firestore_service.dart';
import 'package:wechana_app/services/geolocator_service.dart';
import 'package:wechana_app/widgets/title_card.dart';
import 'package:geolocator/geolocator.dart';

class NearbyScreen extends StatefulWidget {
  const NearbyScreen({Key? key}) : super(key: key);

  static String routeName = 'nearby';

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  final FirestoreService _firestoreService = FirestoreService.instance;
  List<Hospital> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return titleCard(context, _items[index].name['th']!,
            '/hospital/${_items[index].id}');
      },
    );
  }

  Future<void> _loadItems() async {
    Position position = await determinePosition();

    _firestoreService
        .getNearbyHospital(position.latitude, position.longitude)
        .listen((List<Hospital> hospitals) {
      setState(() {
        _items = hospitals;
      });
    });
  }
}
