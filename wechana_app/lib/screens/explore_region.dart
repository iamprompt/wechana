import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wechana_app/model/region.dart';
import 'package:wechana_app/model/region_data.dart';

class ExploreRegionScreen extends StatefulWidget {
  const ExploreRegionScreen({Key? key}) : super(key: key);

  static String routeName = 'nearby';

  @override
  State<ExploreRegionScreen> createState() => _ExploreRegionScreenState();
}

class _ExploreRegionScreenState extends State<ExploreRegionScreen> {
  List<Region> _items = [];

  @override
  void initState() {
    super.initState();

    _items = regions;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 25.0,
        crossAxisSpacing: 25.0,
      ),
      padding: const EdgeInsets.all(15.0),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return _buildItem(regions[index]);
      },
    );
  }

  Widget _buildItem(Region region) {
    return Container(
      padding: const EdgeInsets.all(5.0),
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
          context.push('/explore/${region.slug}');
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            region.name + " Region",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [Color(0xFFDA44BB), Color(0xFF8921AA)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ).createShader(const Rect.fromLTRB(0, 0, 100, 100)),
            ),
          ),
        ),
      ),
    );
  }
}
