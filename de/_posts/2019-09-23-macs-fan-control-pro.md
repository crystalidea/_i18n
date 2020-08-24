---
permalink: /blog/macs-fan-control-pro
layout: blog-post
title: Macs Fan Control 1.5, Vorstellung der Pro Version
image: /assets/images/blog/mfc_update_15.png
tags: [ "macs-fan-control"]
---

Unser extrem beliebte [Macs Fan Control](/macs-fan-control) App wird jetzt noch besser: Es gibt jetzt eine Pro Version mit Voreinstellungen für erfahrene Benutzer, bedeutende UI Verbesserungen und mehr Stabilität.

<!--more-->

<h2>Voreinstellungen und Pro Version</h2>

Die App bleibt nach wie vor kostenlos, aber erfahrene Nutzer können nun zusätzliche Funktionen erhalten, indem Sie ein auf Upgrade auf die Pro Version durchführen. Mit der Pro Version kann man jetzt benutzerdefinierte Lüftervoreinstellungen erstellen und abspeichern - damit lässt sich je nach Aktivität schnell zwischen verschiedenen Einstellungen umschalten. Außerdem erhalten Sie Priorität im Kunden-Support und Vertrauen in zukünftige Updates und Verbesserungen.

<p class="text-center">
    <img src="/assets/images/blog/mfc_update_15_presets.png" class="product-screenshot" data-rjs="2">
</p>

Die kostenlose Version hat nur 3 Voreinstellungen:

- **Automatisch**, alle Lüfter sind auf Automatisch gesetzt und werden vom System gesteuert
- **Volle Leistung**, alle Lüfter laufen mit maximaler Leistung (UPM)
- **Benutzerdefiniert***, wenn Sie die Lüftersteuerung selbst anpassen. Diese Voreinstellungen wird zwischen dem Starten der App gespeichert (wenn Sie die App schließen während die Voreinstellung aktiv ist) und geht verloren, wenn Sie zurück auf **Automatisch** oder **Volle Leistung** wechseln. Im Prinzip verhält die Appn sich gleich, wie bei vorherigen Versionen der App.

<p class="text-center">
    <img src="/assets/images/blog/mfc_update_15_presets_free.png" class="product-screenshot" data-rjs="2">
</p>

<h2>NVMe Treiber-Support</h2>

Bereits seit einiger Zeit sind alle modernen Macs mit NVMe Blade anstelle der traditionellen SATA Laufwerken ausgestattet. Sowohl unter Windows als auch unter MacOS zeigt die App jetzt diese Laufwerke und ihre Temperaturen an. Eine neue Option in den Einstellungen ermöglicht es Ihnen auszusuchen, ob Sie lieber die Laufwerktemperaturen (SMART und/oder NVMe) auslesen wollen oder nicht. Dies kann für Nutzer, die Ihre CPU-Auslastung optimieren wollen, oder Nutzer, die Probleme mit verbundenen RAID und Audio-Peripheriegeräten haben, nützlich sein.

<h2>Neues Helper-Tool</h2>

Für die Lüftersteuerung mit Macs Fan Control muss ein Helper-Tool installiert sein. Das alte Helper-Tool hatte zu viele Probleme, die nun mit der neuen Version des Tools beseitigt wurden:

- weniger CPU-Last, geringerer Energieverbrauch
- höhere Stabilität der App (kein zufälliger Crash, keine hohe Anzahl offener Mach Ports)

Falls Sie nicht planen, die Lüftersteuerung zu verändern, können Sie die Installation des Tools überspringen und die App im schreibgeschützten Lese-Modus ausführen. Falls Sie sich in Zukunft dafür entscheiden, die Standard-Einstellungen zu verändern, werden Sie erneut dazu aufgefordert das Tool zu installieren.

<h2>Verbesserte Nutzeroberfläche (UI)</h2>

Endlich unterstützt die App den Dark Mode unter macOS Mojave und Catalina:

<p class="text-center">
    <img src="/assets/images/blog/mfc_update_15_dark_mode.png" class="product-screenshot" data-rjs="2">
</p>

Der neue Einstellungs-Dialog sieht jetzt auch besser aus:

<p class="text-center">
    <img src="/assets/images/blog/mfc_update_15_preferences.png" class="product-screenshot" data-rjs="2">
</p>

<h2>Kompatibilität</h2>

__macOS__:

Die App ist immer noch kompatibel mit MacOS 10.7 und neueren Versionen, es gibt sie jetzt jedoch in zwei unterschiedlichen Downloads: Eine für [macOS 10.12 Sierra+](/downloads/macsfancontrol.zip) und die zweite für [macOS 10.7 Lion - 10.11 El Capitan](/downloads/legacy/macsfancontrol.zip).

__Windows__:

Windows XP und neuere Versionen, aber nur auf Mac Modellen, die nicht mit dem modernen [T2 chip](/macs-fan-control/supported-models) ausgestattet sind.
