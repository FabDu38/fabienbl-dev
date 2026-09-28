# Bascule production Astro

**Checklist complète de tes tâches** (local, PR, préversion, tag, GSC, EmailJS) : [`CHECKLIST_TACHES_FABIEN.md`](CHECKLIST_TACHES_FABIEN.md).

## Règle importante

- **Merge sur `main` ≠ prod.** Netlify ne doit plus builder depuis Git (`ignore` dans `netlify.toml` + *Stop builds* dans l’UI si besoin).
- **Prod** : seulement après **`git push origin V*`** (workflow Actions → `netlify deploy --prod`).
- Après des merges de retouches : tester la **préversion** Actions (`astro-preview`) ou le local ; publier la prod quand tu es prêt (tag).

## Déclencher la mise en prod

```bash
git tag V1.5.0
git push origin V1.5.0
```

Le workflow **Astro CI** exécute `npm run build` dans `site/` puis `netlify deploy --prod` (dossier `site/dist`).

## Après le déploiement

1. Vérifier [fabien-blasquez.dev](https://fabien-blasquez.dev) : accueil, `/projets/`, formulaire contact.
2. Tester les **301** :
   - `/seo/developpeur-web-freelance.html` → `/`
   - `/seo/a-propos.html` → `/a-propos/`
   - etc. (voir `site/public/_redirects`)
3. **Google Search Console** (manuel) :
   - Soumettre `https://fabien-blasquez.dev/sitemap-index.xml`
   - Surveiller couverture et erreurs de redirection 2–4 semaines
4. Mettre à jour EmailJS **Domains** si l’URL de préversion change.

## Tag MVP2 final

La fin du périmètre MVP2 (contenu, légal, mesure) reste associée au tag **`V2.0.0`** selon [`07_MVP2.md`](07_MVP2.md).
