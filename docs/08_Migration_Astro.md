# Migration Astro — inventaire et recette

> Jalon 1 MVP2. Décisions : [`brainstorming/sessions/Architecture_SEO.md`](../brainstorming/sessions/Architecture_SEO.md).

## Correspondance des URL

| Ancienne URL (prod) | Nouvelle URL canonique | Statut |
|---------------------|------------------------|--------|
| `/` (Flutter SPA) | `/` | Remplacée par Astro |
| `/seo/developpeur-web-freelance.html` | `/` | **301** |
| `/seo/a-propos.html` | `/a-propos/` | **301** |
| `/seo/projets.html` | `/projets/` | **301** |
| `/seo/contact.html` | `/contact/` | **301** |
| `/seo/mentions-legales.html` | `/mentions-legales/` | **301** |
| `/projets` (Flutter) | `/projets/` | **301** si sans slash |
| `/projets/portfolio` | `/projets/portfolio/` | Conservée |
| `/projets/professionnels` | `/projets/professionnels/` | Conservée |
| `/a-propos`, `/contact`, `/mentions-legales`, `/cgu` | Même chemin + **barre finale** | **301** |

**URL cibles validées (proposition séance 28/09)** : `/projets/portfolio/`, `/projets/professionnels/`, `/cgu/`, landing freelance → `/`.

## Inventaire routes Flutter (`lib/core/router.dart`)

| Route | Page Dart | Contenu principal | Médias | Animations |
|-------|-----------|-------------------|--------|------------|
| `/` | `home_page.dart` + widgets hero, piliers, services, expérience, CTA | Promesse, 3 piliers, services, expérience, CTA contact | Placeholders images | `flutter_animate`, `visibility_detector` au scroll |
| `/projets` | `projects_page.dart` | 3 cartes projets + liens | — | Fade/slide sur cartes |
| `/projets/portfolio` | `portfolio_case_study_page.dart` | Étude de cas portfolio | — | Idem |
| `/projets/professionnels` | `professional_projects_page.dart` | Contexte projets entreprise | — | Idem |
| `/a-propos` | `about_page.dart` | Bio, vision, compétences | — | Sections animées |
| `/contact` | `contact_page.dart` | Formulaire + email + LinkedIn | `assets/icons/linkedin_174857.png` | — |
| `/mentions-legales` | `mentions_legales_page.dart` | Texte légal | — | — |
| `/cgu` | `cgu_page.dart` | CGU | — | — |

**Shell global** : `app_shell.dart` — header 64px, nav desktop / drawer mobile, footer (copyright, lien SEO à **supprimer**), `contentMaxWidth` 840px.

**Thème** : Material 3 (`theme.dart`) — clair + sombre via **`prefers-color-scheme`** (équivalent Flutter `ThemeMode.system`), police Inter.

## Inventaire `/seo` (source contenu + JSON-LD)

| Fichier | Rôle | Migration |
|---------|------|-----------|
| `developpeur-web-freelance.html` | Landing SEO riche (sections services, FAQ…) | Fusion contenu utile dans `/` Astro |
| `a-propos.html` | Bio indexable | `/a-propos/` |
| `projets.html` | Liste projets | `/projets/` |
| `contact.html` | Contact | `/contact/` |
| `mentions-legales.html` | Légal | `/mentions-legales/` |
| `sitemap.xml` | 5 URL `/seo/*.html` | Remplacé par sitemap Astro racine |
| `robots.txt` | Allow `/seo` | `Allow: /` à la racine |

## Formulaire contact

- **Service** : EmailJS REST `https://api.emailjs.com/api/v1.0/email/send`
- **IDs** : `service_3ehoqgp`, `template_n0s20gd`, clé publique `9K8EyS_guLUXp0WnX`
- **Champs** : nom, email, message (+ validation côté client, messages d’erreur comme Flutter)
- **Domaines EmailJS** : `fabien-blasquez.dev`, préversion Netlify, `localhost`

## Recette préversion (étape 7)

### URL et redirections

- [x] Toutes les pages cibles générées en build (`npm run build` — 10 routes + 404)
- [x] Règles 301 définies dans `site/public/_redirects`
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

- [ ] Lighthouse SEO ≥ 90 (mobile) — à mesurer sur URL de préversion prod
- [x] Contenu principal en HTML statique (formulaire seul nécessite JS)

### Bascule prod (étape 8 — action manuelle GSC)

- [ ] Tag release (ex. `V1.5.0`) → deploy `site/dist`
- [ ] Vérifier 301 en prod
- [ ] Search Console : nouveau sitemap, surveillance couverture 2–4 semaines
- [ ] PR suppression Flutter (`lib/`, `web/`, `pubspec.yaml`, `seo/`, `scripts/copy-seo.js`, job Flutter CI)

## Note MCP (étape 2)

Étude détaillée (intérêt, limites, serveurs pertinents, décision d’installation) : **[`09_MCP_et_outils_agent.md`](09_MCP_et_outils_agent.md)**.

**Synthèse :** MCP = outils optionnels côté Cursor (ex. navigateur pour la recette préversion). **Pas d’installation requise** pour livrer le jalon 1 ; build et deploy restent Node + GitHub Actions + Netlify.
