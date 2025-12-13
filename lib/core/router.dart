import 'package:go_router/go_router.dart';

import 'presentation/app_shell.dart';

import '../features/home/presentation/home_page.dart';
import '../features/projects/presentation/projects_page.dart';
import '../features/about/presentation/about_page.dart';
import '../features/contact/presentation/contact_page.dart';
import '../features/legal/presentation/mentions_legales_page.dart';
import '../features/legal/presentation/cgu_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: '/projets',
          name: 'projects',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProjectsPage(),
          ),
        ),
        GoRoute(
          path: '/a-propos',
          name: 'about',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AboutPage(),
          ),
        ),
        GoRoute(
          path: '/contact',
          name: 'contact',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ContactPage(),
          ),
        ),
        GoRoute(
          path: '/mentions-legales',
          name: 'mentions',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MentionsLegalesPage(),
          ),
        ),
        GoRoute(
          path: '/cgu',
          name: 'cgu',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CguPage(),
          ),
        ),
      ],
    ),
  ],
);
