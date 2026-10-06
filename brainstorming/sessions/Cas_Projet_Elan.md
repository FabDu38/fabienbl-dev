# Séance — Cas Projet Élan

> **Statut :** Terminée (1er octobre 2026)  
> **Prérequis :** messages et projets ✅ (01/10/2026).

## Objectif

Définir comment **Projet Élan** apparaît sur le site MVP2 : angle, profondeur, confidentialité, structure du cas.

## Décisions

Séance du 1er octobre 2026.

- **Page dédiée** `/projets/elan/`, hors menu principal. Carte identique sur l’accueil et `/projets/`, cliquable. Lien : « Découvrir le projet ».
- **Angle.** Cas de référence pour le savoir-faire en IA : produit, choix de conception et méthode. Origine personnelle assumée, sans détailler la reconversion.
- **État.** Premier MVP terminé et conforme à sa promesse. Ne pas le présenter comme une idée ou un projet à venir. Pastille « Bientôt » retirée. Kicker : « Projet personnel ».
- **Publics.** Personnes qui réfléchissent à leur avenir professionnel, et professionnels qui les accompagnent. Ne pas en déduire des fonctions non confirmées.
- **Hors texte public.** Aucune démo ni accès public. Modèle économique confidentiel. Pas de publication exhaustive des prompts ni des coûts.
- **Visuel.** Captures réelles du MVP (profil, exploration, accompagnement), données fictives ou anonymisées, une légende par capture. Aucune capture fournie : la page fonctionne sans image. Pas de capture inventée.
- Menu, CTA « Parlons de votre projet » et direction visuelle inchangés.

### Carte

Projet personnel

**Élan — L’IA au service du projet professionnel**

Une application qui associe IA et données métiers pour comprendre sa situation, explorer des pistes et être accompagné dans son projet professionnel.

Découvrir le projet

### Page

Le texte intégral validé est dans [`docs/02_Contenu.md`](../../docs/02_Contenu.md). Titre : « Élan — L’IA au service du projet professionnel ». Sections : introduction ; un projet né d’un besoin personnel ; comprendre, explorer et avancer ; une IA articulée aux données et aux choix de l’utilisateur ; du besoin au produit ; une première version achevée.

Métadonnées title et description : non validées. Une proposition est posée sur la page en attendant.

### Ajustement du 6 octobre 2026

Dossier `exports/elan-ajustements-bernard.zip`. Ce n’est pas une nouvelle charte : l’en-tête, les boutons et le pied du site restent ceux déjà décidés.

- Texte public condensé. L’origine personnelle tient dans l’introduction. Rôle, méthode et IA sont regroupés. L’état actuel et la suite tiennent dans un paragraphe.
- Captures près du texte : profil en grand sous « Partir de la personne » ; fiche métier et formations côte à côte sous « Passer aux possibilités concrètes » ; accompagnement en grand sous « Organiser le passage à l’action ». Sur mobile, la paire passe en une colonne. Agrandissement accessible.
- La capture de profil est retouchée (Vue dév, API OK et la bulle d’échec retirés, aucun dialogue ajouté). Les trois autres sont inchangées.
- « Premier MVP achevé » est affiché. Pas de démo. CTA inchangé.

## Limites

- Captures : posées le 6 octobre 2026. La capture de profil est une retouche, pas une capture brute.
- Photo de Fabien et image Open Graph : hors de cette séance.
- Intégration des autres textes (accueil, services, cas professionnels) : chantier Messages, mené en même temps.

## Suivi documentaire

- [`docs/02_Contenu.md`](../../docs/02_Contenu.md) — URL, carte, texte de page
- [`docs/04_SEO_Performance.md`](../../docs/04_SEO_Performance.md) — URL canonique `/projets/elan/`
- [`TODO.md`](../../TODO.md), [`PROJECT_STATUS.md`](../../PROJECT_STATUS.md), [`brainstorming/TODO.md`](../TODO.md)
