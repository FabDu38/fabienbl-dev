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
      // AppShell = layout global (header, footer, etc.)
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/projets',
          name: 'projects',
          builder: (context, state) => const ProjectsPage(),
        ),
        GoRoute(
          path: '/a-propos',
          name: 'about',
          builder: (context, state) => const AboutPage(),
        ),
        GoRoute(
          path: '/contact',
          name: 'contact',
          builder: (context, state) => const ContactPage(),
        ),
        GoRoute(
          path: '/mentions-legales',
          name: 'mentions',
          builder: (context, state) => const MentionsLegalesPage(),
        ),
        GoRoute(
          path: '/cgu',
          name: 'cgu',
          builder: (context, state) => const CguPage(),
        ),
      ],
    ),
  ],
);
