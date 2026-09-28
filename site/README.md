# Site vitrine Astro

Site public `fabien-blasquez.dev` (MVP2).

```bash
cd site
npm ci
npm run dev    # http://localhost:4321
npm run check  # types / diagnostics Astro
npm run build  # sortie dans dist/
```

Configuration : `astro.config.mjs` (`trailingSlash: 'always'`, sitemap intégré).

**Thème** : clair / sombre selon le réglage système (comme l’ancien Flutter `ThemeMode.system`) — tokens dans `src/styles/global.css`.

Redirections legacy : `public/_redirects`.

**MCP (optionnel, côté Cursor)** : voir [`docs/09_MCP_et_outils_agent.md`](../docs/09_MCP_et_outils_agent.md) — pas nécessaire pour `npm run build`.
