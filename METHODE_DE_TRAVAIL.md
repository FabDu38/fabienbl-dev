# Méthode de travail

> **Objectif :** Définir la manière dont le site vitrine fabien-blasquez.dev est conçu, documenté et développé afin que le projet puisse évoluer sans perdre ses décisions ni leur raison d'être.

## Principe fondamental

Le dépôt constitue la source de vérité du projet.

Les conversations avec un humain ou un agent IA servent à explorer des idées, confronter des points de vue et prendre des décisions. Elles ne doivent pas devenir l'unique endroit où réside la connaissance du projet.

Une décision n'est durable que lorsqu'elle a été cristallisée dans le document auquel elle appartient.

L'objectif est qu'une nouvelle personne ou un nouvel agent puisse reprendre le projet en lisant uniquement le dépôt, sans dépendre de l'historique d'une conversation.

## Cycle de travail

```text
Idée
  ↓
Brainstorming
  ↓
Débat
  ↓
Décision
  ↓
Cristallisation
  ↓
Vérification
  ↓
Commit
```

### 1. Brainstormer

Une session de brainstorming explore librement un sujet. Elle peut contenir des questions ouvertes, des désaccords, des hypothèses, des pistes incomplètes et des idées finalement abandonnées.

La session est conservée dans `brainstorming/sessions/` afin de préserver l'historique et le raisonnement.

Une fois marquée comme terminée, elle devient un instantané historique et n'est plus réécrite.

### 2. Débattre et qualifier

Les idées sont confrontées aux besoins réels du projet. Elles doivent être distinguées selon leur maturité :

- une décision validée ;
- une hypothèse à vérifier ;
- une idée à explorer plus tard ;
- une piste abandonnée.

Une intuition plausible ne doit jamais être présentée comme une connaissance établie.

### 3. Cristalliser

Après le brainstorming, les décisions et les raisonnements qui les justifient sont reformulés dans les documents officiels.

La cristallisation conserve ce qui permet de comprendre :

- ce qui a été décidé ;
- pourquoi cette décision a été prise ;
- quelles limites ont été posées ;
- quelles incertitudes subsistent.

Une décision validée rejoint le document dont la responsabilité correspond à son sujet :

- `docs/00_Vision.md` : objectifs du site, public cible, promesse, positionnement, offre, canaux d'acquisition ;
- `docs/01_Principes.md` : principes directeurs (design, technique, ton éditorial) ;
- `docs/02_Contenu.md` : structure des pages, contenus, messages clés ;
- `docs/03_Design.md` : charte graphique, tokens, responsive, animations ;
- `docs/04_SEO_Performance.md` : stratégie SEO, accessibilité, performance ;
- `docs/05_Audit_*.md` : audits datés (constats, plan d'action) ;
- `docs/06_Infrastructure.md` : hébergement, CI/CD, déploiement, email, DNS, outils opérationnels.

Une même décision peut avoir des conséquences sur plusieurs documents, mais chaque aspect ne doit être décrit en détail qu'à un seul endroit.

Une idée encore immature reste dans `brainstorming/TODO.md`.

### 4. Établir l'impact documentaire

À la fin de chaque brainstorming, la question suivante est posée systématiquement :

> Quels documents de référence doivent être mis à jour à cause de cette décision ?

Cette revue porte au minimum sur :

- le fichier de la session ;
- `brainstorming/TODO.md`, pour les idées et questions restantes ;
- les documents concernés dans `docs/` ;
- `PROJECT_STATUS.md`, si l'état courant change ;
- `TODO.md`, si des actions officielles découlent des décisions ;
- `METHODE_DE_TRAVAIL.md`, si le brainstorming modifie la méthode.

### 5. Mettre à jour le pilotage

- `PROJECT_STATUS.md` indique où en est le projet aujourd'hui ;
- `TODO.md` contient le backlog officiel et les prochaines actions ;
- `brainstorming/TODO.md` conserve les idées et sujets pas encore tranchés.

### 6. Vérifier

Avant de valider une modification :

- relire le document dans son ensemble ;
- vérifier sa cohérence avec les décisions existantes ;
- éliminer les doublons et les contradictions ;
- examiner le diff produit.

### 7. Committer

Chaque jalon cohérent fait l'objet d'un commit.

Convention de commits : `type: description courte` (feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert).

Branches : `feature/`, `fix/`, `hotfix/`, `release/` depuis `main`.

Versioning : semver `MAJEUR.MINEUR.PATCH` avec suffixes `alpha` / `rc` en pré-production.

## Responsabilité des documents

Chaque fichier ou dossier remplit une responsabilité unique.

- `README.md` présente le projet et oriente la première lecture ;
- `PROJECT_STATUS.md` donne une vue instantanée de l'état actuel ;
- `TODO.md` contient les actions officielles à venir ;
- `METHODE_DE_TRAVAIL.md` définit la manière de construire le projet ;
- `docs/` contient la connaissance consolidée et validée (vision, principes, contenu, design, SEO, audits, infrastructure) ;
- `brainstorming/` conserve les explorations antérieures à la validation ;
- `confidentiel/` contient les documents business confidentiels et sources externes (business plan, profil, projet de création, Google Doc, exports iceScrum — non versionnés dans le contenu) ;
- `assets/` rassemble les ressources visuelles ;
- `seo/` contient la couche SEO statique HTML ;
- `lib/` contient le code Flutter de l'application ;
- `scripts/` contient les scripts utilitaires.

### Formats

- Le format standard du dépôt est le **Markdown** (`.md`).
- Les documents confidentiels restent dans leur format natif (PDF).

## Règles documentaires

- Chaque document annonce son objectif dès son introduction.
- La documentation doit être aussi courte que possible, mais aussi complète que nécessaire.
- Les décisions sont accompagnées de leur justification.
- Chaque information ne doit exister qu'à un seul endroit.
- La documentation validée prime sur les souvenirs d'une conversation.

## Relation avec l'agent IA

L'agent IA est un partenaire de réflexion et d'exécution. Il ne constitue pas la mémoire du projet : cette mémoire réside dans le dépôt.

Au début d'une nouvelle session, l'agent consulte en priorité :

1. `README.md` ;
2. `PROJECT_STATUS.md` ;
3. `METHODE_DE_TRAVAIL.md` ;
4. le document actuellement concerné.

## Développement

- Une tâche cohérente est traitée à la fois.
- Elle est terminée et vérifiée avant de passer à la suivante.
- L'application doit rester fonctionnelle.
- Les idées hors périmètre retournent dans le backlog approprié.
