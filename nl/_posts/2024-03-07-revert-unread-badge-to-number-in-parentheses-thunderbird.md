---
permalink: /blog/revert-unread-badge-to-number-in-parentheses-thunderbird
layout: blog-post
title: De "badge" voor ongelezen berichten terugzetten naar een getal tussen haakjes in Thunderbird
tags: [ "tech"]
---

<p class="font-gray font-xs text-right">Laatst bijgewerkt: 19 augustus 2026</p>

Thunderbird 115 (Supernova) verving de vertrouwde teller voor ongelezen berichten in het mappenpaneel door een gekleurde badge. Als u de oude weergave **Postvak IN (3)** liever had, leest u hier hoe u die terugkrijgt — tegenwoordig met een add-on en één klik in plaats van handmatig bewerkte CSS.

<p class="text-center">
    <img src="/assets/images/blog/thunderbird-unread-fix.png">
    <span class="font-xs">Voor en na de aanpassing</span>
</p>

<!--more-->

### De add-on Classic Folder Counts installeren

De oplossing is nu een kleine Thunderbird-add-on, dus u hoeft niets handmatig te bewerken:

1. Download het `.xpi`-bestand van de [releasepagina](https://github.com/crystalidea/thunderbird-classic-folder-counts/releases/latest).
2. Open in Thunderbird **Add-ons en thema’s**, klik op het tandwielpictogram, kies **Add-on installeren via bestand…** en selecteer het gedownloade bestand.

De tellers veranderen meteen — herstarten is niet nodig. Ook een wijziging in `about:config` is niet nodig: Thunderbird installeert de add-on zoals hij is. De add-on werkt in elke versie vanaf 115 (Supernova).

### Wat u kunt instellen

De opties van de add-on bevatten twee selectievakjes:

- **aantal ongelezen berichten tussen haakjes** in plaats van de badge;
- **totaal aantal berichten als gewone rechts uitgelijnde tekst** — alleen zichtbaar als u in het menu van het mappenpaneel het totaal aantal berichten hebt ingeschakeld.

Beide worden direct toegepast, en met één klik in de Add-onbeheerder schakelt u alles weer uit.

De broncode staat op [GitHub](https://github.com/crystalidea/thunderbird-classic-folder-counts). Er zit geen magie in: het is hetzelfde stijlblad als hieronder, geregistreerd op dezelfde manier waarop Thunderbird `userChrome.css` registreert, en het wordt weer verwijderd zodra u de add-on uitschakelt.

### Waarom een add-on in plaats van userChrome.css

- geen instelling **toolkit.legacyUserProfileCustomizations.stylesheets** en geen gezoek naar de profielmap;
- wijzigingen worden toegepast zonder Thunderbird te herstarten;
- uitschakelen kost één klik in plaats van het bewerken van een bestand;
- de add-on houdt gelijke tred met Thunderbird, terwijl een met de hand gekopieerd fragment stilletjes veroudert — de CSS hieronder is al twee keer achterhaald geraakt, zie de opmerking aan het einde.

### De oude userChrome.css-methode

**Verouderd, maar het werkt nog steeds.** Gebruik deze methode als u liever niets installeert.

**1. Schakel ondersteuning voor userChrome.css in Thunderbird in.** Standaard is het gebruik van userChrome.css uitgeschakeld in Thunderbird. Om het in te schakelen zet u **toolkit.legacyUserProfileCustomizations.stylesheets** op true in de [Configuratie-editor](https://support.mozilla.org/nl/kb/config-editor).

**2. Zet deze CSS-code in chrome/userChrome.css in uw profielmap:**

```CSS

/* This code reverts Mozilla Thunderbird unread badges to numbers in parentheses like it was before SuperNova 115 */

.name {
  flex: inherit !important;
  margin-right: 4px !important;
}

.folder-count-badge.unread-count {
  color: inherit !important;
  font-size: inherit !important;
  padding: 0 !important;
  min-width: 0 !important;
}

.folder-count-badge.unread-count:before {
    content: '(';
}

.folder-count-badge.unread-count:after {
    content: ')';
}

.unread > .container > .unread-count
{
  background-color: inherit !important;
}

/* total */

.folder-count-badge.total-count {
  flex: 1;
  text-align: right !important;
  background-color: inherit !important;
  padding: 0 !important;
  margin-inline-end: 0 !important;
}

```

**3. Herstart Thunderbird.**

Twee details van dit fragment zijn in Thunderbird 148 en nieuwer achterhaald geraakt; beide zijn het waard om aan de regel `.folder-count-badge.unread-count` toe te voegen:

- `min-width` is in de eigen badge-regels van Thunderbird `min-inline-size` geworden, waardoor `min-width: 0` de teller niet langer verkleint — voeg `min-inline-size: 0 !important;` toe
- een ingeklapte map met ongelezen berichten in submappen houdt een dunne ovale omlijning rond het getal, omdat niets de rand terugzet — voeg `border: none !important;` toe

De add-on lost beide al op.
