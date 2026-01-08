# Couche SEO Statique

Ce dossier contient les pages HTML statiques optimisées SEO pour le site fabien-blasquez.dev.

## Build et déploiement

Le dossier `/seo` est automatiquement copié vers `build/web/seo` après le build Flutter via le script `scripts/copy-seo.js` (configuré dans `netlify.toml`).

**Commande manuelle :**
```bash
node scripts/copy-seo.js
```

## Structure

```
/seo
  ├── developpeur-web-freelance.html   (landing principale)
  ├── a-propos.html
  ├── projets.html
  ├── contact.html
  ├── mentions-legales.html
  ├── sitemap.xml
  └── robots.txt
```

## Configuration Netlify

Le fichier `netlify.toml` configure :
- Copie automatique de `/seo` vers `build/web/seo` après build
- Redirections pour servir `/seo/*` comme fichiers statiques
- Fallback SPA Flutter pour toutes les autres routes

## SEO Technique

- ✅ Meta tags optimisés (title, description)
- ✅ Open Graph et Twitter Cards
- ✅ Données structurées JSON-LD (Person, WebSite, WebPage, BreadcrumbList)
- ✅ HTML sémantique
- ✅ Canonical URLs
- ✅ Sitemap.xml
- ✅ Robots.txt
- ✅ CTA visible above the fold vers l'app Flutter

## Liens croisés

- Les pages SEO contiennent des liens vers l'application Flutter (`/`)
- L'application Flutter contient un lien vers la page SEO principale dans le footer
