# Design

> **Objectif :** Documenter les choix graphiques, la charte visuelle et les décisions de design du site.

## Couleur principale

**#2BBBAD** — Vert turquoise, choisi pour son côté dynamique et startup, cohérent avec le statut de freelance.

Palette générée via [Material Theme Builder](https://material-foundation.github.io/material-theme-builder/) à partir de la seed color.

## Typographie

**Inter** — Moderne, neutre, ultra lisible. Utilisée pour l'ensemble du site (titres + texte).

Chargée via `google_fonts: ^6.2.1`.

## Thème

Material 3 appliqué via les fichiers `lib/theme/theme.dart` et `lib/theme/util.dart` exportés depuis Material Theme Builder.

## Animations

- Package `flutter_animate: ^4.5.0`
- Configuration globale : `defaultDuration = 350ms`, `defaultCurve = Curves.easeOutCubic`
- Philosophie : animations légères et maîtrisées, pas de bling

## Responsive

Le site doit être lisible et utilisable sur desktop, tablette et mobile. Pas de "ça passe" — responsive réel.

## Accessibilité

- Contrastes AA minimum
- Focus visibles
- Navigation clavier fonctionnelle
- Test lecteur d'écran smoke avant release
