import 'package:flutter_assessment/router/route_names.dart';
import 'package:flutter_assessment/ui/screens/detail_screen.dart';
import 'package:go_router/go_router.dart';

import '../ui/screens/home_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: RouteNames.home.path(),
  routes: [
    GoRoute(
      name: RouteNames
          .home, // Optional, add name to your routes. Allows you navigate by name instead of path
      path: RouteNames.home.path(),
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: RouteNames
          .detail, // Optional, add name to your routes. Allows you navigate by name instead of path
      path: RouteNames.detail.path(),
      builder: (context, state) => DetailScreen(),
    ),
  ],
);
