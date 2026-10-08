# Séance — Mesure, surveillance et données

> **Statut :** Décisions prises le 6 octobre 2026. Umami et Better Stack configurés le 8 octobre 2026.
> **Source :** dossier `exports/mesure-et-realisations-bernard.zip`.

## Décisions

- **Audience.** Umami Cloud Hobby, gratuit. Search Console reste l’outil de référencement. Mesures prévues : visites, visiteurs estimés, pages vues, provenance, envois réussis du formulaire (`contact_envoye`, seulement après succès EmailJS, sans nom, email ni message).
- **Compte Umami.** Créé le 8 octobre 2026 (blasquez.f@gmail.com). L’identifiant est dans `PUBLIC_UMAMI_WEBSITE_ID`. Le script ne part qu’après accord, et seulement sur fabien-blasquez.dev. Pas de collecte sur localhost ni sur les prévisualisations. La production actuelle (`V1.6.0`) ne contient pas encore ce script : il partira au prochain tag.
- **Consentement.** Script seulement après « Accepter ». « Refuser » laisse le site et le formulaire utilisables. Le choix se modifie depuis le footer. Durée de mémorisation retenue dans le code : 6 mois. Ce n’est pas une durée déjà vérifiée au regard des recommandations.
- **Surveillance.** Better Stack gratuit, configuré le 8 octobre 2026 : accueil et Contact, contrôle « URL becomes unavailable », toutes les 3 minutes, alerte de panne et de rétablissement vers blasquez.f@gmail.com. Aucun script dans les pages. Le formulaire se teste pour de vrai après chaque mise en production.
- **Erreurs JavaScript.** Suivi automatique reporté.
- **Formulaire.** Nom, email, message. Répondre et suivre un éventuel projet. Pas de newsletter. Demandes sans suite : 12 mois après le dernier échange, examen mensuel. Pas de case pour envoyer. La base juridique dépend du traitement.
- **Pages.** Mentions légales et politique de confidentialité. Les CGU vides sont retirées ; `/cgu/` redirige vers `/mentions-legales/`.
- **Réalisations.** Page `/projets/professionnels/` réécrite en paragraphes, titre « Réalisations professionnelles ». La carte « Projets professionnels » ne change pas. Pas de dates affichées. « Huit ans » est repris et reste à vérifier.

## Actions non faites

- Vérifier le téléphone avant de le publier. Il n’est pas sur les mentions.
- Confirmer la durée de 6 mois du choix de consentement.
- Vérifier le compte EmailJS : la page confidentialité cite seulement la politique publique (30 jours, serveurs aux États-Unis, consultée le 6 octobre 2026).
- Préciser les durées des dossiers clients et des journaux Netlify.
- Tester le formulaire : fait le 8 octobre 2026, message de test supprimé. La mesure a été confirmée en production (`V1.7.1`).

## Suivi documentaire

- [`docs/01_Principes.md`](../../docs/01_Principes.md), [`docs/02_Contenu.md`](../../docs/02_Contenu.md), [`docs/04_SEO_Performance.md`](../../docs/04_SEO_Performance.md)
- [`TODO.md`](../../TODO.md), [`PROJECT_STATUS.md`](../../PROJECT_STATUS.md)
