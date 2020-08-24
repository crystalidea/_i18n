---
permalink: /blog/classic-mac-pro-wifi-bluetooth-upgrade
layout: blog-post
title: "Classic Mac Pro (5,1): W-Lan auf 802.11ac und Bluetooth auf 4.0 upgraden"
image: /assets/images/blog/classic-mac-pro-broadcom-wifi-bluetooth-module.png
tags: [ "macpro", "hardware"]
---

Classic Mac Pro 5,1 (auch 4,1 mit Upgrade auf 5,1) hat normalerweise nur WLan 802.11n und Bluetooth 2.1. Hier finden Sie die Hauptgründe, wieso Sie das W-Lan auf 802.11ac und Bluetooth auf 4.0 upgraden sollten:

- Sie erhalten [Continuity](https://www.apple.com/macos/continuity/), [Handoff](https://support.apple.com/en-us/guide/mac-help/mchl732d3c0a/mac) und das neue [AirDrop](https://en.wikipedia.org/wiki/AirDrop) native
- W-LAN 802.11ac ist wahnsinnig schnell, Bluetooth 4.0 ist zuverlässiger, sicherer und deutlich schneller
- MacOS 10.15 Catalina unterstützt alte BCM94322MC W-Lan Karten nicht mehr, daher funktioniert W-Lan damit nicht mehr

<!--more-->

**Haftungsausschluss**: Diese Website ist in keiner Weise mit einem der hier genannten E-Bay-Anbieter verbunden. Die Links werden nur für Ihren Komfort zur Verfügung gestellt. Wir übernehmen keine Haftung dafür, wenn Sie Ihren Computer in irgendeiner Weise (so unwahrscheinlich dies auch sein möge) beschädigen.

Das hier beschriebene Upgrade kit ist 100% native, beinhaltet keine externen Karten oder Antennen, und benötigt keine zusätzlichen Software-Installationen. Die im Kit genannte Broadcom-Karte wird nativ in vielen iMac Modellen verwendet und wird daher nativ von MacOs unterstützt. Irgendein kluger Typ verkauft ein ähnliches Kit für ca. 215 USD + Versandkosten, aber normalerweise erhält man für ein Viertel des Preises (und kostenlose Lieferung von China)

**Das Kit**:

- Broadcom BCM94360CD + mPCIe Adapter. [Ebay](https://www.ebay.com/itm/Apple-Broadcom-BCM94360CD-802-11ac-mini-PCI-E-WiFi-WLAN-Bluetooth-4-0-Card/251723761338?ssPageName=STRK%3AMEBIDX%3AIT&_trksid=p2057872.m2749.l2649)
- Bluetooth Antenne - Verlängerungskabel. [Ebay](https://www.ebay.com/itm/24-U-FL-IPX-Male-to-ipex-Female-Cable-Wifi-Antenna-Extension-Mini-PCI-Card/191422150400?ssPageName=STRK%3AMEBIDX%3AIT&_trksid=p2057872.m2749.l2649)
- JST GH 1.25MM 4Pin Konnektoren (3). [Ebay](https://www.ebay.com/itm/10pcs-JST-GH-1-25MM-3-4Pin-Double-end-Female-Male-Connector-w-Wires-Cable/273191562853?ssPageName=STRK%3AMEBIDX%3AIT&var=572461669291&_trksid=p2057872.m2749.l2649)

**UPDATE September 2019!**
Es gibt eine Version des mPCIe Adapters, die ohne Löten funktioniert!  [Amazon](https://www.amazon.com/gp/product/B0762N451V), [Ebay](https://www.ebay.com/itm/Mini-PCI-E-52pin-Adapter-For-BCM94360CD-BCM94331CD/261598561965?epid=1631968703&hash=item3ce87d46ad:g:sXcAAOSwi8VZTLqm). In diesem Fall können Sie Schritt 1 überspringen.

<h2>1. Bluetooth Datenkabel an den mPCIe Adapter löten</h2>

Die originale Bluetooth-Karte wird entfernt, da der BCM94360CD sowohl Bluetooth als auch W-Lan on board hat. D+ und D- Konnektoren auf dem mPCIe Adapter müssen zum Motherboard anstatt zur alten Bluetooth-Karte verbunden werden.

- Sie brauchen DREI JST Kabel, von denen Sie die gelben und grünen Kabel entfernen (nur Schwarz und Rot werden verwendet).
- Verbinden Sie diese miteinander, so dass Sie eine ausreichende Länge für das Bluetooth-Datenkabel erhalten:

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-bluetooth-jst-cables.png">
</p>

- Löten Sie (oder jemanden fragen, der ein Lötgerät hat) die D+ und D- Kontakte auf den Adapter an die schwarzen und roten Kabel (nicht so sauber auf dem Foto).

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-bluetooth-soldered-before.png">
</p>

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-bluetooth-soldered.png">
</p>

<h2>2. CPU/RAM Tray entfernen</h2>

Öffnen Sie Ihren Mac Pro und entfernen Sie das CPU/RAM Tray.

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-cpu-tray.png">
</p>

Anschließend sollte Ihre Computer wie auf dem folgenden Foto aussehen. Die W-Lan Karte ist auf der linken Seite markiert und die kleine Bluetooth-Karte auf der rechten Seite. Später werden wir Kabel hinter dem in der Mitte markierten Bereich durchziehen.

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-cpu-tray-removed.png">
</p>

<h2>3. Alte W-Lan &amp; Bluetooth Karten entfernen</h2>

- Lösen Sie die kleinen Schrauben, welche die alte AirPort W-Lan Karte festhalten, und trennen Sie 2 oder 3 Antennen indem Sie diese leicht zu sich hinziehen (je nach Modell kann eine Antenne ungenutzt unter der Karte verstaut), entfernen Sie die Karte, indem Sie diese nach links schieben.

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-unscrew-airport-card.png">
</p>

- Lösen Sie die Schraube, die die alte Bluetooth Karte festhält, trennen Sie das Datenkabel und die goldenen Antennenkonnektoren, entfernen Sie die Karte, indem Sie diese zu sich ziehen, sie ist mit einem Klebstoff leicht befestigt.

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-unscrew-bluetooth-card.png">
</p>

<h2>4. Neue W-Lan &amp; Bluetooth Karte installieren</h2>

Die neue Karte mit dem Adapter gehört in de PCIe Slot, wo zuvor Ihre alte W-Lan Karte war. Verbinden Sie die drei W-Lan Antennen und ein Bluetooth Antennen-Verlängerungskabel mit der Karte genau wie unten auf dem Bild:

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-new-airport-antennas.png">
</p>

Schieben Sie Karte mit allen 4 angebrachten Antennen in den mPCIe Adapter, dann schieben Sie den Adapter in den mPCIe Slot. Befestigen Sie den Adapter mit einem der beiden Schrauben, die die alte Karte befestigt hatten.

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-bluetooth-wifi-installed.png">
</p>

Das lose Ende Ihres Bluetooth Antennen-Verlängerungskabel sollte mit dem bestehenden Bluetooth Antennenkabel verbunden werden (zuvor von der alten Bluetooth Karte abgetrennt).

Das loise Ende unseres Bluetooth Datenkabels muss mit dem Motherboard verbunden werden:

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-bluetooth-data-cable.png">
</p>

Wenn möglich können Sie kleine Streifen Tape verwenden, um sicherzustellen, dass die Kabel sicher verbunden bleiben und sich nicht zu sehr bewegen.

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-bluetooth-version.png">
</p>

<p class="text-center">
    <img src="/assets/images/blog/classic-mac-pro-bluetooth-version-wifi.png">
</p>

Dieser Guide basiert auf [MacRumors thread](https://forums.macrumors.com/threads/802-11ac-bt-4-0-and-continuity-handoff-are-working-on-mac-pro-2010-keep-updating.1748061/).
