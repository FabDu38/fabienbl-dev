#!/usr/bin/env bash
# La commande ci dessus indique que le script doit être lu en bash
set -euo pipefail # En cas de problème le script s'arrête de s'executer

### ========= PARAMÈTRES À ADAPTER =========
PROJECT_NAME="fabien_site"
ORG="dev.fabienblasquez"
DESCRIPTION="Site personnel de Fabien Blasquez"
GIT_MAIN_BRANCH="main"
### ========================================

echo "👉 Vérification de l'existence du projet Flutter..."

if [ -f "pubspec.yaml" ]; then
  echo "ℹ️ pubspec.yaml trouvé. On suppose que le projet Flutter existe déjà. Pas de flutter create."
else
  echo "👉 Création du projet Flutter clean..."
  flutter create . \
    --platforms=web \
    --project-name="${PROJECT_NAME}" \
    --org="${ORG}" \
    --empty
fi

echo "👉 Création/validation de la structure de dossiers..."
mkdir -p lib/app
mkdir -p lib/theme
mkdir -p lib/features/home/presentation
mkdir -p lib/features/home/widgets
mkdir -p lib/core
mkdir -p assets/images
mkdir -p assets/icons

echo "👉 (Ré)génération de lib/main.dart..."
printf "%s" "
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'theme/app_theme.dart';
import 'app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Site perso de Fabien',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
" > lib/main.dart

echo "👉 (Ré)génération de lib/theme/app_theme.dart..."
printf "%s" "
import 'package:flutter/material.dart';

/// AppTheme
/// - Centralise le thème global.
/// - Active Material 3.
/// - Génère un ColorScheme cohérent à partir d'une seedColor.
class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF006699),
        brightness: Brightness.light,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
" > lib/theme/app_theme.dart

echo "👉 (Ré)génération de lib/app/router.dart..."
printf "%s" "
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
" > lib/app/router.dart

echo "👉 (Ré)génération de lib/features/home/presentation/home_page.dart..."
printf "%s" "
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Bienvenue sur mon site 👋',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Ici, bientôt, un vrai site pro.',
            ),
          ],
        ),
      ),
    );
  }
}
" > lib/features/home/presentation/home_page.dart

echo "👉 (Ré)écriture du pubspec.yaml..."
printf "%s" "
name: ${PROJECT_NAME}
description: ${DESCRIPTION}
publish_to: 'none'

environment:
  sdk: '>=3.5.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  go_router:

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/
" > pubspec.yaml

echo '👉 flutter pub get...'
flutter pub get

echo '👉 Format avec dart format...'
dart format lib || echo '⚠️ Format échoué ou warnings, pas bloquant.'

echo '👉 Analyse Flutter...'
flutter analyze || echo '⚠️ Analyse avec warnings (normal au début).'

echo '👉 Build web...'
flutter build web || echo '⚠️ Build web échoué, à corriger plus tard.'

echo '👉 Commit initial (si nécessaire)...'
git add .
git commit -m 'Initial structure: Flutter web + Material 3 + GoRouter + base folders' || echo 'ℹ️ Aucun commit créé (peut-être déjà fait).'

git branch -M "${GIT_MAIN_BRANCH}" || true

if git remote get-url origin >/dev/null 2>&1; then
  echo "👉 Push vers ${GIT_MAIN_BRANCH}..."
  git push -u origin "${GIT_MAIN_BRANCH}" || echo '⚠️ Push échoué (remote non dispo ou rejeté).'
else
  echo 'ℹ️ Aucun remote configuré. Utilise : git remote add origin <URL>'
fi

echo '✅ Terminé : script rejoué, projet cohérent, build tenté, Git à jour.'
