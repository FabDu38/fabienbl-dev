# TODO

> **Objectif :** Recenser les actions officiellement décidées pour faire avancer le site vitrine.

**MVP1** : terminé (section figée). **MVP2** : tout le travail en cours et à venir.

Les idées encore exploratoires restent dans [`brainstorming/TODO.md`](brainstorming/TODO.md).

---

## 🟢 MVP1 — ✅ Terminé

- [x] Configurer Git et la gestion des branches
- [x] Configurer le build Flutter Web et la CI/CD
- [x] Déployer sur Netlify
- [x] Initialiser le projet Flutter Web
- [x] Implémenter la navigation et le routage
- [x] Créer la section Héros
- [x] Créer la section mes projets
- [x] Créer la section à propos
- [x] Implémenter le formulaire de contact
- [x] Définir la palette et les tokens Material 3
- [x] Rédiger la promesse et les 3 piliers du site
- [x] Rédiger et illustrer les mini études de cas
- [x] Rédiger la bio et la vision du site
- [x] Créer la couche SEO (site miroir HTML statique)
- [x] Ajouter les balises `<title>` et `<meta description>` par page SEO
- [x] Définir les titres et descriptions de chaque page SEO
- [x] Structurer le HTML SEO avec `header`, `main`, `footer`
- [x] Créer et soumettre le sitemap.xml
- [x] Connecter Google Search Console et demander l'indexation

---

## 🔵 MVP2 — En cours

> Cadrage terminé — [`07_MVP2`](docs/07_MVP2.md). **Séances :** [`brainstorming/TODO.md`](brainstorming/TODO.md). Le backlog ci-dessous reste un **catalogue** ; priorisation après la séance **architecture / SEO**.

### Phase 1 — Préparation (exécution)

- [x] **Brainstorming — Définition du MVP2** (cadrage — [`Definition_MVP2`](brainstorming/sessions/Definition_MVP2.md))
- [x] Poser le tag **`mvp1-final`** sur le commit MVP1 publié (`752bee4`, poussé sur origin)
- [x] Confirmer le circuit de travail (branches `feature/` ou `fix/` depuis `main`, PR ; prod sur tag `V*` uniquement)
- [ ] Vérifier la préversion (ouvrir une PR depuis cette branche → CI verte + preview Netlify si activée)
- [ ] **Vérification opérationnelle**
  - [x] Build local : `flutter analyze` + `flutter build web --release` OK (24/09/2026)
  - [x] Site public HTTPS + sitemap `/seo/sitemap.xml` répondent (200)
  - [ ] Formulaire contact → réception mail (test manuel sur prod ou preview)
  - [ ] Google Search Console : pas d’erreur bloquante récente (vérif manuelle)
  - [x] Rappel : merge `main` ne déploie plus la prod (attendre `V2.0.0`)

### Séances de brainstorming

Suivre et cocher dans [`brainstorming/TODO.md`](brainstorming/TODO.md) (fichiers dans `brainstorming/sessions/`).

### Candidats — Audit P0 (critiques)

> Issues de l'[audit du 19/08/2026](docs/05_Audit_2026-08-19.md). Inclusion et ordre : à trancher en séances MVP2 (dès architecture / SEO).

- [ ] Corriger `web/index.html` (description, `lang=fr`, canonical, Open Graph, Twitter Card, image sociale, titre statique)
- [ ] Débloquer le zoom (retirer `maximum-scale=1.0` et `user-scalable=no` du viewport)
- [ ] Uniformiser les URL SEO (même format navigation/sitemap/canonical, redirections 301)
- [ ] Renforcer la sémantique Flutter (`Semantics`, navigation clavier, ordre de focus, noms accessibles)

### Candidats — Audit P1 (importants)

- [ ] Corriger le footer (le placer dans le flux naturel, ne plus masquer le contenu)
- [ ] Réparer les finitions (icône LinkedIn, copyright 2026, mentions légales, info données formulaire)
- [ ] Préciser la promesse (nommer la cible, problèmes résolus, avantage expérience industrielle)
- [ ] Créer de vrais cas clients (Supplyframe, Schneider, Alfa Laval, BF Web Création — même anonymisés)

### Candidats — Audit P2 (finitions)

- [ ] Déployer les pages de services (applis métier, Flutter, reprise d'existant, automatisation, Grenoble/remote)
- [ ] Mesurer après corrections (Lighthouse mobile/desktop, test clavier, Search Console, données structurées)

### Candidats — SEO & Analytics

- [ ] Suivre Google Search Console
- [ ] Tester l'audit Lighthouse → score SEO ≥ 90
- [ ] Configurer le tag d'analyse (script via balise ou module Flutter)
- [ ] Analyser les premières données (tendances, adapter le contenu)

### Backlog — Légal & confiance

- [ ] Rédiger et mettre en forme les mentions légales (nom, raison sociale, hébergeur, coordonnées)
- [ ] Décrire la collecte et le traitement des données (finalité, durée de conservation)
- [ ] Ajouter le bandeau de consentement cookies (message clair à l'ouverture)
- [ ] Rédiger les CGU/CGV (règles d'utilisation, responsabilités, droits)

### Backlog — Implémentation Flutter Web

- [ ] Tester la réactivité des animations sur mobile (durées et comportements selon taille d'écran)
- [ ] Intégrer les animations de texte et fond (effet fluide et moderne sans nuire à la perf)
- [ ] Étudier code et mécanisme

### Backlog — Performance & accessibilité

- [ ] Activer la minification et la mise en cache (réduire poids du code et des images)
- [ ] Mettre en place le lazy-loading (charger les éléments visuels seulement quand nécessaires)
- [ ] Vérifier les contrastes et la taille du texte (conformité WCAG 2.1)
- [ ] Tester la navigation clavier et lecteur d'écran (accès à toutes les sections sans souris)

### Backlog — Déploiement & ops

- [ ] Intégrer un service d'alerte uptime (UptimeRobot, BetterStack) — vérifications auto + notifications
- [ ] Ajouter un script de log des erreurs JavaScript (capturer les erreurs front)
