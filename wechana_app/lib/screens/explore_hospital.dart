import 'package:flutter/material.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/model/hospital_data.dart';
import 'package:wechana_app/widgets/appbar.dart';
import 'package:wechana_app/widgets/title_card.dart';

class ExploreHospitalScreen extends StatefulWidget {
  final String regionSlug, provinceSlug;
  const ExploreHospitalScreen(
      {Key? key, required this.regionSlug, required this.provinceSlug})
      : super(key: key);

  static String routeName = 'explore_hospital';

  @override
  State<ExploreHospitalScreen> createState() => _ExploreHospitalScreenState();
}

class _ExploreHospitalScreenState extends State<ExploreHospitalScreen> {
  List<Hospital> _items = [];

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: ListView.builder(
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
      ),
    );
  }

  Future<void> _loadItems() async {
    setState(() {
      _items = hospitals.where((hosp) {
        return hosp.province.toLowerCase() == widget.provinceSlug.toLowerCase();
      }).toList();
    });

    print('Loaded ${_items.length} items');
  }
}
