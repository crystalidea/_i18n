---
permalink: /blog/revert-unread-badge-to-number-in-parentheses-thunderbird
layout: blog-post
title: Rétablir le compteur de messages non lus entre parenthèses à la place du « badge » dans Thunderbird
tags: [ "tech"]
---

<p class="font-gray font-xs text-right">Dernière mise à jour : 19 août 2026</p>

Thunderbird 115 (Supernova) a remplacé le compteur habituel de messages non lus du panneau des dossiers par un badge coloré. Si vous préfériez l'ancien affichage **Courrier entrant (3)**, voici comment le retrouver — désormais grâce à un module complémentaire en un clic plutôt qu'avec du CSS modifié à la main.

<p class="text-center">
    <img src="/assets/images/blog/thunderbird-unread-fix.png">
    <span class="font-xs">Avant et après la correction</span>
</p>

<!--more-->

### Installer le module complémentaire Classic Folder Counts

La correction prend désormais la forme d'un petit module complémentaire pour Thunderbird, il n'y a donc rien à modifier à la main :

1. Téléchargez le fichier `.xpi` depuis la [page des versions](https://github.com/crystalidea/thunderbird-classic-folder-counts/releases/latest).
2. Dans Thunderbird, ouvrez **Modules complémentaires et thèmes**, cliquez sur l'icône en forme d'engrenage, choisissez **Installer un module depuis un fichier…** et sélectionnez le fichier téléchargé.

Les compteurs changent immédiatement — sans redémarrage. Aucune modification dans `about:config` n'est nécessaire non plus : Thunderbird installe le module tel quel. Cela fonctionne dans toutes les versions à partir de la 115 (Supernova).

### Ce que vous pouvez configurer

Les options du module comportent deux cases à cocher :

- **nombre de messages non lus entre parenthèses** à la place du badge ;
- **nombre total de messages sous forme de texte simple aligné à droite** — visible uniquement si vous avez activé l'affichage du nombre total dans le menu du panneau des dossiers.

Les deux s'appliquent instantanément, et un seul clic dans le Gestionnaire de modules complémentaires suffit à tout désactiver.

Le code source est disponible sur [GitHub](https://github.com/crystalidea/thunderbird-classic-folder-counts). Il n'y a rien de magique : il s'agit de la même feuille de style que celle ci-dessous, enregistrée de la même manière que Thunderbird enregistre `userChrome.css`, et retirée dès que vous désactivez le module.

### Pourquoi un module complémentaire plutôt que userChrome.css

- pas de paramètre **toolkit.legacyUserProfileCustomizations.stylesheets** à activer ni de dossier de profil à chercher ;
- les modifications s'appliquent sans redémarrer Thunderbird ;
- la désactivation se fait en un clic plutôt qu'en modifiant un fichier ;
- il suit les évolutions de Thunderbird, alors qu'un extrait copié à la main se périme discrètement — le CSS ci-dessous a déjà dérivé à deux reprises, voir la note à la fin.

### L'ancienne méthode userChrome.css

**Obsolète, mais elle fonctionne toujours.** À utiliser si vous préférez ne rien installer.

**1. Activez la prise en charge de userChrome.css dans Thunderbird.** Par défaut, l'utilisation de userChrome.css est désactivée dans Thunderbird. Pour l'activer, vous devez définir **toolkit.legacyUserProfileCustomizations.stylesheets** sur true dans l'[Éditeur de configuration](https://support.mozilla.org/fr/kb/config-editor).

**2. Placez ce code CSS dans chrome/userChrome.css, dans votre dossier de profil :**

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

**3. Redémarrez Thunderbird.**

Deux détails de cet extrait ont dérivé dans Thunderbird 148 et versions ultérieures, et il vaut la peine de les ajouter tous les deux à la règle `.folder-count-badge.unread-count` :

- `min-width` est devenu `min-inline-size` dans les règles de badge propres à Thunderbird : `min-width: 0` ne réduit donc plus le compteur — ajoutez `min-inline-size: 0 !important;`
- un dossier réduit dont les sous-dossiers contiennent des messages non lus conserve un fin contour ovale autour du nombre, car rien ne réinitialise la bordure — ajoutez `border: none !important;`

Le module gère déjà les deux cas.
