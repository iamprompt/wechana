import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/model/hospital_data.dart';

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
        return _buildItem(_items[index]);
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

  Widget _buildItem(Hospital hospital) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          context.push('/hospital/${hospital.id}');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                hospital.hospitalName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
