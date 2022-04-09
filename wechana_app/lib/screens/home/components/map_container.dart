import 'package:flutter/material.dart';
import 'package:wechana_app/components/street_map.dart';

class MapHomeContainer extends StatelessWidget {
  const MapHomeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF103CAB), width: 8),
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const StreetMap(),
      ),
    );
  }
}
