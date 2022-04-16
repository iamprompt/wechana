import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wechana_app/screens/home.dart';
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
            return MaterialPage(
              key: state.pageKey,
              child: Text(regionSlug),
            );
          },
          routes: [
            GoRoute(
              name: 'province',
              path: ':provinceSlug',
              pageBuilder: (context, state) {
                final regionSlug = state.params['regionSlug']!;
                final provinceSlug = state.params['provinceSlug']!;
                return MaterialPage(
                  key: state.pageKey,
                  child: Text(regionSlug + provinceSlug),
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
            final id = state.params['id']!;
            return MaterialPage(
              key: state.pageKey,
              child: Text(id),
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
