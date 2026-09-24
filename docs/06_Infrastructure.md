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

### SimpleLogin — réception des emails

- Adresse pro : `contact@fabien-blasquez.dev`
- Fonctionne comme alias vers la boîte Gmail personnelle
- Répondre depuis Gmail envoie au nom de `contact@fabien-blasquez.dev`

**Procédure de configuration :**

1. S'inscrire sur SimpleLogin avec l'adresse Gmail de réception
2. Ajouter le domaine `fabien-blasquez.dev` dans SimpleLogin > Domains
3. Ajouter les entrées DNS chez Netlify pour vérifier le domaine
4. Ajouter les entrées DNS supplémentaires (MX, SPF, DKIM) une fois le domaine validé
5. Créer un alias `contact@fabien-blasquez.dev`
6. Les mails arrivent sur Gmail, les réponses partent au nom de `contact@fabien-blasquez.dev`

### EmailJS — envoi depuis le formulaire de contact

- Service côté client pour envoyer des emails depuis le formulaire Flutter sans backend
- Compte EmailJS connecté au compte Gmail

**Procédure de configuration :**

1. Créer un compte sur [emailjs.com](https://www.emailjs.com/)
2. Créer un nouveau service, connecter le compte Gmail → récupérer le **Service ID**
3. Créer un template d'email → récupérer le **Template ID**
4. Récupérer la **Public Key** dans Account > API Keys
5. Configurer ces 3 valeurs dans le code Flutter (`lib/features/contact/presentation/contact_page.dart`)
6. **Domains** (dashboard EmailJS) : autoriser au minimum `https://fabien-blasquez.dev` et `http://localhost` pour les tests locaux

**Dépannage — erreur HTTP 412 en prod**

Le code Flutter est en général correct ; le **412 vient presque toujours du lien Gmail ↔ EmailJS** (token OAuth expiré ou permissions insuffisantes). Le corps de la réponse ressemble souvent à `Gmail_API: Invalid grant` ou `insufficient authentication scopes`.

1. [EmailJS](https://dashboard.emailjs.com/) → **Email Services** → ouvrir le service Gmail (`service_3ehoqgp` ou équivalent)
2. **Disconnect** le compte Google, puis **Connect Account** à nouveau
3. Lors du consentement Google, cocher **« Send email on your behalf »** (les cases sont souvent décochées par défaut)
4. **Update Service**, puis **Test** depuis le dashboard (doit passer avant de retester le site)
5. Si ça persiste : [Google Account](https://myaccount.google.com/permissions) → retirer l’accès EmailJS → reconnecter ; vérifier qu’aucun changement de mot de passe récent n’a invalidé le grant

**Autres codes utiles**

| Code | Cause probable |
|------|----------------|
| 403 | Clé publique incorrecte, domaine absent de l’allowlist, ou appels API depuis un script (option « non-browser » désactivée dans Account → Security) |
| 400 | `service_id` / `template_id` / `user_id` manquant ou invalide |

## Google Search Console

- Domaine vérifié via entrée DNS chez Netlify
- Sitemap soumis : `https://fabien-blasquez.dev/seo/sitemap.xml`
- Indexation demandée manuellement pour chaque URL (à faire une seule fois)

## Procédure de push vers main

La branche `main` est protégée sur GitHub. Toute modification doit passer par une PR avec CI validée.

### Étapes

```text
1. Créer une branche feature
   git checkout -b feature/nom-fonctionnalite

2. Développer et commiter
   git add .
   git commit -m "type: description courte"

3. Pousser la branche
   git push -u origin feature/nom-fonctionnalite

4. Créer la PR sur GitHub
   → Compare & pull request
   → Rédiger un résumé du changement
   → Relire le diff avant de valider

5. Attendre la CI (Flutter CI doit passer)

6. Merger la PR sur GitHub

7. Revenir sur main en local
   git checkout main
   git pull
   git branch -d feature/nom-fonctionnalite
```

### Règles

- La CI (analyse + build) doit passer avant le merge
- Toujours relire le diff, même en solo
- Supprimer les branches locales et distantes après merge

## Procédure de mise en production

### Pendant le MVP2 (intégration vs production)

- Les **petites branches** `feature/` / `fix/` fusionnent sur `main` au fil des séances (pas de branche géante).
- Chaque push / PR déclenche **analyze + build** ; **aucun déploiement prod** automatique sur merge `main`.
- La prod reste sur le dernier **tag de release** déployé (`mvp1-final` côté code figé ; prod live jusqu’au prochain tag `V*`).
- **Validation** : surtout **en local** (`flutter run -d chrome`, `flutter build web`) pendant le MVP2 ; preview PR / prod au tag de release.

### Release en production (automatique)

Le déploiement prod Netlify se déclenche **uniquement** sur push d’un **tag semver** `V*` (ex. `V2.0.0` pour la fin du MVP2) :

```text
git tag V2.0.0
git push origin V2.0.0
  ↓
GitHub Actions (analyze + build + deploy --prod)
  ↓
Site live sur https://fabien-blasquez.dev
```

Convention alignée avec les tags existants (`V1.0.0`, `V1.1.0`, …). Le tag `mvp1-final` marque le commit MVP1 ; il ne redéploie pas tant qu’aucun nouveau `V*` n’est poussé après changement CI.

### Vérification post-déploiement

- Vérifier visuellement le site sur [fabien-blasquez.dev](https://fabien-blasquez.dev)
- Vérifier le statut du build dans GitHub Actions
- Vérifier le déploiement dans le dashboard Netlify

## Script d'initialisation

- `init_flutter_web.sh` : script réutilisable de création de projet Flutter Web
- Exécution via Git Bash : `chmod +x init_flutter_web.sh && ./init_flutter_web.sh`
- Notes d'amélioration :
  - `router.dart` doit être dans `core/` (pas `app/`)
  - Ajouter `flutter_web_plugins` dans `pubspec.yaml`
  - Activer la stratégie URL dans `main.dart`
