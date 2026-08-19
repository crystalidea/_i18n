---
permalink: /blog/revert-unread-badge-to-number-in-parentheses-thunderbird
layout: blog-post
title: Den „Badge“ für ungelesene Nachrichten in Thunderbird wieder als Zahl in Klammern anzeigen
tags: [ "tech"]
---

<p class="font-gray font-xs text-right">Letzte Aktualisierung: 19. August 2026</p>

Thunderbird 115 (Supernova) hat den gewohnten Zähler für ungelesene Nachrichten im Ordnerbereich durch einen farbigen Badge ersetzt. Wenn Ihnen die alte Darstellung **Posteingang (3)** besser gefällt, lässt sie sich zurückholen – heute mit einem Add-on und einem Klick statt mit handgeschriebenem CSS.

<p class="text-center">
    <img src="/assets/images/blog/thunderbird-unread-fix.png">
    <span class="font-xs">Vor und nach der Anpassung</span>
</p>

<!--more-->

### Das Add-on Classic Folder Counts installieren

Die Lösung gibt es inzwischen als kleines Thunderbird-Add-on, sodass nichts von Hand bearbeitet werden muss:

1. Laden Sie die `.xpi`-Datei von der [Release-Seite](https://github.com/crystalidea/thunderbird-classic-folder-counts/releases/latest) herunter.
2. Öffnen Sie in Thunderbird **Add-ons und Themes**, klicken Sie auf das Zahnradsymbol, wählen Sie **Add-on aus Datei installieren…** und anschließend die heruntergeladene Datei aus.

Die Zähler ändern sich sofort – ohne Neustart. Auch eine Änderung in `about:config` ist nicht nötig: Thunderbird installiert das Add-on so, wie es ist. Es funktioniert in allen Versionen ab 115 (Supernova).

### Was sich einstellen lässt

Die Optionen des Add-ons bestehen aus zwei Kontrollkästchen:

- **Anzahl ungelesener Nachrichten in Klammern** statt als Badge;
- **Gesamtanzahl der Nachrichten als schlichter, rechtsbündiger Text** – nur sichtbar, wenn Sie im Menü des Ordnerbereichs die Anzeige der Gesamtanzahl aktiviert haben.

Beides wirkt sofort, und ein Klick in der Add-ons-Verwaltung schaltet alles wieder ab.

Der Quellcode liegt auf [GitHub](https://github.com/crystalidea/thunderbird-classic-folder-counts). Dahinter steckt keine Magie: Es ist dasselbe Stylesheet wie unten, so registriert, wie Thunderbird auch `userChrome.css` registriert, und beim Deaktivieren des Add-ons wird es wieder entfernt.

### Warum ein Add-on statt userChrome.css

- kein Schalter **toolkit.legacyUserProfileCustomizations.stylesheets** und keine Suche nach dem Profilordner;
- Änderungen werden ohne Neustart von Thunderbird wirksam;
- zum Abschalten genügt ein Klick, statt eine Datei zu bearbeiten;
- es hält mit Thunderbird Schritt, während ein von Hand kopierter Schnipsel still und leise veraltet – beim CSS unten ist das bereits zweimal passiert, siehe den Hinweis am Ende.

### Die alte Methode mit userChrome.css

**Veraltet, funktioniert aber weiterhin.** Nutzen Sie sie, wenn Sie lieber nichts installieren möchten.

**1. Aktivieren Sie die Unterstützung für userChrome.css in Thunderbird.** Standardmäßig ist die Verwendung von userChrome.css in Thunderbird deaktiviert. Zum Aktivieren müssen Sie **toolkit.legacyUserProfileCustomizations.stylesheets** im [Konfigurationseditor](https://support.mozilla.org/de/kb/config-editor) auf true setzen.

**2. Speichern Sie diesen CSS-Code in Ihrem Profilordner unter chrome/userChrome.css:**

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

**3. Starten Sie Thunderbird neu.**

Zwei Details dieses Schnipsels sind in Thunderbird 148 und neuer überholt, und beide sollten der Regel `.folder-count-badge.unread-count` hinzugefügt werden:

- aus `min-width` wurde in Thunderbirds eigenen Badge-Regeln `min-inline-size`, sodass `min-width: 0` den Zähler nicht mehr verkleinert – ergänzen Sie `min-inline-size: 0 !important;`
- bei einem eingeklappten Ordner, dessen Unterordner ungelesene Nachrichten enthalten, bleibt ein dünner ovaler Rahmen um die Zahl stehen, weil nichts den Rahmen zurücksetzt – ergänzen Sie `border: none !important;`

Das Add-on erledigt beides bereits.
