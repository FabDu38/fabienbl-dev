# PROJECT STATUS

> **Objectif :** Donner une vue instantanée de l'état actuel du site vitrine fabien-blasquez.dev.

## Phase

- **MVP1** — ✅ terminé
- **MVP2** — 🔵 en cours — séance Architecture/SEO ✅ ; **jalon 1 : migration Astro** en cours ([`docs/08_Migration_Astro.md`](docs/08_Migration_Astro.md))

## État actuel

- **Code source** : site Astro dans `site/` (jalon 1 implémenté)
- **Production live** : site Astro ; mises à jour volontaires au tag **`V*`** ([`docs/06_Infrastructure.md`](docs/06_Infrastructure.md))
- **Préversion** : deploy Netlify `astro-preview` (noindex) sur push `main`
- Domaine fabien-blasquez.dev, HTTPS, EmailJS + SimpleLogin opérationnels
- Google Search Console : sitemap historique `/seo/sitemap.xml` (à migrer après bascule Astro)

## Audit du 19/08/2026 — Note : 6,5/10

Constats historiques sur la stack Flutter + `/seo`. Traitement révisé : migration Astro ([`Architecture_SEO.md`](brainstorming/sessions/Architecture_SEO.md)).

## Branche de travail

`feature/mvp2-decisions-astro` ou branches `feature/astro-*` depuis `main`.

## MVP2 — ordre immédiat

1. **Jalon 1** — migration Astro (8 étapes, [`TODO.md`](TODO.md))
2. **Séances** — parcours, visuel, messages, Élan, mesure
3. **Revue préversion** puis tag **`V2.0.0`**

## Jalons produit

| Jalon | Statut | Contenu livré / visé |
|-------|--------|----------------------|
| **MVP1** | ✅ Terminé | Flutter + `/seo`, CI/CD, contact |
| **MVP2** | 🔵 En cours | Astro, contenu, légal, mesure — [`07_MVP2.md`](docs/07_MVP2.md) |
| **Bascule Astro** | 🔵 En cours | Tag type `V1.5.0`, 301, nouveau sitemap |
| **Après MVP2** | À définir | Blog, multiplateforme, backend ([`docs/00_Vision.md`](docs/00_Vision.md)) |

Backlog officiel : [`TODO.md`](TODO.md).
