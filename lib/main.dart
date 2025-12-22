import 'package:flutter/material.dart';
import 'theme/theme.dart';
import 'theme/util.dart';
import 'core/router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

// Config globale flutter_animate
  Animate.restartOnHotReload = true;
  Animate.defaultDuration = 350.ms;
  Animate.defaultCurve = Curves.easeOutCubic;

  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(
      context,
      'Inter',
      'Inter',
    );

    final materialTheme = MaterialTheme(textTheme);

    return MaterialApp.router(
      title: 'Fabien Blasquez · Développeur Flutter freelance',
      debugShowCheckedModeBanner: false,
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
