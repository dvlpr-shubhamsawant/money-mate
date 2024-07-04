import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:money_mate/views/home_screen/home_screen.dart';
import 'package:money_mate/views/shared_widget/navbar.dart';
import 'package:money_mate/views/splash_screen/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: SplashScreen.id,
        builder: (context, state) => SplashScreen(),
      ),
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: Navbar(
              selectedIndex: calculateScreenIndex(state),
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/homescreen',
            name: HomeScreen.id,
            builder: (context, state) => HomeScreen(),
          ),
        ],
      )
    ],
  );
}

int calculateScreenIndex(GoRouterState state) {
  final location = state.matchedLocation;

  if (location.startsWith('/homescreen')) {
    return 0;
  }

  return -1;
}
