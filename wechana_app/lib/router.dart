import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wechana_app/model/region.dart';
import 'package:wechana_app/model/region_data.dart';
import 'package:wechana_app/screens/explore_hospital.dart';
import 'package:wechana_app/screens/explore_province.dart';
import 'package:wechana_app/screens/home.dart';
import 'package:wechana_app/screens/hospital_details.dart';
import 'package:wechana_app/screens/splash.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      name: 'spalsh',
      path: '/splash',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
      routes: [
        GoRoute(
          name: 'home_router',
          path: ':index',
          pageBuilder: (context, state) {
            final index = state.params['index']!;
            return MaterialPage(
              key: state.pageKey,
              child: HomeScreen(
                selectedIndex: int.tryParse(index) ?? 0,
              ),
            );
          },
        ),
      ],
    ),
    GoRoute(
      name: 'explore',
      path: '/explore',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Text('Explore'),
      ),
      routes: [
        GoRoute(
          name: 'region',
          path: ':regionSlug',
          pageBuilder: (context, state) {
            final regionSlug = state.params['regionSlug']!;
            Region region = regions.firstWhere(
              (r) => r.slug == regionSlug,
            );

            return MaterialPage(
              key: state.pageKey,
              child: ExploreProvinceScreen(
                region: region,
              ),
            );
          },
          routes: [
            GoRoute(
              name: 'province',
              path: ':provinceSlug',
              pageBuilder: (context, state) {
                final regionSlug = state.params['regionSlug']!;
                final Region region = regions.firstWhere(
                  (r) => r.slug == regionSlug,
                );

                final province = region.provinces.firstWhere(
                  (p) => p.slug == state.params['provinceSlug']!,
                );
                return MaterialPage(
                  key: state.pageKey,
                  child: ExploreHospitalScreen(province: province),
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: 'hospital',
      path: '/hospital',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Text('Hospital'),
      ),
      routes: [
        GoRoute(
          name: 'hospital_detail',
          path: ':id',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: HospitalDetailScreen(
                hId: state.params['id']!,
              ),
            );
          },
        ),
      ],
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
