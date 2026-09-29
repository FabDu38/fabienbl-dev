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
- [x] **Inspection site** — déjà couverte par l’[audit du 19/08/2026](docs/05_Audit_2026-08-19.md) (pas besoin de refaire un parcours « clic partout »)
- [x] Build local : `flutter analyze` + `flutter build web --release` OK (24/09/2026)
- [x] **Deploy prod `V1.2.1`** — secrets Netlify recréés, pipeline Actions + Netlify validés (24/09/2026, voir [`06_Infrastructure.md`](docs/06_Infrastructure.md))
- [x] **Contact prod** — EmailJS Gmail reconnecté ; messages d’erreur UI (`contact_page.dart`) déployés en `V1.2.1`
- [x] **GSC** — sitemap `sitemap-index.xml` soumis après bascule Astro
- [x] Rappel : **prod** au tag `V*` ; objectif publication MVP2 au tag **`V2.0.0`**

### Séances de brainstorming

- [x] **Architecture du site et SEO** (28/09/2026 — [`Architecture_SEO`](brainstorming/sessions/Architecture_SEO.md))
- [x] **Parcours et structure** (29/09/2026 — [`Parcours_et_structure`](brainstorming/sessions/Parcours_et_structure.md)) — menu, une page Services, CTA, 301 portfolio ; textes et Élan aux séances suivantes

Suivre et cocher dans [`brainstorming/TODO.md`](brainstorming/TODO.md).

### Jalon 1 — Migration complète vers Astro

> Décisions : [`Architecture_SEO`](brainstorming/sessions/Architecture_SEO.md). Détail : [`docs/08_Migration_Astro.md`](docs/08_Migration_Astro.md). **✅ Validé en prod** (recette manuelle, tag **`V1.5.2`**, sept. 2026).

- [x] 1. Inventorier routes Flutter, `/seo`, contenus, médias, animations, formulaire ; correspondance URL
- [x] 2. Initialiser Astro dans `site/` ; CI build ; préversion Netlify (noindex) ; note MCP → [`docs/09_MCP_et_outils_agent.md`](docs/09_MCP_et_outils_agent.md)
- [x] 3. Prototype : layout, header, menu mobile, footer (sans lien SEO), accueil fidèle
- [x] 4. Migrer toutes les pages et le formulaire EmailJS (JS client)
- [x] 5. SEO : composant meta, JSON-LD, sitemap, robots, redirections 301 depuis `/seo/*.html`
- [x] 6. Accessibilité : zoom, sémantique, clavier, focus, contrastes, footer dans le flux
- [x] 7. Recette préversion (URL, 404, formulaire, sans JS, Lighthouse SEO ≥ 90)
- [x] 8. Bascule prod (tag), contrôle 301 + sitemap GSC ; code Flutter retiré — prod **`V1.5.2`**

### Critères de recette Astro (ex-audit P0 — validés en prod, sept. 2026)

- [x] Métadonnées complètes par page (`lang=fr`, title, description, canonical, OG, Twitter)
- [x] Zoom non bloqué (pas de `user-scalable=no`)
- [x] URL uniformes (barre finale, une canonique, 301 depuis `/seo`)
- [x] HTML sémantique, navigation clavier, focus visible, noms accessibles

### Candidats — Audit P1 (importants)

- [x] Footer dans le flux naturel (recette Astro)
- [ ] Réparer les finitions (icône LinkedIn, copyright 2026, mentions légales, info données formulaire)
- [ ] Préciser la promesse (nommer la cible, problèmes résolus, avantage expérience industrielle)
- [ ] Créer de vrais cas clients (Supplyframe, Schneider, Alfa Laval, BF Web Création — même anonymisés)

### Candidats — Audit P2 (finitions)

- [x] Une page Services (quatre missions, pas de sous-pages) — structure posée le 29/09/2026 ; textes finaux en séance Messages
- [ ] Mesurer après corrections (Lighthouse mobile/desktop, test clavier, Search Console, données structurées)

### Candidats — SEO & Analytics

- [x] Suivre Google Search Console (sitemap post-migration soumis)
- [x] Tester l'audit Lighthouse → score SEO ≥ 90 (prod, mobile)
- [ ] Configurer le tag d'analyse (script via balise ou module Flutter)
- [ ] Analyser les premières données (tendances, adapter le contenu)

### Backlog — Légal & confiance

- [ ] Rédiger et mettre en forme les mentions légales (nom, raison sociale, hébergeur, coordonnées)
- [ ] Décrire la collecte et le traitement des données (finalité, durée de conservation)
- [ ] Ajouter le bandeau de consentement cookies (message clair à l'ouverture)
- [ ] Rédiger les CGU/CGV (règles d'utilisation, responsabilités, droits)

### Backlog — Site Astro (motion & perf)

- [ ] Animations au scroll (CSS / IntersectionObserver), fidèles à l’esprit Flutter sans dégrader la perf
- [ ] Lazy-loading images, build statique optimisé

### Backlog — Performance & accessibilité

- [ ] Activer la minification et la mise en cache (réduire poids du code et des images)
- [ ] Mettre en place le lazy-loading (charger les éléments visuels seulement quand nécessaires)
- [ ] Vérifier les contrastes et la taille du texte (conformité WCAG 2.1)
- [ ] Tester la navigation clavier et lecteur d'écran (accès à toutes les sections sans souris)

### Backlog — Déploiement & ops

- [ ] Intégrer un service d'alerte uptime (UptimeRobot, BetterStack) — vérifications auto + notifications
- [ ] Ajouter un script de log des erreurs JavaScript (capturer les erreurs front)
