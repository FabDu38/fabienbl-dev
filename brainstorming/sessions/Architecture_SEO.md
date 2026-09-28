# Séance — Architecture du site et SEO

> **Statut :** Terminée (28 septembre 2026)  
> **Prérequis :** cadrage MVP2 ; lecture de l’[audit 19/08/2026](../../docs/05_Audit_2026-08-19.md).

## Objectif

Trancher le rôle de Flutter vs `/seo`, les URL, les pages indexables et les conséquences sur le backlog technique.

## Entrées de la séance

- [`docs/05_Audit_2026-08-19.md`](../../docs/05_Audit_2026-08-19.md) — P0/P1 SEO, HTML Flutter, URL
- Export de transmission : [`exports/Architecture_SEO_decisions_MVP2 (2).md`](../../exports/Architecture_SEO_decisions_MVP2%20(2).md)
- Code : `web/index.html`, `seo/`, `lib/core/router.dart`, pages publiques

## Sortie attendue

Architecture retenue + backlog technique priorisé pour l’implémentation.

## Décisions

Séance du 28 septembre 2026. Le site vitrine `fabien-blasquez.dev` sera reconstruit entièrement avec **Astro** (site public unique, pages HTML indexables). L’apparence et la navigation Flutter actuelles servent de référence ; Flutter ne fait plus partie du site vitrine après la bascule. Projet Élan reste indépendant. Le site Flutter demeure en production jusqu’à validation de la migration complète. La migration est le **premier jalon du MVP2**.

**Git :** branches `feature/` ou `fix/` depuis `main`, PR vers `main` ; production uniquement au tag `V*`. Pas de branche d’intégration `mvp2`.

| ID | Décision |
|---|---|
| A — Architecture | Un seul site vitrine en Astro. Migrer toutes les pages et fonctions existantes, y compris celles absentes de `/seo`. Aucune partie Flutter conservée dans le portfolio par défaut. |
| B — URL | URL publiques lisibles, sans `.html`, barre finale systématique pour les pages internes : `/projets/`, `/a-propos/`, etc. Une seule URL canonique par page. |
| C — Accueil | Accueil public et indexable à `/`. Futures pages services selon séances suivantes. |
| D — Indexation | Pages Astro indexables en prod. Préversion hors index (`X-Robots-Tag: noindex`). Pas de `noindex` en production après bascule. |
| E — Footer | Supprimer le lien « Version SEO du site ». Liens normaux vers mentions légales et pages utiles. |
| F — Ordre | Inventaire → prototype Astro → migration → SEO/a11y → recette préversion → bascule + 301 → contrôle indexation. |

### Plan d’URL indicatif

| Page | URL cible |
|---|---|
| Accueil | `/` |
| Services | `/services/` (contenu plus tard) |
| Projets | `/projets/` |
| À propos | `/a-propos/` |
| Contact | `/contact/` |
| Mentions légales | `/mentions-legales/` |
| Étude portfolio | `/projets/portfolio/` |
| Projets pro | `/projets/professionnels/` |
| CGU | `/cgu/` |

Redirections 301 individuelles depuis `/seo/*.html` vers les pages correspondantes ; `/seo/developpeur-web-freelance.html` → `/`.

### Audit 19/08 — traitement révisé

Les corrections spécifiques à `web/index.html`, au shell et aux widgets Flutter ne sont plus des tâches sur l’ancien code. Les objectifs (métadonnées, contenu lisible, zoom, accessibilité) deviennent des **critères de recette** de l’implémentation Astro. L’ancienne couche `/seo` sert de source de contenu et d’URL à préserver, puis disparaît après la bascule.

## Suivi documentaire

- [`docs/04_SEO_Performance.md`](../../docs/04_SEO_Performance.md) — architecture Astro, URL, sitemap
- [`docs/07_MVP2.md`](../../docs/07_MVP2.md) — jalon 1 migration
- [`docs/08_Migration_Astro.md`](../../docs/08_Migration_Astro.md) — inventaire et recette
- [`TODO.md`](../../TODO.md) — jalon 1 en 8 étapes
- [`brainstorming/TODO.md`](../TODO.md) — séance marquée terminée
