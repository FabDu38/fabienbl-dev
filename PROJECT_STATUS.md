# PROJECT STATUS

> **Objectif :** Donner une vue instantanée de l'état actuel du site vitrine fabien-blasquez.dev.

## Phase

- **MVP1** — ✅ terminé
- **MVP2** — 🔵 en cours — **jalon 1 migration Astro ✅** (recette prod validée, tag **`V1.5.2`**) ; **parcours, direction visuelle, messages, Élan et mesure ✅** (29/09 au 06/10/2026) ; production **`V1.6.0`** ; Umami et Better Stack configurés le 08/10/2026 (script Umami actif au prochain tag) ; **prochaine séance : revue de la préversion**

## État actuel

- **Code source** : site Astro dans `site/` (seul site vitrine du dépôt)
- **Production live** : Astro sur fabien-blasquez.dev ; déploiement prod au tag **`V*`** ([`docs/06_Infrastructure.md`](docs/06_Infrastructure.md)) — release **`V1.6.0`** (parcours validé, visuel d’accueil, cas Élan)
- **Préversion** : deploy Netlify `astro-preview` (noindex) sur push `main`
- Domaine fabien-blasquez.dev, HTTPS, EmailJS + SimpleLogin opérationnels
- **Google Search Console** : sitemap `https://fabien-blasquez.dev/sitemap-index.xml` ; surveillance couverture 2–4 semaines

## Audit du 19/08/2026 — Note : 6,5/10

Constats historiques sur la stack Flutter + `/seo`. Traitement révisé : migration Astro ([`Architecture_SEO.md`](brainstorming/sessions/Architecture_SEO.md)).

## Branche de travail

`main` ; branches `feature/` ou `fix/` + PR (nettoyage des anciennes branches mergées recommandé).

## MVP2 — ordre jusqu’à la publication

1. **Assets encore ouverts** — captures des projets professionnels. Page Élan condensée en production depuis `V1.6.0`. Image de partage reportée.
2. **Revue de la préversion**
3. **Publication** — tag **`V2.0.0`**. Le script Umami, déjà configuré, part avec ce tag.

## Jalons produit

| Jalon | Statut | Contenu livré / visé |
|-------|--------|----------------------|
| **MVP1** | ✅ Terminé | Flutter + `/seo`, CI/CD, contact |
| **MVP2** | 🔵 En cours | Astro, contenu, légal, mesure — [`07_MVP2.md`](docs/07_MVP2.md) |
| **Bascule Astro** | ✅ Terminé | Tags `V1.5.x`, 301, sitemap GSC — [`08_Migration_Astro.md`](docs/08_Migration_Astro.md) |
| **Après MVP2** | À définir | Blog, multiplateforme, backend ([`docs/00_Vision.md`](docs/00_Vision.md)) |

Backlog officiel : [`TODO.md`](TODO.md).
