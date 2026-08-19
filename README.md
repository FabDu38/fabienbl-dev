# fabienbl-dev

Site vitrine professionnel [fabien-blasquez.dev](https://fabien-blasquez.dev), développé avec Flutter Web.

## Objectif

Site personnel responsive servant de vitrine professionnelle et de socle technique multiplateforme (web, mobile, desktop).

## Premiers pas

```bash
flutter run -d chrome
```

## Structure du dépôt

```
├── README.md                  Présentation du projet
├── PROJECT_STATUS.md          État instantané
├── TODO.md                    Backlog officiel
├── METHODE_DE_TRAVAIL.md      Méthode de travail
├── docs/                      Connaissance consolidée
│   ├── 00_Vision.md
│   ├── 01_Principes.md
│   ├── 02_Contenu.md
│   ├── 03_Design.md
│   ├── 04_SEO_Performance.md
│   ├── 05_Audit_2026-08-19.md
│   └── 06_Infrastructure.md
├── brainstorming/             Explorations et idées
│   └── TODO.md
├── confidentiel/              Documents business (non versionnés)
├── lib/                       Code Flutter
├── assets/                    Ressources visuelles
├── seo/                       Couche SEO statique HTML
├── scripts/                   Scripts utilitaires
└── web/                       Configuration web Flutter
```

## Stack technique

- **Framework** : Flutter Web (Dart)
- **Thème** : Material 3, seed color #2BBBAD, police Inter
- **Hébergement** : Netlify (CDN, HTTPS automatique)
- **CI/CD** : GitHub Actions (analyse + build + déploiement)
- **Animations** : flutter_animate
- **Navigation** : go_router
- **Email** : SimpleLogin + EmailJS

## Versioning

Semver `MAJEUR.MINEUR.PATCH`. Détails dans [`METHODE_DE_TRAVAIL.md`](METHODE_DE_TRAVAIL.md).
