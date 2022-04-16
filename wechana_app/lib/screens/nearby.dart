import 'package:flutter/material.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/model/hospital_data.dart';
import 'package:wechana_app/widgets/title_card.dart';

class NearbyScreen extends StatefulWidget {
  const NearbyScreen({Key? key}) : super(key: key);

  static String routeName = 'nearby';

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  List<Hospital> _items = [];

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15.0),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        Hospital hosp = _items[index];

        return titleCard(
          context,
          _items[index].hospitalName,
          '/hospital/${hosp.id}',
        );
      },
    );
  }

  Future<void> _loadItems() async {
    final hospital = hospitals.take(20);

    setState(() {
      _items = hospital.toList();
    });

    print('Loaded ${_items.length} items');
  }
}
