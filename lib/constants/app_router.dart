import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/views/auth_screens/sign_in_screen/sign_in_screen.dart';
import 'package:money_mate/views/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:money_mate/views/category_screen/category_screen.dart';
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
      GoRoute(
        path: '/auth',
        name: SignInScreen.id,
        builder: (context, state) => SignInScreen(),
        routes: [
          GoRoute(
            path: 'sign_up',
            name: SignUpScreen.id,
            builder: (context, state) => SignUpScreen(),
          )
        ],
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
          GoRoute(
            path: '/categoryscreen',
            name: CategoryScreen.id,
            builder: (context, state) => CategoryScreen(),
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
  if (location.startsWith('/categoryscreen')) {
    return 1;
  }
  return -1;
}
