# TODO

> **Objectif :** Recenser les actions officiellement décidées pour faire avancer le site vitrine.

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

## ⏭️ Prochaine étape

- [ ] **Brainstorming session 001** — Corrections et attractivité du site ([`sessions/001`](brainstorming/sessions/001_Corrections_et_attractivite.md))
- [ ] **Brainstorming session 002** — Définition du MVP2 ([`sessions/002`](brainstorming/sessions/002_Definition_MVP2.md))
- [ ] **Vérification opérationnelle** — S'assurer que tout fonctionne : emails (SimpleLogin + EmailJS), mise en prod (CI/CD + Netlify), domaine, HTTPS, Google Search Console

> La session 001 alimente la session 002 (définition MVP2), qui structurera tout le backlog ci-dessous.

---

## 🔴 Audit — P0 (critiques)

> Issues de l'[audit du 19/08/2026](docs/05_Audit_2026-08-19.md).

- [ ] Corriger `web/index.html` (description, `lang=fr`, canonical, Open Graph, Twitter Card, image sociale, titre statique)
- [ ] Débloquer le zoom (retirer `maximum-scale=1.0` et `user-scalable=no` du viewport)
- [ ] Uniformiser les URL SEO (même format navigation/sitemap/canonical, redirections 301)
- [ ] Renforcer la sémantique Flutter (`Semantics`, navigation clavier, ordre de focus, noms accessibles)

## 🟠 Audit — P1 (importants)

- [ ] Corriger le footer (le placer dans le flux naturel, ne plus masquer le contenu)
- [ ] Réparer les finitions (icône LinkedIn, copyright 2026, mentions légales, info données formulaire)
- [ ] Préciser la promesse (nommer la cible, problèmes résolus, avantage expérience industrielle)
- [ ] Créer de vrais cas clients (Supplyframe, Schneider, Alfa Laval, BF Web Création — même anonymisés)

## 🟡 Audit — P2 (finitions)

- [ ] Déployer les pages de services (applis métier, Flutter, reprise d'existant, automatisation, Grenoble/remote)
- [ ] Mesurer après corrections (Lighthouse mobile/desktop, test clavier, Search Console, données structurées)

---

## 🔶 À planifier — tâches backlog

> Tâches issues d'iceScrum, à répartir dans des releases futures.

### SEO & Analytics

- [ ] Suivre Google Search Console
- [ ] Tester l'audit Lighthouse → score SEO ≥ 90
- [ ] Configurer le tag d'analyse (script via balise ou module Flutter)
- [ ] Analyser les premières données (tendances, adapter le contenu)

### Légal & Confiance

- [ ] Rédiger et mettre en forme les mentions légales (nom, raison sociale, hébergeur, coordonnées)
- [ ] Décrire la collecte et le traitement des données (finalité, durée de conservation)
- [ ] Ajouter le bandeau de consentement cookies (message clair à l'ouverture)
- [ ] Rédiger les CGU/CGV (règles d'utilisation, responsabilités, droits)

### Implémentation Flutter Web

- [ ] Tester la réactivité des animations sur mobile (durées et comportements selon taille d'écran)
- [ ] Intégrer les animations de texte et fond (effet fluide et moderne sans nuire à la perf)
- [ ] Étudier code et mécanisme

### Performance & Accessibilité

- [ ] Activer la minification et la mise en cache (réduire poids du code et des images)
- [ ] Mettre en place le lazy-loading (charger les éléments visuels seulement quand nécessaires)
- [ ] Vérifier les contrastes et la taille du texte (conformité WCAG 2.1)
- [ ] Tester la navigation clavier et lecteur d'écran (accès à toutes les sections sans souris)

### Déploiement & Ops

- [ ] Intégrer un service d'alerte uptime (UptimeRobot, BetterStack) — vérifications auto + notifications
- [ ] Ajouter un script de log des erreurs JavaScript (capturer les erreurs front)
