# Séance — Direction visuelle

> **Statut :** Terminée (29 septembre 2026)  
> **Prérequis :** parcours et structure ✅ (29/09/2026).

## Objectif

Fixer le niveau d’ambition visuelle : références, animations, images, rendu mobile.

## Entrées de la séance

- Résumé validé : [`exports/Direction_visuelle_MVP2_2026-09-29.md`](../../exports/Direction_visuelle_MVP2_2026-09-29.md)
- État visuel de départ : [`site/src/styles/global.css`](../../site/src/styles/global.css) (le CSS Astro, pas l’ancienne charte Flutter)
- Principes : [`docs/01_Principes.md`](../../docs/01_Principes.md)
- Structure déjà tranchée : [`Parcours_et_structure.md`](Parcours_et_structure.md)

## Décisions

Séance du 29 septembre 2026. Piste **équilibrée** : conserver l’identité sobre actuelle, lui donner davantage de mouvement et ajouter des visuels utiles. Le site reste lisible, crédible pour les PME comme pour les grandes structures, accessible, et compatible avec Lighthouse ≥ 90 sur mobile.

- **Palette et style.** Conserver le teal, l’accent bleu, la police Inter et les thèmes clair et sombre selon le système. Affiner la composition et les contrastes, sans nouvelle charte.
- **Ambition.** Plus de caractère visuel, sans effet « agence » ni template SaaS.
- **Mouvement au défilement.** Le mouvement se perçoit surtout quand les sections entrent dans le champ. Apparitions fluides, léger décalage entre les éléments d’une section, sans rejeu permanent. Ajuster le fondu et la translation actuels (0,7 s) si le ressenti est trop lent. Pas de défilement forcé ni de parallaxe lourde.
- **Micro-interactions.** Transitions courtes sur boutons, liens et cartes interactives ; survol et focus visibles. Pas de survol artificiel sur les cartes non cliquables.
- **Réduction du mouvement.** Respecter `prefers-reduced-motion` : contenu immédiatement disponible, navigation utilisable sans animation.
- **Accueil.** Visuel graphique original au premier écran : interface métier stylisée et schéma (panneaux, blocs, connexions) qui évoquent le passage du besoin à la solution. Pas de fausses données ni de capture fictive présentée comme réelle. Animation progressive et légère. Sur mobile : titre, présentation et CTA avant ce visuel.
- **Projets professionnels.** Captures réelles quand elles peuvent être montrées, sinon schémas légendés. Ne pas inventer de résultats ou d’interface client. La mise en page reste valable sans capture.
- **Élan.** Visuel propre au projet, à définir avec son cas. Pas de démo publique.
- **À propos.** Photo de Fabien acceptée et recommandée : portrait naturel et professionnel. Reprise éventuelle près d’un appel à contact si la maquette le justifie. L’accueil garde son visuel graphique.
- **Partage social.** Image Open Graph à créer avec les maquettes : palette, motif graphique et nom de Fabien, lisible au petit format.

### Repères de réalisation

- Visuel d’accueil en SVG ou composition HTML/CSS légère ; choisir la technique la plus simple après maquette. Éviter une bibliothèque d’animation si CSS et une petite logique d’observation suffisent.
- Les sections restent visibles sans JavaScript ; les mouvements sont réservés aux appareils qui les acceptent.
- Vérifier thèmes clair et sombre, clavier, contrastes AA, tailles mobiles et Lighthouse ≥ 90 mobile sur la préversion.
- Optimiser les photos et captures réellement utilisées ; le visuel du premier écran doit charger vite.

## Limites

- Textes finaux, contenu détaillé des cas clients : séance Messages.
- URL, contenu et visuel du cas Élan : séance Cas Projet Élan.
- Photo retenue, captures autorisées et références visuelles précises : à collecter avant la maquette finale. Leur absence ne bloque pas ce cadrage.
- Mesure d’audience et cookies : séance Mesure.

## Suivi documentaire

- [`docs/03_Design.md`](../../docs/03_Design.md) — charte Astro et décisions de la séance
- [`TODO.md`](../../TODO.md), [`PROJECT_STATUS.md`](../../PROJECT_STATUS.md), [`brainstorming/TODO.md`](../TODO.md)
