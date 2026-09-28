# Checklist — tâches qui t’incombent (jalon 1 Astro + suite proche)

> Ce que l’agent / la CI ne peut pas faire à ta place : décisions, relecture, secrets, tags prod, Search Console, tests réels sur tes URLs.  
> Références : [`08_Migration_Astro.md`](08_Migration_Astro.md), [`BASCULE_ASTRO.md`](BASCULE_ASTRO.md), [`TODO.md`](../TODO.md).  
> **MCP navigateur :** non requis ([`09_MCP_et_outils_agent.md`](09_MCP_et_outils_agent.md)).

---

## Phase A — Intégrer le travail dans Git

- [ ] Relire le diff (docs + dossier `site/` + suppression Flutter + `netlify.toml` + `astro-ci.yml`).
- [ ] Vérifier que les changements sont sur une branche `feature/…` depuis `main` (convention MVP2).
- [ ] Ouvrir une **PR** vers `main`, attendre que **Astro CI** soit verte.
- [ ] **Merger** la PR (prod ne bouge pas tant qu’aucun tag `V*` n’est poussé).
- [ ] *(Optionnel)* Supprimer le dépôt Git imbriqué `site/.git` s’il existe encore, pour éviter la confusion.

---

## Phase B — Validation locale (avant de faire confiance à la préversion)

Dans un terminal :

```bash
cd site
npm ci
npm run dev
```

Ouvre `http://localhost:4321` et coche :

### Contenu & parcours

- [ ] **Accueil** : promesse, piliers, services, expérience, CTA vers contact — texte OK pour toi ?
- [ ] **Menu** desktop : liens Accueil / Projets / À propos / Contact, état « page active » cohérent.
- [ ] **Menu mobile** : ouverture/fermeture, navigation, pas de lien « Version SEO » dans le footer.
- [ ] **`/projets/`** : les 3 cartes + liens vers portfolio / professionnels.
- [ ] **`/projets/portfolio/`** et **`/projets/professionnels/`** : contenu suffisant ou à enrichir plus tard (noter les écarts).
- [ ] **`/a-propos/`** : bio / parcours / mots-clés alignés avec ton discours actuel.
- [ ] **`/services/`** : placeholder accepté en attendant la séance *Parcours et structure*.
- [ ] **`/mentions-legales/`** et **`/cgu/`** : placeholders « à venir » — OK pour une bascule technique ou à bloquer avant prod ?

### Décisions URL (si tu veux changer quelque chose avant la bascule)

Proposition actuelle (déjà implémentée) :

- [ ] Confirmer **`/projets/portfolio/`**, **`/projets/professionnels/`**, **`/cgu/`**.
- [ ] Confirmer **`/seo/developpeur-web-freelance.html` → `/`** (accueil).
- [ ] Si tu modifies une URL : le dire explicitement dans la PR ou au prochain échange agent (sinon on garde la table dans `08_Migration_Astro.md`).

### Thème clair / sombre (comme Flutter `ThemeMode.system`)

Le site suit **`prefers-color-scheme`** (réglage Windows ou navigateur). Pas de bouton dans le site.

1. **Windows** → Paramètres → Personnalisation → Couleurs → **Mode** clair, puis **Mode** sombre (ou raccourci selon ta config).
2. À chaque bascule, **rafraîchir** `http://localhost:4321` (F5).

- [ ] **Mode clair** : fond clair `#f4fbf8`, texte foncé, boutons vert `#006a62` — lisible et cohérent ?
- [ ] **Mode sombre** : fond `#0e1514`, texte clair, accents `#82d5ca` — proche de fabien-blasquez.dev quand ton OS est en sombre ?
- [ ] **Header / menu / cartes / formulaire** : OK dans les **deux** modes (pas de texte illisible, bordures visibles).
- [ ] Comparer côte à côte avec la **prod Flutter** (même mode système) sur 1–2 pages si tu veux valider la fidélité.

### Fidélité visuelle (point plan étape 3)

- [ ] Typo / espacements « assez proches » de l’ancien Flutter pour toi (dans **clair et sombre**).
- [ ] Noter ce qui doit être repassé en séance **Direction visuelle** (pas bloquant migration si tu acceptes une V1 Astro fidèle mais pas pixel-perfect).

### Accessibilité rapide (5–10 min)

- [ ] **Zoom** navigateur (Ctrl +/-) : pas bloqué.
- [ ] **Tab** : on atteint menu, liens, champs formulaire, bouton envoyer ; focus visible.
- [ ] **Une page = un H1** (aperçu rapide sur 2–3 pages).

### Formulaire contact (local)

- [ ] Envoi test depuis `localhost` (si EmailJS autorise `http://localhost` dans **Domains**).
- [ ] Si échec 403/412 : dashboard EmailJS → domaines + reconnexion Gmail ([`06_Infrastructure.md`](06_Infrastructure.md)).

---

## Phase C — Préversion Netlify (après merge sur `main`)

La CI peut publier un deploy **non prod** (`astro-preview`, **noindex**). Tu dois :

- [ ] Aller dans **GitHub Actions** → dernier run **Astro CI** sur `main` → retrouver l’URL de deploy Netlify (ou Netlify → deploys « branch / alias »).
- [ ] Vérifier l’en-tête ou le comportement **noindex** sur cette URL (pas d’indexation de la preview).
- [ ] Refaire sur cette URL les checks **Phase B** (au minimum : accueil, contact, menu mobile, une 404 volontaire).

### Lighthouse (recette étape 7)

- [ ] Chrome → outils développeur → **Lighthouse** → mobile → catégorie **SEO** ≥ **90** sur la préversion (et noter le score perf si tu veux).
- [ ] Si &lt; 90 : noter la page et la recommandation Lighthouse pour correction ultérieure.

### Sans JavaScript (aperçu)

- [ ] Désactiver JS dans le navigateur (ou « Disable JavaScript ») : accueil et pages texte restent lisibles ; seul le formulaire ne part pas (normal).

---

## Phase D — Feu vert bascule production

**Ne pas taguer tant que tu n’es pas OK** avec préversion + formulaire (en prod EmailJS sur `fabien-blasquez.dev`).

- [ ] Décider du **numéro de tag** (proposition : **`V1.5.0`** = bascule Astro ; **`V2.0.0`** = fin MVP2 plus tard).
- [ ] Vérifier que les secrets GitHub **`NETLIFY_AUTH_TOKEN`** et **`NETLIFY_SITE_ID`** sont toujours présents ([`06_Infrastructure.md`](06_Infrastructure.md)).
- [ ] Créer et pousser le tag (exemple) :

```bash
git checkout main
git pull
git tag V1.5.0
git push origin V1.5.0
```

- [ ] Attendre **Astro CI** verte sur le tag → deploy **prod** Netlify.

---

## Phase E — Contrôles post-bascule (prod)

Sur **https://fabien-blasquez.dev** :

- [ ] Accueil, `/projets/`, `/a-propos/`, `/contact/` en 200.
- [ ] **301** (barre d’adresse ou outil type « redirect checker ») :
  - [ ] `/seo/developpeur-web-freelance.html` → `/`
  - [ ] `/seo/a-propos.html` → `/a-propos/`
  - [ ] `/seo/projets.html` → `/projets/`
  - [ ] `/seo/contact.html` → `/contact/`
  - [ ] `/seo/mentions-legales.html` → `/mentions-legales/`
- [ ] Anciennes routes sans slash (ex. `/contact`) → version avec **`/contact/`**.
- [ ] **Formulaire contact** : envoi réel + réception mail sur ta boîte.
- [ ] **LinkedIn** + **mailto** depuis `/contact/`.
- [ ] Page **404** (URL inventée) : message clair + retour accueil.

---

## Phase F — Google Search Console (manuel)

- [ ] Propriété **fabien-blasquez.dev** déjà vérifiée (DNS Netlify) — sinon refaire la vérif.
- [ ] **Sitemaps** : soumettre **`https://fabien-blasquez.dev/sitemap-index.xml`** (remplace l’ancien `/seo/sitemap.xml`).
- [ ] **Inspection d’URL** : demander l’indexation de `/`, `/a-propos/`, `/projets/`, `/contact/` si tu veux accélérer (pas obligatoire pour toutes).
- [ ] Pendant **2 à 4 semaines** : surveiller **Pages**, **Redirections**, **Erreurs** après migration d’URL ([doc Google migration](https://developers.google.com/search/docs/crawling-indexing/site-move-with-url-changes)).

---

## Phase G — EmailJS & confiance

- [ ] Dashboard EmailJS → **Domains** : `https://fabien-blasquez.dev` (+ preview si tu testes souvent une URL Netlify dédiée).
- [ ] Après bascule : un envoi test prod documenté (date / OK ou incident).

---

## Phase H — Après le jalon 1 (MVP2, pas que toi seul)

À planifier via [`brainstorming/TODO.md`](../brainstorming/TODO.md) — **tes** rôles typiques :

| Séance / thème | Ton rôle |
|----------------|----------|
| **Parcours et structure** | Trancher arborescence, page services, premier écran |
| **Direction visuelle** | Valider maquettes / ajustements CSS |
| **Messages et projets** | Rédiger ou valider textes, cas clients |
| **Cas Projet Élan** | Contenu et niveau de détail du cas |
| **Mesure, surveillance, données** | Choix analytics, bannière cookies, mentions légales réelles |
| **Revue préversion MVP2** | Go / no-go avant tag **`V2.0.0`** |
| **Backlog légal** (`TODO.md`) | Mentions légales, CGU, texte données formulaire définitif |

---

## Récap « minimum avant tag V1.5.0 »

1. PR mergée + préversion testée.  
2. Formulaire OK (preview ou prod selon étape).  
3. Tu valides contenu « assez bon » pour une prod publique.  
4. Tag poussé → checks Phase E + Phase F.

---

*Dernière mise à jour : alignée sur le jalon 1 migration Astro. Coche dans ce fichier ou dans ton outil habituel.*
