import 'package:flutter/material.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/services/firestore_service.dart';
import 'package:wechana_app/services/geolocator_service.dart';
import 'package:wechana_app/widgets/title_card.dart';
import 'package:geolocator/geolocator.dart';

class NearbyScreen extends StatefulWidget {
  const NearbyScreen({Key? key}) : super(key: key);

  static String routeName = 'nearby';
  static Widget titleElement = Text.rich(
    TextSpan(
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      children: [
        const TextSpan(
          text: 'Nearby Hospital',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Container(
            margin: const EdgeInsets.only(left: 5.0),
            child: const Icon(Icons.local_hospital_rounded),
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  final FirestoreService _firestoreService = FirestoreService.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
      future: determinePosition(),
      builder: (context, event) {
        if (event.hasData) {
          Position position = event.data!;
          return StreamBuilder<List<Hospital>>(
            stream: _firestoreService.getNearbyHospital(
              position.latitude,
              position.longitude,
              radius: 10.0,
            ),
            builder: (ctx, evt) {
              if (evt.hasData) {
                List<Hospital> _items = evt.data!;
                return _buildListView(_items);
              }
              if (evt.connectionState == ConnectionState.done && !evt.hasData) {
                return StreamBuilder<List<Hospital>>(
                  stream: _firestoreService.getHospitals(),
                  builder: (ctxx, evt) {
                    if (evt.hasData) {
                      List<Hospital> _items = evt.data!;
                      return _buildListView(_items);
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        } else if (event.hasError) {
          return Center(
            child: Text('Error: ${event.error}'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  ListView _buildListView(List<Hospital> items) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return titleCard(
          context,
          items[index].name['en']!,
          '/hospital/${items[index].id}',
        );
      },
    );
  }
}
