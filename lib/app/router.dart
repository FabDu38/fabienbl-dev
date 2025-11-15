import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/home_page.dart';

/// appRouter
/// - Centralise la navigation.
/// - Déclare les routes de l'app.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(
          child: HomePage(),
        );
      },
    ),
  ],
);
