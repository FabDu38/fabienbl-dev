# PROJECT STATUS

> **Objectif :** Donner une vue instantanée de l'état actuel du site vitrine fabien-blasquez.dev.

## Phase

- **MVP1** — ✅ terminé
- **MVP2** — 🔵 en cours (cadrage ✅ — voir [`docs/07_MVP2.md`](docs/07_MVP2.md), séances [`brainstorming/TODO.md`](brainstorming/TODO.md))

## État actuel

- Site Flutter Web fonctionnel avec navigation (go_router)
- Hébergement Netlify ; CI sur chaque push/PR ; **prod** uniquement sur tag `V*` (voir [`06_Infrastructure.md`](docs/06_Infrastructure.md))
- Domaine fabien-blasquez.dev configuré avec HTTPS
- Thème Material 3 appliqué (seed color #2BBBAD, police Inter)
- Pages en place : Accueil, À propos, Projets, Contact, Mentions légales
- Animations flutter_animate intégrées
- Couche SEO statique HTML en place (`/seo`)
- Configuration email (SimpleLogin + EmailJS)
- Boîte mail contact@fabien-blasquez.dev opérationnelle
- Google Search Console configurée, indexation demandée

## Audit du 19/08/2026 — Note : 6,5/10

Points forts : design sobre (8/10), SEO statique solide (8/10), navigation claire (7/10).
Points faibles : HTML Flutter quasi vide (3/10), accessibilité (3/10), preuves commerciales insuffisantes (6/10).

Détail : [`docs/05_Audit_2026-08-19.md`](docs/05_Audit_2026-08-19.md)

## Branche de travail

`feature/prep-verif-prod` — phase 1 préparation MVP2.

## MVP2 — ordre immédiat

1. **Préparation** — essentiellement faite (audit + tag `mvp1-final` + CI locale) ; optionnel : test mail contact
2. **Séance en cours** — [Architecture & SEO](brainstorming/sessions/Architecture_SEO.md) (décisions, pas refaire l’audit visuel)
3. **Revue préversion** puis publication (tag `V2.0.0`)

## Jalons produit

| Jalon | Statut | Contenu livré / visé |
|-------|--------|----------------------|
| **MVP1** | ✅ Terminé | Site vitrine déployé (pages, contact, thème, CI/CD, couche `/seo`, Search Console branchée) |
| **MVP2** | 🔵 En cours | Objectifs [`07_MVP2.md`](docs/07_MVP2.md) ; séances [`brainstorming/TODO.md`](brainstorming/TODO.md) |
| **Après MVP2** | À définir | Blog, multiplateforme, backend dynamique, multilingue ([`docs/00_Vision.md`](docs/00_Vision.md)) |

Backlog officiel : [`TODO.md`](TODO.md). Idées exploratoires : [`brainstorming/TODO.md`](brainstorming/TODO.md).
