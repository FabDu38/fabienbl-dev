# PROJECT STATUS

> **Objectif :** Donner une vue instantanée de l'état actuel du site vitrine fabien-blasquez.dev.

## Phase

- **MVP1** — ✅ terminé
- **MVP2** — 🔵 en cours — **jalon 1 migration Astro ✅** (recette prod validée, tag **`V1.5.2`**) ; **parcours et structure ✅** (29/09/2026) ; **prochaine séance : Direction visuelle** ([`brainstorming/sessions/Direction_visuelle.md`](brainstorming/sessions/Direction_visuelle.md))

## État actuel

- **Code source** : site Astro dans `site/` (seul site vitrine du dépôt)
- **Production live** : Astro sur fabien-blasquez.dev ; déploiement prod au tag **`V*`** ([`docs/06_Infrastructure.md`](docs/06_Infrastructure.md)) — dernier tag prod **`V1.5.2`**
- **Préversion** : deploy Netlify `astro-preview` (noindex) sur push `main`
- Domaine fabien-blasquez.dev, HTTPS, EmailJS + SimpleLogin opérationnels
- **Google Search Console** : sitemap `https://fabien-blasquez.dev/sitemap-index.xml` ; surveillance couverture 2–4 semaines

## Audit du 19/08/2026 — Note : 6,5/10

Constats historiques sur la stack Flutter + `/seo`. Traitement révisé : migration Astro ([`Architecture_SEO.md`](brainstorming/sessions/Architecture_SEO.md)).

## Branche de travail

`main` ; branches `feature/` ou `fix/` + PR (nettoyage des anciennes branches mergées recommandé).

## MVP2 — ordre immédiat

1. **Séance Direction visuelle** — charte, motion ([`brainstorming/TODO.md`](brainstorming/TODO.md))
2. **Séances suivantes** — messages et projets, cas Élan, mesure
3. **Revue préversion** puis tag **`V2.0.0`**

## Jalons produit

| Jalon | Statut | Contenu livré / visé |
|-------|--------|----------------------|
| **MVP1** | ✅ Terminé | Flutter + `/seo`, CI/CD, contact |
| **MVP2** | 🔵 En cours | Astro, contenu, légal, mesure — [`07_MVP2.md`](docs/07_MVP2.md) |
| **Bascule Astro** | ✅ Terminé | Tags `V1.5.x`, 301, sitemap GSC — [`08_Migration_Astro.md`](docs/08_Migration_Astro.md) |
| **Après MVP2** | À définir | Blog, multiplateforme, backend ([`docs/00_Vision.md`](docs/00_Vision.md)) |

Backlog officiel : [`TODO.md`](TODO.md).
