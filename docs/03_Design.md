# Design

> **Objectif :** Documenter les choix graphiques, la charte visuelle et les décisions de design du site vitrine Astro.
>
> Décisions : séance [Direction visuelle](../brainstorming/sessions/Direction_visuelle.md) (29/09/2026). Tokens en place : [`site/src/styles/global.css`](../site/src/styles/global.css).

## Ambition

Piste **équilibrée** : conserver l’identité sobre actuelle, ajouter du mouvement et des visuels utiles. Le site reste lisible et crédible pour les PME comme pour les grandes structures. Pas d’effet « agence » ni de template SaaS.

## Couleurs

Thème clair par défaut, thème sombre via `prefers-color-scheme`. Pas de nouvelle charte : affiner composition et contrastes à partir de ces tokens.

| Rôle | Clair | Sombre |
|------|-------|--------|
| Primaire | `#006a62` | `#82d5ca` |
| Accent | `#1f7fa3` | `#8ccdf0` |
| Surface | `#f4fbf8` | `#0e1514` |
| Texte | `#161d1c` | `#dde4e2` |

Le primaire au survol, les contenants et les surfaces intermédiaires sont dans `global.css`. Contrastes **AA** minimum.

## Typographie

**Inter** (400 à 800), chargée pour l’ensemble du site. Corps à 16 px, interligne 1,5.

## Forme

Rayons `--radius` 12 px, `--radius-lg` 20 px, `--radius-xl` 28 px. Largeur de contenu 960 px, largeur large 1120 px.

## Mouvement

Le mouvement se perçoit surtout quand une section entre dans le champ, puis pendant le parcours de la page.

- Apparitions fluides, avec un léger décalage entre les éléments d’une section. L’animation ne rejoue pas en permanence.
- Le fondu et la translation actuels durent **0,7 s** (`--ease`). Les raccourcir si le ressenti est trop lent.
- Micro-interactions courtes sur boutons, liens et cartes interactives. États de survol et de focus visibles. Pas de survol artificiel sur une carte non cliquable.
- Pas de défilement forcé ni de parallaxe lourde.
- `prefers-reduced-motion` : contenu immédiatement disponible, navigation utilisable sans animation.
- Sans JavaScript, les sections restent visibles. Réserver les mouvements aux appareils qui les acceptent.
- Pas de bibliothèque d’animation si le CSS et une petite logique d’observation suffisent.

## Visuels

- **Accueil.** Visuel graphique original au premier écran : interface métier stylisée et schéma (panneaux, blocs, connexions) qui évoquent le passage du besoin à la solution. Pas de fausses données ni de capture fictive présentée comme réelle. Animation progressive et légère. Le concevoir en SVG ou en HTML/CSS léger, puis choisir la technique la plus simple après maquette. Il doit charger vite.
- **Mobile (premier écran).** Titre, présentation et appel à l’action avant le visuel. Visuel simplifié ensuite. Cartes sur une colonne, textes faciles à parcourir, animations plus discrètes. Ne pas supposer une hauteur d’écran unique pour placer l’appel à l’action.
- **Projets professionnels.** Captures réelles quand elles peuvent être montrées, sinon schémas légendés. Ne pas inventer de résultats ou d’interface client. La mise en page reste valable sans capture.
- **Élan.** Visuel propre au projet, défini avec son cas. Pas de démo publique.
- **À propos.** Portrait de Fabien sur la page (`site/public/images/fabien-blasquez.png`). L’accueil garde son visuel graphique.
- **Open Graph.** Image de partage créée avec les maquettes : palette, motif graphique et nom de Fabien, lisible au petit format.

Photos et captures réellement utilisées : les optimiser. La photo retenue, les captures autorisées et les références visuelles précises se collectent avant la maquette finale.

## Responsive

Lisible et utilisable sur desktop, tablette et mobile.

## Accessibilité et performance

- Contrastes AA, focus visibles, navigation clavier
- Thèmes clair et sombre vérifiés
- Cible Lighthouse ≥ 90 sur mobile, contrôlée sur la préversion
- Premier écran léger
