# Infrastructure & Mise en production

> **Objectif :** Documenter les choix d'hébergement, de déploiement, de configuration email et les procédures opérationnelles.

## Hébergement

- **Plateforme** : Netlify (front, CDN global)
- **Domaine** : fabien-blasquez.dev (acheté via Netlify, liaison automatique)
- **HTTPS** : automatique via Netlify
- **Futur backend** : Supabase (prévu, pas encore en place)

## Déploiement automatique (CI/CD)

### GitHub Actions (`flutter-ci.yml`)

Le workflow se déclenche sur push et PR vers `main` :

1. Démarre une machine Linux
2. Récupère le code du dépôt
3. Installe Flutter stable
4. `flutter pub get`
5. `flutter analyze`
6. `flutter build web --release`
7. Déploie sur Netlify via token

### Configuration Netlify

- **Build command** : `flutter build web --release`
- **Publish directory** : `build/web`
- **Déploiement auto** : désactivé côté Netlify (géré par GitHub Actions)
- **Token Netlify** : stocké dans les secrets GitHub (ne pas versionner en clair)
- **Site ID** : configuré dans les secrets GitHub

### Compilation locale

```bash
flutter build web --release
```

Le build se trouve dans `build/web`.

### Test local

```bash
flutter run -d chrome
```

### Maintenance Flutter

```bash
flutter upgrade
flutter doctor
flutter clean
flutter pub get
```

## Email

### SimpleLogin

- Adresse pro : `contact@fabien-blasquez.dev`
- Fonctionne comme alias vers la boîte Gmail personnelle
- Répondre depuis Gmail envoie au nom de `contact@fabien-blasquez.dev`
- Configuration : ajout du domaine `fabien-blasquez.dev` dans SimpleLogin + entrées DNS chez Netlify

### EmailJS

- Service utilisé pour le formulaire de contact côté client
- Compte EmailJS connecté au compte Gmail
- Éléments à conserver :
  - Service ID
  - Template ID
  - Public Key
- Configuration dans le code Flutter

## Google Search Console

- Domaine vérifié via entrée DNS chez Netlify
- Sitemap soumis : `https://fabien-blasquez.dev/seo/sitemap.xml`
- Indexation demandée manuellement pour chaque URL (à faire une seule fois)

## Protection de la branche main

- Branche `main` protégée sur GitHub
- Toute modification passe par une PR
- La CI doit passer avant le merge

## Script d'initialisation

- `init_flutter_web.sh` : script réutilisable de création de projet Flutter Web
- Exécution via Git Bash : `chmod +x init_flutter_web.sh && ./init_flutter_web.sh`
- Notes d'amélioration :
  - `router.dart` doit être dans `core/` (pas `app/`)
  - Ajouter `flutter_web_plugins` dans `pubspec.yaml`
  - Activer la stratégie URL dans `main.dart`
