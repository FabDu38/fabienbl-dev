# PROJECT STATUS

> **Objectif :** Donner une vue instantanée de l'état actuel du site vitrine fabien-blasquez.dev.

## Phase

- **MVP1** — ✅ terminé
- **MVP2** — 🔵 en cours — **jalon 1 migration Astro ✅** (recette prod validée, tag **`V1.5.2`**) ; **parcours et structure ✅** (29/09/2026) ; **direction visuelle ✅** (29/09/2026) ; **prochaine séance : Messages et projets** ([`brainstorming/sessions/Messages_et_projets.md`](brainstorming/sessions/Messages_et_projets.md))

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

## MVP2 — ordre jusqu’à la publication

1. **Séance Messages et projets** — formulations, cas hors Élan ([`brainstorming/TODO.md`](brainstorming/TODO.md))
2. **Séance Cas Projet Élan** — peut chevaucher l’étape 1 ; fichier distinct
3. **Chantier direction visuelle** — maquettes puis implémentation ([`TODO.md`](TODO.md), [`docs/03_Design.md`](docs/03_Design.md)). Accueil et mouvement en parallèle des étapes 1 et 2. Photo, captures autorisées et visuel Élan dès que ces éléments sont là. Terminé avant la revue.
4. **Séance Mesure, surveillance et données**, puis mise en place
5. **Revue de la préversion** — une fois les décisions des séances et le chantier visuel implémentés
6. **Publication** — tag **`V2.0.0`**

## Jalons produit

| Jalon | Statut | Contenu livré / visé |
|-------|--------|----------------------|
| **MVP1** | ✅ Terminé | Flutter + `/seo`, CI/CD, contact |
| **MVP2** | 🔵 En cours | Astro, contenu, légal, mesure — [`07_MVP2.md`](docs/07_MVP2.md) |
| **Bascule Astro** | ✅ Terminé | Tags `V1.5.x`, 301, sitemap GSC — [`08_Migration_Astro.md`](docs/08_Migration_Astro.md) |
| **Après MVP2** | À définir | Blog, multiplateforme, backend ([`docs/00_Vision.md`](docs/00_Vision.md)) |

Backlog officiel : [`TODO.md`](TODO.md).
