import 'package:flutter/material.dart';
import 'package:wechana_app/screens/explore_region.dart';
import 'package:wechana_app/screens/nearby.dart';
import 'package:wechana_app/widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  final int selectedIndex;
  const HomeScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Index of the selected tab

  // List of widgets tab
  final List<Widget> tabs = const [
    NearbyScreen(),
    ExploreRegionScreen(),
    Text('Tab 3'),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      backgroundColor: Colors.white,
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me_rounded),
            label: 'Nearby',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10.0,
        selectedItemColor: const Color(0xFF2F80ED),
        unselectedItemColor: const Color(0xFF333333),
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
      ),
    );
  }
}
