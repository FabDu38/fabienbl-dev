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

### Structure & HTML

- [ ] 1 seul H1 par page
- [ ] Hiérarchie H1 → H2 → H3 logique
- [ ] Title unique par page (≈ 50–60 caractères)
- [ ] Meta description unique et lisible (≈ 140–160 caractères)

### Contenu

- [ ] 1 page = 1 intention claire
- [ ] Contenu qui répond à une vraie question
- [ ] Texte lisible (paragraphes courts, listes)
- [ ] Champ sémantique cohérent (pas de répétitions)

### Mots-clés

- [ ] Mot-clé principal identifié par page
- [ ] Mot-clé présent dans : Title / H1 / URL / intro
- [ ] Pas de bourrage de mots-clés

### URLs & navigation

- [ ] URLs courtes et lisibles
- [ ] Pas de paramètres inutiles
- [ ] Navigation claire (menu compréhensible)

### Maillage interne

- [ ] Liens entre pages liées logiquement
- [ ] Ancres de lien descriptives (pas "clique ici")
- [ ] Aucune page importante orpheline

### Technique

- [ ] Site rapide (images optimisées)
- [ ] Mobile OK (responsive réel)
- [ ] HTTPS actif
- [ ] Pas d'erreurs 404 visibles

### Indexation

- [ ] sitemap.xml présent
- [ ] robots.txt propre
- [ ] Pages inutiles non indexées

### Confiance et crédibilité

- [ ] Page À propos claire
- [ ] Page Contact accessible
- [ ] Mentions légales visibles
- [ ] Identité claire

### Objectif business

- [ ] CTA clair par page
- [ ] Objectif mesurable (contact, devis, etc.)
- [ ] Pas de CTA concurrents multiples

## Performance

- Cible : Lighthouse ≥ 90 mobile
- Lazy-loading images
- Minification
- HTTPS actif (Netlify)

## Outils

- Google Search Console : configurée, sitemap soumis à `https://fabien-blasquez.dev/seo/sitemap.xml`
- Indexation manuelle demandée pour chaque URL
