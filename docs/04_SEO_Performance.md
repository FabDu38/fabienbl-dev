# SEO & Performance

> **Objectif :** Documenter la stratégie SEO, les choix techniques d'indexation et les objectifs de performance.

## Contexte

Le site principal est une application Flutter Web (non SEO-friendly nativement). Une couche SEO statique en HTML existe dans `/seo` pour l'indexation.

## Architecture SEO

```
/seo
├── developpeur-web-freelance.html  (landing principale)
├── a-propos.html
├── projets.html
├── contact.html
├── mentions-legales.html
├── sitemap.xml
└── robots.txt
```

Liaison bidirectionnelle : footer Flutter → pages SEO, pages SEO → app Flutter.

## Release 1 — Non référencé

- `noindex, nofollow` (meta + header X-Robots-Tag)
- `robots.txt` bloquant
- Pas de sitemap soumis
- Pages propres mais invisibles pour Google by design

## Release 2 — Référencement activé

- Retrait du noindex
- Sitemap.xml final soumis à Google Search Console
- Analytics + Consent Mode
- Bannière cookie fonctionnelle

## SEO technique

- Données structurées JSON-LD : Person, WebSite
- OpenGraph + Twitter Cards
- 1 seul H1 par page, hiérarchie H1 → H2 → H3
- Title unique par page (≈ 50–60 caractères)
- Meta description unique (≈ 140–160 caractères)
- URLs courtes et lisibles

## Checklist SEO

Voir la checklist complète dans le Google Doc source (pages 56–58).

## Performance

- Cible : Lighthouse ≥ 90 mobile
- Lazy-loading images
- Minification
- HTTPS actif (Netlify)

## Outils

- Google Search Console : configurée, sitemap soumis à `https://fabien-blasquez.dev/seo/sitemap.xml`
- Indexation manuelle demandée pour chaque URL
