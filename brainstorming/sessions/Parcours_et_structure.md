# Séance — Parcours et structure

> **Statut :** Terminée (29 septembre 2026)  
> **Prérequis :** séance architecture / SEO ✅ ; jalon 1 Astro ✅ ([`docs/08_Migration_Astro.md`](../../docs/08_Migration_Astro.md)).

## Objectif

Définir ce que voit le visiteur, dans quel ordre, et le contenu macro de chaque page (Accueil, Services, Projets, À propos, Contact).

## Entrées de la séance

- Contenu cristallisé : [`docs/02_Contenu.md`](../../docs/02_Contenu.md)
- Principes éditoriaux : [`docs/01_Principes.md`](../../docs/01_Principes.md)
- Plan d’URL déjà tranché : [`Architecture_SEO.md`](Architecture_SEO.md) (table « Plan d’URL indicatif »)
- Site live : https://fabien-blasquez.dev

## Décisions

Séance du 29 septembre 2026. Le site vitrine reste un site Astro unique, avec les URL canoniques déjà décidées et une barre finale.

- **Menu principal :** Accueil · Services · Projets · À propos · Contact. Le logo mène aussi à l’accueil ; Contact reste mis en avant. Le footer reprend les pages utiles, les coordonnées et les liens légaux. À la mise en place, Accueil a été remis dans le menu : le logo seul ne suffisait pas.
- **Une seule page Services** pour le MVP2. La cible ne se limite pas aux PME : l’expérience chez Schneider et Siemens doit aussi parler aux grandes organisations et à leurs équipes métier.
- L’accueil met d’abord en avant les applications métier, puis la capacité de cadrage et de pilotage.
- **CTA** des pages commerciales : « Parlons de votre projet », vers `/contact/`. Bouton du formulaire : « Envoyer mon message ». Des liens contextuels vers Services et Projets restent possibles.
- `/projets/` conserve le titre « Projets ». Deux entrées, dans cet ordre : **Projets professionnels**, puis **Élan**. Le cas Élan n’offre pas de démo publique.
- La carte « outil de suivi d’activités et d’objectifs » est retirée tant qu’elle n’a pas de contenu consultable.
- Le **portfolio** n’est plus affiché. Son code source est conservé hors des routes ; les liens internes visibles sont retirés ; `/projets/portfolio/` redirige en **301 vers `/projets/`**. L’étude actuelle est trop simple pour servir de cas mis en avant.

### Plan des pages

Le détail (intention, sections, CTA, menu) est dans [`docs/02_Contenu.md`](../../docs/02_Contenu.md).

### Services

1. Créer une application métier — validé.
2. Faire évoluer un outil existant — validé.
3. Automatiser des tâches et des échanges de données — **formulation de travail** (remplace « relier et automatiser des outils ») ; libellé final à confirmer en séance Messages.
4. Cadrer et piloter un projet numérique — validé comme service autonome, y compris si Fabien ne réalise pas lui-même le développement.

### Parcours visiteurs

- **Recherche :** accueil ou Services → comprendre les missions → consulter un cas professionnel → contacter Fabien.
- **Recommandation ou LinkedIn :** accueil ou À propos → vérifier l’expérience → consulter les projets → contacter Fabien.

## Limites

- Formulation précise de la promesse et des publics sur le premier écran : séance Messages. Le premier écran actuel reste en place en attendant.
- Textes finaux, place éventuelle de l’IA, sélection et niveau de détail des cas professionnels : séance Messages.
- URL et contenu de la page Élan : séance Cas Projet Élan. En attendant, une carte sans lien sur `/projets/`.
- Direction visuelle, maquettes et animations : séance Direction visuelle.

## Suivi documentaire

- [`docs/02_Contenu.md`](../../docs/02_Contenu.md) — plan des pages, ordre de l’accueil, services, projets
- [`docs/04_SEO_Performance.md`](../../docs/04_SEO_Performance.md) et [`docs/08_Migration_Astro.md`](../../docs/08_Migration_Astro.md) — 301 `/projets/portfolio/` → `/projets/`
- [`TODO.md`](../../TODO.md), [`PROJECT_STATUS.md`](../../PROJECT_STATUS.md), [`brainstorming/TODO.md`](../TODO.md)
