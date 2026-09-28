# fabienbl-dev

Site vitrine professionnel [fabien-blasquez.dev](https://fabien-blasquez.dev), construit avec **Astro** (MVP2).

## Objectif

Site personnel responsive : vitrine freelance, pages indexables, formulaire de contact.

**Phase actuelle :** MVP2 — migration Astro (jalon 1). Détail : [`PROJECT_STATUS.md`](PROJECT_STATUS.md), [`TODO.md`](TODO.md), [`docs/08_Migration_Astro.md`](docs/08_Migration_Astro.md).

## Premiers pas

```bash
cd site
npm ci
npm run dev
```

Build production : `npm run build` (sortie `site/dist/`).

## Structure du dépôt

```
├── site/                 Application Astro (site public)
├── docs/                 Documentation projet
├── brainstorming/        Séances de décision MVP2
├── TODO.md               Backlog officiel
└── netlify.toml          Build Netlify → site/dist
```

## Déploiement

- **CI :** [`.github/workflows/astro-ci.yml`](.github/workflows/astro-ci.yml)
- **Production :** tag `V*` → [`docs/06_Infrastructure.md`](docs/06_Infrastructure.md), recette [`docs/08_Migration_Astro.md`](docs/08_Migration_Astro.md)
- **Préversion :** deploy Netlify `astro-preview` (noindex) sur push `main`
