# Infrastructure & Mise en production

> **Objectif :** Documenter les choix d'hébergement, de déploiement, de configuration email et les procédures opérationnelles.

## Hébergement

- **Plateforme** : Netlify (front, CDN global)
- **Domaine** : fabien-blasquez.dev (acheté via Netlify, liaison automatique)
- **HTTPS** : automatique via Netlify
- **Futur backend** : Supabase (prévu, pas encore en place)

## Déploiement automatique (CI/CD)

### GitHub Actions (`flutter-ci.yml`)

Le workflow se déclenche sur **push** (toutes branches + tags `V*`) et sur **PR** vers `main` :

1. Démarre une machine Linux
2. Récupère le code du dépôt
3. Installe Flutter stable
4. `flutter pub get`
5. `flutter analyze`
6. `flutter build web --release`
7. **Uniquement sur tag `V*`** : `netlify deploy --prod` (dossier `build/web`)

### Configuration Netlify

- **Build command** : `flutter build web --release` (dans `netlify.toml`, si build Netlify utilisé)
- **Publish directory** : `build/web`
- **Builds Netlify** : peuvent être en pause (« Builds are stopped ») — **normal** si la prod passe par GitHub Actions + CLI ; ce bandeau ne remplace pas les secrets GitHub
- **Déploiement prod** : via GitHub Actions (pas un auto-deploy Git → Netlify obligatoire)

### Secrets GitHub (obligatoires pour la prod)

Dans le dépôt : **Settings → Secrets and variables → Actions** (secrets **repository**, pas seulement « Environments ») :

| Secret | Contenu |
|--------|---------|
| `NETLIFY_AUTH_TOKEN` | [Personal access token](https://app.netlify.com/user/applications#personal-access-tokens) du compte propriétaire du site |
| `NETLIFY_SITE_ID` | UUID du site **fabien-blasquez.dev** (Site configuration → General → Site details) |

Sans ces deux secrets, l’étape *Deploy to Netlify* échoue avec `Unauthorized: could not retrieve project`. GitHub ne supprime pas les secrets tout seul ; une liste vide = à recréer.

### Incident résolu — déploiement `V1.2.1` (24/09/2026)

- **Contexte** : premier deploy prod après passage « prod uniquement sur tag `V*` » (PR #19) ; tag **`V1.2.1`** après merge contact / doc (PR #20).
- **Symptôme** : CI OK jusqu’au build ; échec `netlify deploy --prod` → `Unauthorized: could not retrieve project`.
- **Cause** : secrets `NETLIFY_AUTH_TOKEN` et `NETLIFY_SITE_ID` **absents** du dépôt GitHub (pas lié au bandeau « Builds are stopped » sur Netlify).
- **Résolution** : recréation des deux secrets → **Re-run** du workflow sur le tag `V1.2.1` → prod à jour sur [fabien-blasquez.dev](https://fabien-blasquez.dev).
- **Contrôle** : Actions verte + deploy *Published* dans Netlify ; test page `/contact`.

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

**Résolution — 412 en prod (24/09/2026)** : service Gmail `service_3ehoqgp` — **Disconnect** / **Connect Account** avec permission « Send email on your behalf », **Update Service** + test EmailJS OK ; formulaire contact de nouveau fonctionnel après deploy `V1.2.1`.

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

Convention alignée avec les tags existants (`V1.0.0`, `V1.1.0`, `V1.2.0`, **`V1.2.1`** — messages contact + doc prep, 24/09/2026). Le tag `mvp1-final` marque le commit MVP1 ; il ne redéploie pas tant qu’aucun nouveau `V*` n’est poussé après changement CI.

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
