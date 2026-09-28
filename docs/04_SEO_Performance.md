# SEO & Performance

> **Objectif :** Documenter la stratégie SEO, les choix techniques d'indexation et les objectifs de performance.

## Contexte (depuis sept. 2026)

Le site vitrine public est en cours de **migration vers Astro** (`site/`). Une seule série de pages HTML indexables remplace l’architecture Flutter + miroir `/seo`. Décision : [`brainstorming/sessions/Architecture_SEO.md`](../brainstorming/sessions/Architecture_SEO.md).

**Pendant la migration :** la production reste sur Flutter (`build/web`) jusqu’au tag de bascule (ex. `V1.5.0`). La préversion Astro est servie hors index.

## Architecture SEO cible

```
site/ (Astro → dist/)
├── /                    (accueil)
├── /projets/
├── /projets/portfolio/
├── /projets/professionnels/
├── /a-propos/
├── /contact/
├── /mentions-legales/
├── /cgu/
└── /services/           (placeholder — contenu en séance parcours)
```

- **URL canoniques :** sans `.html`, **barre finale** sur les pages internes (`/projets/`, etc.).
- **Sitemap :** généré via `@astrojs/sitemap` à la racine du domaine.
- **robots.txt :** `Allow: /`, référence au sitemap `https://fabien-blasquez.dev/sitemap-index.xml` (ou équivalent Astro).
- **Redirections 301** depuis l’ancien `/seo/*.html` (voir [`08_Migration_Astro.md`](08_Migration_Astro.md)).

## MVP1 — ✅ Livré (historique)

- Couche `/seo` en HTML statique, Search Console branchée sur `/seo/sitemap.xml`
- Site Flutter en expérience principale (remplacé par Astro au jalon 1)

## MVP2 — En cours

- Site unique Astro : métadonnées, JSON-LD, Open Graph, Twitter Cards par page
- Accessibilité : zoom autorisé, HTML sémantique, clavier (critères de recette)
- Analytics + Consent Mode (séance mesure)
- Lighthouse SEO ≥ 90 sur la préversion puis la prod

## SEO technique

- Données structurées JSON-LD : Person, WebSite (reprises de `/seo` puis enrichies)
- OpenGraph + Twitter Cards + image sociale
- 1 seul H1 par page, hiérarchie H1 → H2 → H3
- Title unique par page (≈ 50–60 caractères)
- Meta description unique (≈ 140–160 caractères)

## Checklist SEO

(Voir sections Structure, Contenu, URLs, Indexation dans ce document — à cocher dans [`08_Migration_Astro.md`](08_Migration_Astro.md) lors de la recette.)

## Performance

- Cible : Lighthouse ≥ 90 mobile (site statique Astro)
- Images optimisées, lazy-loading
- HTTPS actif (Netlify)

## Outils

- Google Search Console : après bascule, soumettre le **nouveau** sitemap et surveiller couverture / 301
- Indexation : migration d’URL selon [la doc Google](https://developers.google.com/search/docs/crawling-indexing/site-move-with-url-changes)

## Historique audit

L’[audit du 19/08/2026](05_Audit_2026-08-19.md) reste le constat sur l’ancienne stack ; le plan d’action P0 Flutter/`/seo` est **remplacé** par la migration Astro (voir note en tête de l’audit).
