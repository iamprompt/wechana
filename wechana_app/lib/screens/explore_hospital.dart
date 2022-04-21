import 'package:flutter/material.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/model/province.dart';
import 'package:wechana_app/services/firestore_service.dart';
import 'package:wechana_app/widgets/appbar.dart';
import 'package:wechana_app/widgets/title_card.dart';

class ExploreHospitalScreen extends StatefulWidget {
  final Province province;
  const ExploreHospitalScreen({Key? key, required this.province})
      : super(key: key);

  static String routeName = 'explore_hospital';

  @override
  State<ExploreHospitalScreen> createState() => _ExploreHospitalScreenState();
}

class _ExploreHospitalScreenState extends State<ExploreHospitalScreen> {
  final FirestoreService _firestoreService = FirestoreService.instance;

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Hospital>>(
      stream:
          _firestoreService.getHospitalsByProvinceSlug(widget.province.slug),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const CircularProgressIndicator(
            color: Color(0xFF8CCF75),
          );
        }

        if (snapshot.hasData) {
          List<Hospital> _items = snapshot.data!;
          return Scaffold(
            appBar: customAppBar(
              context: context,
              titleElement: Text(
                widget.province.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.all(15.0),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                Hospital hosp = _items[index];

                return titleCard(
                  context,
                  _items[index].name['en']!,
                  '/hospital/${hosp.id}',
                );
              },
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF8CCF75),
          ),
        );
      },
    );
  }

  Future<void> _loadItems() async {
    // setState(() {
    //   _items = hospitals.where((hosp) {
    //     return hosp.province.toLowerCase() == widget.provinceSlug.toLowerCase();
    //   }).toList();
    // });

    // print('Loaded ${_items.length} items');
  }
}
