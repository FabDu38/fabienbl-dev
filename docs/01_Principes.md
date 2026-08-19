# Principes

> **Objectif :** Définir les principes directeurs du site en matière de design, technique et ton éditorial.

## Ton éditorial

- Professionnel, clair, sans buzzwords
- Sobre et crédible — pas de marketing agressif
- Français, vouvoiement pour le contenu orienté client

## Design

- Simplicité et lisibilité avant tout
- Responsive réel (desktop, tablette, mobile)
- Animations légères et maîtrisées (pas de "bling")
- Accessibilité intégrée dès la conception (contrastes AA, focus visibles)

## Technique

- Flutter Web comme socle — codebase unique, évolutif vers mobile/desktop
- Pas de sur-ingénierie : juste ce qui sert le besoin actuel
- CI/CD systématique (build + déploiement automatique)
- Lighthouse ≥ 90 mobile comme baseline

## Contenu

- 1 page = 1 intention claire
- CTA unique et explicite par page
- Le visiteur comprend en 10 secondes : qui je suis / ce que je propose / comment me contacter

## Cadre réglementaire

- **RGPD** : consentement explicite, finalité et durée de conservation documentées, droit d'accès/modification/suppression
- **RC Pro** : assurance responsabilité civile professionnelle souscrite (1 800 €/an)
- **Propriété du code** : à définir dans chaque contrat client (cession ou non du code source)
- **Licences** : vérifier les licences (MIT, GPL…) de chaque framework/outil utilisé
- **Accessibilité** : normes WCAG 2.1 à respecter (obligatoire si secteur public ou demande client)
- **Statut** : micro-entrepreneur, franchise en base de TVA (seuil 36 800 €)

## Versioning & Git

- Convention commits : `type: description` (feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert)
- Branches : `feature/`, `fix/`, `hotfix/`, `release/` depuis `main`
- PR systématique, même en solo
- Semver : `MAJEUR.MINEUR.PATCH` avec suffixes `alpha` / `rc`
