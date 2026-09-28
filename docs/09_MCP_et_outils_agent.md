# MCP et outils agent — étude (jalon 1 Astro)

> **Contexte :** livrable de l’étape 2 du jalon migration ([`08_Migration_Astro.md`](08_Migration_Astro.md)), issu de l’export Architecture/SEO (28/09/2026).  
> **Objectif :** comprendre si le **Model Context Protocol (MCP)** apporte quelque chose de concret pour ce dépôt, sans l’imposer au build.

## C’est quoi, MCP ?

**MCP** est un protocole ouvert pour connecter un assistant (ex. Cursor) à des **outils externes** : navigateur, API, docs, déploiement, etc. Chaque capacité est exposée par un **serveur MCP** ; l’IDE ou l’agent appelle ces outils pendant une session.

Ce n’est **pas** une dépendance du site Astro : c’est une option **côté poste de dev** (configuration Cursor / CLI).

## Intérêt concret pour fabien-blasquez.dev

| Besoin du projet | Sans MCP | Avec MCP (si configuré) |
|------------------|----------|-------------------------|
| Build / deploy Astro | `npm run build`, GitHub Actions, Netlify | Idem ; MCP n’ajoute pas le build |
| Recette préversion (clics, 301, formulaire) | Manuel ou scripts | **Navigateur MCP** : parcours automatisé, snapshots, vérif visuelle |
| Lighthouse SEO ≥ 90 | Chrome DevTools ou CI externe | Navigateur + éventuellement outils perf si serveur dédié |
| Docs Astro / Netlify | Liens officiels, lecture dans le chat | Serveurs **docs** MCP (si disponibles) : recherche dans la doc à jour |
| Secrets / prod | GitHub Secrets, pas dans le repo | **Ne pas** brancher de MCP sur les tokens en clair |

Pour ce jalon, le gain principal serait la **recette** (étapes 6–7) : valider menu mobile, redirections et contact sur l’URL `astro-preview` sans tout refaire à la main.

## Serveurs / outils pertinents (vue projet)

| Outil | Rôle possible | Pertinence MVP2 |
|-------|----------------|-----------------|
| **cursor-ide-browser** (intégré Cursor) | Navigation, formulaire, 404, screenshots | **Élevée** pour recette préversion |
| **Netlify** | Pas de serveur MCP officiel obligatoire dans le dépôt ; deploy reste **CLI + Actions** | Faible via MCP ; CI déjà en place |
| **Astro** | Pas de MCP « Astro » standard ; doc via [astro.build](https://docs.astro.build) | N/A |
| Serveurs MCP communautaires (filesystem, fetch, etc.) | Lecture repo, URLs | Utile en secours, redondant avec l’agent dans le repo |

Aucun serveur MCP **spécifique Astro** n’est requis pour compiler ou publier le site.

## Limites

- Configuration **par machine** (Cursor → MCP) : pas versionnée comme le code du site.
- Courbe d’apprentissage et maintenance des serveurs (mises à jour, auth).
- Les deploys **prod** restent sur **tag `V*`** + secrets GitHub ; MCP ne remplace pas cette procédure ([`06_Infrastructure.md`](06_Infrastructure.md)).
- Risque de sur-confiance : un test navigateur MCP ne remplace pas Search Console ni la surveillance post-301.

## Installations — faut-il en faire pour le jalon 1 ?

**Décision retenue : non, pas obligatoire.**

- Le site se build avec Node dans `site/`.
- La CI **Astro** ([`.github/workflows/astro-ci.yml`](../.github/workflows/astro-ci.yml)) couvre build + preview + prod au tag.
- La note d’étude ci-dessus suffit pour trancher « documenter avant d’installer ».

### Si tu veux quand même activer le navigateur MCP (Cursor)

1. Cursor → **Settings** → **MCP** (ou fichier de config MCP du projet / utilisateur).
2. Vérifier que le serveur **Browser** (ou équivalent `cursor-ide-browser`) est listé et activé pour la session Agent.
3. Utiliser l’agent en mode Agent sur une URL de préversion Netlify (`astro-preview`) pour : accueil, `/contact/`, test formulaire, une URL `/seo/*.html` en 301.

Aucun `npm install` dans `site/` n’est nécessaire pour MCP.

## Réévaluation

Revoir ce document si :

- tu enchaînes beaucoup de recettes Lighthouse / accessibilité sur la préversion ;
- tu ajoutes des automatisations hors CI (smoke tests post-deploy) ;
- un serveur MCP Netlify ou monitoring devient pertinent (uptime, erreurs JS — backlog [`TODO.md`](../TODO.md)).

## Liens

- [Model Context Protocol](https://modelcontextprotocol.io/)
- [Astro — install](https://docs.astro.build/en/install-and-setup/)
- [Astro on Netlify](https://docs.astro.build/en/guides/deploy/netlify/)
