# PROJECT STATUS

> **Objectif :** Donner une vue instantanée de l'état actuel du site vitrine fabien-blasquez.dev.

## Phase

- **MVP1** — ✅ terminé
- **MVP2** — 🔵 en cours — **jalon 1 migration Astro ✅** (recette prod validée, tag **`V1.5.2`**) ; **parcours, direction visuelle, messages, Élan et mesure ✅** ; production **`V1.7.1`** (mesure testée le 08/10/2026) ; captures professionnelles et image de partage laissées de côté pour cette version ; **séance en cours : revue de la préversion**

## État actuel

- **Code source** : site Astro dans `site/` (seul site vitrine du dépôt)
- **Production live** : Astro sur fabien-blasquez.dev ; déploiement prod au tag **`V*`** ([`docs/06_Infrastructure.md`](docs/06_Infrastructure.md)) — release **`V1.7.1`** (mesure d’audience active après accord)
- **Préversion** : deploy Netlify `astro-preview` (noindex) sur push `main`
- Domaine fabien-blasquez.dev, HTTPS, EmailJS + SimpleLogin opérationnels
- **Google Search Console** : sitemap `https://fabien-blasquez.dev/sitemap-index.xml` ; surveillance couverture 2–4 semaines

## Audit du 19/08/2026 — Note : 6,5/10

Constats historiques sur la stack Flutter + `/seo`. Traitement révisé : migration Astro ([`Architecture_SEO.md`](brainstorming/sessions/Architecture_SEO.md)).

## Branche de travail

`main` ; branches `feature/` ou `fix/` + PR (nettoyage des anciennes branches mergées recommandé).

## MVP2 — ordre jusqu’à la publication

1. **Revue de la préversion** — en cours le 08/10/2026. Captures professionnelles et image de partage écartées pour cette version.
2. **Publication** — tag **`V2.0.0`** après le feu vert de la revue.

## Jalons produit

| Jalon | Statut | Contenu livré / visé |
|-------|--------|----------------------|
| **MVP1** | ✅ Terminé | Flutter + `/seo`, CI/CD, contact |
| **MVP2** | 🔵 En cours | Astro, contenu, légal, mesure — [`07_MVP2.md`](docs/07_MVP2.md) |
| **Bascule Astro** | ✅ Terminé | Tags `V1.5.x`, 301, sitemap GSC — [`08_Migration_Astro.md`](docs/08_Migration_Astro.md) |
| **Après MVP2** | À définir | Blog, multiplateforme, backend ([`docs/00_Vision.md`](docs/00_Vision.md)) |

Backlog officiel : [`TODO.md`](TODO.md).
