import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wechana_app/components/custom_bottom_navbar.dart';
import 'package:wechana_app/config/theme.dart';
import 'package:wechana_app/model/hospital.dart';
import 'package:wechana_app/model/hospital_data.dart';
import 'package:wechana_app/screens/details/details_screen.dart';
import 'package:wechana_app/screens/explore/explore_screen.dart';
import 'package:wechana_app/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'WeChana',
    //   debugShowCheckedModeBanner: false,
    //   theme: theme,
    //   home: const HomeScreen(),
    // );
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'WeChana',
      debugShowCheckedModeBanner: false,
      theme: theme,
      // home: const HomeScreen(),
    );
  }

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'Home',
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: 'Details',
        path: '/hospital/:id',
        builder: (context, state) {
          final Hospital hospital = getHospitalById(state.params['id']!);
          return DetailsScreen(hospital: hospital);
        },
      ),
      GoRoute(
        name: 'Explore',
        path: '/explore',
        builder: (context, state) {
          return ExploreScreen();
        },
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );
}

Hospital getHospitalById(String id) {
  return hospitals.firstWhere((hospital) => hospital.id == id);
}
