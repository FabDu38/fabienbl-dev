# Migration Astro — inventaire et recette

> **Jalon 1 MVP2 — ✅ terminé** (recette prod validée, tag **`V1.5.2`**, sept. 2026).  
> Décisions : [`brainstorming/sessions/Architecture_SEO.md`](../brainstorming/sessions/Architecture_SEO.md).  
> Suite MVP2 : séance [**Parcours et structure**](../brainstorming/sessions/Parcours_et_structure.md) ✅ (29/09/2026). Prochaine séance : direction visuelle.

## Correspondance des URL


| Ancienne URL (prod)                                  | Nouvelle URL canonique         | Statut                |
| ---------------------------------------------------- | ------------------------------ | --------------------- |
| `/` (Flutter SPA)                                    | `/`                            | Remplacée par Astro   |
| `/seo/developpeur-web-freelance.html`                | `/`                            | **301**               |
| `/seo/a-propos.html`                                 | `/a-propos/`                   | **301**               |
| `/seo/projets.html`                                  | `/projets/`                    | **301**               |
| `/seo/contact.html`                                  | `/contact/`                    | **301**               |
| `/seo/mentions-legales.html`                         | `/mentions-legales/`           | **301**               |
| `/projets` (Flutter)                                 | `/projets/`                    | **301** si sans slash |
| `/projets/portfolio` et `/projets/portfolio/`        | `/projets/`                    | **301** (parcours 29/09) |
| `/projets/professionnels`                            | `/projets/professionnels/`     | Conservée             |
| `/a-propos`, `/contact`, `/mentions-legales`, `/cgu` | Même chemin + **barre finale** | **301**               |


**URL cibles (séance 28/09, ajustées le 29/09)** : `/services/`, `/projets/`, `/projets/professionnels/`, `/cgu/`, landing freelance → `/`. `/projets/portfolio/` n'est plus canonique (**301** vers `/projets/`).

## Inventaire routes Flutter (`lib/core/router.dart`)


| Route                     | Page Dart                                                           | Contenu principal                                      | Médias                             | Animations                                         |
| ------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------ | ---------------------------------- | -------------------------------------------------- |
| `/`                       | `home_page.dart` + widgets hero, piliers, services, expérience, CTA | Promesse, 3 piliers, services, expérience, CTA contact | Placeholders images                | `flutter_animate`, `visibility_detector` au scroll |
| `/projets`                | `projects_page.dart`                                                | 3 cartes projets + liens                               | —                                  | Fade/slide sur cartes                              |
| `/projets/portfolio`      | `portfolio_case_study_page.dart`                                    | Étude de cas portfolio                                 | —                                  | Idem                                               |
| `/projets/professionnels` | `professional_projects_page.dart`                                   | Contexte projets entreprise                            | —                                  | Idem                                               |
| `/a-propos`               | `about_page.dart`                                                   | Bio, vision, compétences                               | —                                  | Sections animées                                   |
| `/contact`                | `contact_page.dart`                                                 | Formulaire + email + LinkedIn                          | `assets/icons/linkedin_174857.png` | —                                                  |
| `/mentions-legales`       | `mentions_legales_page.dart`                                        | Texte légal                                            | —                                  | —                                                  |
| `/cgu`                    | `cgu_page.dart`                                                     | CGU                                                    | —                                  | —                                                  |


**Shell global** : `app_shell.dart` — header 64px, nav desktop / drawer mobile, footer (copyright, lien SEO à **supprimer**), `contentMaxWidth` 840px.

**Thème** : Material 3 (`theme.dart`) — clair + sombre via `prefers-color-scheme` (équivalent Flutter `ThemeMode.system`), police Inter.

## Inventaire `/seo` (source contenu + JSON-LD)


| Fichier                          | Rôle                                        | Migration                           |
| -------------------------------- | ------------------------------------------- | ----------------------------------- |
| `developpeur-web-freelance.html` | Landing SEO riche (sections services, FAQ…) | Fusion contenu utile dans `/` Astro |
| `a-propos.html`                  | Bio indexable                               | `/a-propos/`                        |
| `projets.html`                   | Liste projets                               | `/projets/`                         |
| `contact.html`                   | Contact                                     | `/contact/`                         |
| `mentions-legales.html`          | Légal                                       | `/mentions-legales/`                |
| `sitemap.xml`                    | 5 URL `/seo/*.html`                         | Remplacé par sitemap Astro racine   |
| `robots.txt`                     | Allow `/seo`                                | `Allow: /` à la racine              |




## Formulaire contact

- **Service** : EmailJS REST `https://api.emailjs.com/api/v1.0/email/send`
- **IDs** : `service_3ehoqgp`, `template_n0s20gd`, clé publique `9K8EyS_guLUXp0WnX`
- **Champs** : nom, email, message (+ validation côté client, messages d’erreur comme Flutter)
- **Domaines EmailJS** : `fabien-blasquez.dev`, préversion Netlify, `localhost`



## Recette préversion (étape 7)



### URL et redirections

- [x] Toutes les pages cibles générées en build (`npm run build` — 10 routes + 404)
- [x] Règles 301 définies dans `site/public/_redirects` (sans `301!` sur les barres finales — évite les boucles Netlify)
- [x] Liens internes sans `.html` ni `/seo/`
- [x] Page 404 (`src/pages/404.astro`)



### Fonctionnel

- [x] Menu desktop + drawer mobile
- [x] Formulaire contact EmailJS (client JS)
- [x] Liens mailto et LinkedIn



### SEO / technique

- [x] `lang=fr`, title + description par page (layout `Seo.astro`)
- [x] Canonical + OG + Twitter
- [x] JSON-LD Person + WebSite sur l’accueil
- [x] `robots.txt` + `@astrojs/sitemap`
- [x] Préversion CI : `X-Robots-Tag: noindex` sur deploy preview



### Accessibilité (étape 6)

- [x] Zoom autorisé (viewport standard)
- [x] H1 + landmarks `header` / `main` / `footer`
- [x] Skip link, `:focus-visible`, labels formulaire
- [x] Footer dans le flux document



### Performance

- [x] Lighthouse SEO ≥ 90 (mobile) — à mesurer sur URL de préversion prod
- [x] Contenu principal en HTML statique (formulaire seul nécessite JS)



### Bascule prod (étape 8)

- [x] Tag release `V*` → deploy `site/dist` via Astro CI (`netlify deploy --prod`)
- [x] Flutter retiré du dépôt (jalon 1)
- [x] Search Console : nouveau sitemap, surveillance couverture 2–4 semaines



### Actions manuelles — prod ou préversion

À refaire après chaque tag prod important (ou sur `https://fabien-blasquez.dev` une fois le tag déployé). Préversion : URL du deploy **astro-preview** (Actions → Astro CI sur `main`), avec noindex — OK pour Lighthouse, pas pour GSC.

#### Redirections 301

Objectif : **une** redirection 301 vers l’URL finale, **pas** de boucle (`ERR_TOO_MANY_REDIRECTS`).

**Navigateur** : barre d’adresse en navigation privée, ou extension type « Redirect Path ».

**Ligne de commande (PowerShell)** — lire la première ligne `HTTP` et l’en-tête `Location` :

```powershell
curl.exe -sI "https://fabien-blasquez.dev/seo/a-propos.html"
curl.exe -sI "https://fabien-blasquez.dev/projets"
curl.exe -sI "https://fabien-blasquez.dev/projets/"
```

**Attendu (exemples)** :


| URL testée                            | Code    | `Location` (ou URL finale)                      |
| ------------------------------------- | ------- | ----------------------------------------------- |
| `/seo/developpeur-web-freelance.html` | 301     | `https://fabien-blasquez.dev/`                  |
| `/seo/a-propos.html`                  | 301     | `https://fabien-blasquez.dev/a-propos/`         |
| `/seo/projets.html`                   | 301     | `https://fabien-blasquez.dev/projets/`          |
| `/seo/contact.html`                   | 301     | `https://fabien-blasquez.dev/contact/`          |
| `/seo/mentions-legales.html`          | 301     | `https://fabien-blasquez.dev/mentions-legales/` |
| `/seo/sitemap.xml`                    | 301     | `https://fabien-blasquez.dev/sitemap-index.xml` |
| `/projets` (sans slash)               | 301     | `https://fabien-blasquez.dev/projets/`          |
| `/projets/`                           | **200** | (pas de 301 vers la même URL)                   |


Liste complète : `[site/public/_redirects](../site/public/_redirects)`.

- [x] Legacy `/seo/*.html` → bonnes destinations
- [x] Chemins sans barre finale → version avec `/`
- [x] Pages canoniques (`/projets/`, `/contact/`, …) en **200**



#### Lighthouse

1. Chrome → ouvrir l’URL (prod ou préversion).
2. **F12** → onglet **Lighthouse** (parfois sous le menu `»`).
3. Mode **Navigation**, appareil **Mobile** (ou Desktop si tu veux comparer).
4. Cocher au minimum **Performance** et **SEO** (Accessibilité optionnel).
5. **Analyser** (page chargée, pas d’onglet en arrière-plan).

- [x] **SEO** ≥ **90** (mobile) — noter le score et la page si < 90
- [x] (Optionnel) noter Performance / Accessibilité pour suivi MVP2



#### Thème clair / sombre (`prefers-color-scheme`)

Le site suit le **thème système** (pas de bouton dans l’UI). Équivalent Flutter `ThemeMode.system`.

**Windows** : *Paramètres → Personnalisation → Couleurs → Mode* (clair, puis sombre).

**Chrome (sans changer Windows)** : F12 → **Commande** (`Ctrl+Shift+P`) → « Show Rendering » → *Emulate CSS media feature prefers-color-scheme* → `light` puis `dark`.

À chaque bascule : **rafraîchir** la page (F5).

Pages à parcourir rapidement :

- [x] **Accueil** — hero, cartes, CTA
- [x] `/projets/` et une sous-page (ex. `/projets/professionnels/`)
- [x] `/contact/` — formulaire, champs, bouton envoyer
- [x] **Header / menu mobile** — lisible, lien actif visible

Critères : texte lisible, bordures visibles, pas de fond « cassé » ; accents ~`#006a62` (clair) / `#82d5ca` (sombre).

## Note MCP (étape 2)

Étude détaillée (intérêt, limites, serveurs pertinents, décision d’installation) : `[09_MCP_et_outils_agent.md](09_MCP_et_outils_agent.md)`.

**Synthèse :** MCP = outils optionnels côté Cursor (ex. navigateur pour la recette préversion). **Pas d’installation requise** pour livrer le jalon 1 ; build et deploy restent Node + GitHub Actions + Netlify.