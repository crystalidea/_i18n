---
permalink: /blog/classic-mac-pro-and-windows
layout: blog-post
title: "Classic Mac Pro (5,1): Installation von Windows 10, Wechsel zwischen MacOS Mojave &amp; Windows ohne Startbildschirm"
image: /assets/images/blog/classic-mac-pro.png
tags: [ "macpro", "bootcamp"]
---

Classic Mac Pro 5,1 (kurz cMP oder auch 4,1 mit Upgrade auf 5,1) wird von Apple jetzt als [vintage][6] betrachtet. Das ist ziemlich enttäuschend, wenn man bedenkt, wie leistungsstark und upgrade-bar diese Geräte heute noch sind. Windows-Installationen werden offiziell nicht mehr unterstützt, sind aber mit etwas Aufwand immer noch möglich.

Eine weitere Herausforderung ist, dass MacOS Mojave 10.14 jetzt die Verwendung von Metal-capable GPUs impliziert während die meisten nicht in der Lage sind, das Apple Boot-Menü anzuzeigen (das man normalerweise durch Halten der Wahltaste anzeigen kann), das für den Boot mit Windows notwendig ist. Der Bildschirm bleibt praktisch schwarz bis MacOs geladen wurde. Es gibt ein paar bootfähige EFI-Karten, die das Boot-Menü unterstützen, aber sie wurden vor fast 10 Jahren veröffentlicht und sind sehr veraltet. Außerdem unterstütz keine dieser Karten das Boot-Menü wenn ein 4k 60Hz Bildschirm angeschlossen ist.

Dieser Guide ist für alle, die macOS Mojave + Windows 10 + moderner GPU wollen (in unserem Fall Sapphire Radeon Pulse RX 580 8GB).

<!--more-->

<p class="font-gray font-xs text-right">Updated 28 May 2019</p>

<h2>Windows 10 in 5 Schritten installieren</h2>

Sie benötigen die neueste Boot ROM Version **144.0.0.0.0**. Falls Sie diese nicht besitzen, führen Sie bitte zuerst ein [update][7] aus.

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-firmware.png">
</p>

<h3>Schritt 1: Separates Laufwerk für Windows verwenden</h3>

Der Boot Camp Assistant unterstützt cMP nicht mehr und erlaubt die Erstellung einer separaten Partition für Windows nicht.
Windows muss auf einem separaten Laufwerk installiert werden. Tatsächlich hat das Vorteile, da so künftige Partitions-Probleme vermieden werden.

Wir empfehlen die Verwendung des internen SATA II Connector in einem der vier Festplattenschächte oder alternativ einen der zwei SATA II Connector im Bereich der optischen Laufwerke.
Die Verwendung der [HP 654540-001 3.5" → 2.5" adapter][1] (7$) um eine 2.5" SSD in ein Festplattenschacht einzubauen macht das ganze etwas bequemer.

Natürlich ist SATA II (bis zu 300MB/s) ein Bottleneck für moderne 2.5" SSDs (bis zu 550 MB/s bei SATA III Vorzug)
aber die Erfahrung zeigt, dass dieser Unterschied kaum spürbar ist, außer wenn Sie mit vielen großen Dateien (z.B. >1GB bei denen aufeinanderfolgende read/write Geschwindigkeiten wichtig sind) auf Ihrem Systemlaufwerk arbeite.

Wir haben die Verwendung PCIe → SATA III Adapter oder PCIe → NVMe Adapter für die Windows-Partition nicht getestet. Viele Nutzer haben berichtet, dass es in Ihren Fällen nicht funktioniert hat. Falls Sie dies erfolgreich geschafft haben, lassen Sie es uns bitte in den Kommentaren oder per E-Mail wissen.

<h3>Schritt 2: Erstellung einer bootfähigen Windows 10 DVD </h3>

**<span style="color:red">Warnung</span>**: Installieren Sie Windows NICHT von einem USB-Flash-Laufwerk. Es hat sich herausgestellt, dass Windows die Mac Pro Firmware beschädigt, wenn es im EFI Modus installiert wird, indem es sich mit mehreren Secure Boot (X.509) Zertifikaten anmeldet. Außerdem wären Sie nicht in der Lage in Windows zu booten, nachdem Sie das Laufwerk als bootfähig ausgewählt haben unter MacOs Einstellungen → Startlaufwerk. Daher sollte Windows nur im Legacy BIOS Modus **von einem optischen Laufwerk** aus installiert werden.

Stellen Sie sicher, dass ihre Windows 10 ISO-Datei auf die DVD passt. In unserem Fall mussten wir Windows 10 1803 ISO (64-bit) auf eine Single-Layer DVD+R 4.7GB brennen.

DVDs können unter MacOS mit dem folgenden Befehl ausgeführt werden:

<pre>drutil burn %path_to_iso_file%</pre>

Unter Windows empfehlen wir die Verwendung der kostenlosen [ImgBurn][3] App.

<h3>Schritt 3: Boot von Ihrer Windows 10 DVD</h3>

Fahren Sie Ihren Mac hoch während Sie die „C“-Taste gedrückt halten, um von einem optischen Datenträger zu booten (wenn Sie PCIe Treiber installiert haben und nicht von einer DVD booten können, entfernen Sie die diese PCIe Adapter).
Fahren Sie mit der Installation wie gewohnt fort bis Sie zum Fenster „Wo wollen Sie Windows installieren“ gelangen.

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-windows-drive-selection-1.png">
</p>

<h3>Schritt 4: Formatieren des Ziellaufwerks</h3>

Drücken Sie Shift+F10 um die Eingabeaufforderung zu öffnen. Tippen Sie die folgenden Befehle ein:

<pre>
    diskpart
    list disk
</pre>

Stellen Sie sicher, dass Sie das richtige Nummer N des Ziellaufwerks auswählen (NICHT ihr MacOs Laufwerk), tippen Sie anschließend:

<pre>
    select disk N
    clean
    exit
    exit
</pre>

Sie sollten nun ihr Laufwerk als nicht zugeordneten Speicher.

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-windows-drive-selection.png">
</p>

Klicken Sie auf „Neu“, um notwendige Partitionen zu erstellen. Es sollten nur zwei Partitionen (für die Legacy Installation, EFI Modus erstellt vier) automatisch erstellt werden:

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-windows-drive-selection-2.png">
</p>

Wählen Sie die neu erstellten Partition 2 aus und fahren Sie mit der Installation fort. Ihr Mac wird zweimal neu booten. Vergessen Sie nicht bei jedem Reboot das Boot-Menü zu öffnen (indem Sie die Option Taste gedrückt halten) und „Windows“ als Boot-Laufwerk auszuwählen. Wenn dies abgeschlossen wurde, booten Sie Windows.

<h3>Schritt 5: Windows-Treiber und Boot Camp Utility installieren</h3>

Windows 10 installiert alle notwendigen Treiber automatisch mit Ausnahme von Bluetooth- und internen Lautsprechern.
Diese müssen über das originale Boot Camp Package für MacPro5,1 installiert werden.
Laden Sie [7zip][4] herunter und installieren Sie es, laden Sie die [Brigadier 0.2.4][5] App herunter, öffnen Sie in der Windows-Eingabeaufforderung den Ordner in dem Brigadier befindet und tippen Sie:

<pre>
	brigadier -m MacPro5,1
</pre>

Anschließend wird ein Ordner **BootCamp-031-11269** erstellt. Diese müssen Sie für Bluetooth- und interne Lautsprecher entsprechend installieren. Stellen Sie sicher, dass Sie die Eingabeaufforderung als Administrator ausführen:

<pre>
	BootCamp-031-11269\Drivers\Apple\x64\AppleBluetoothBroadcomInstaller64.exe
	BootCamp-031-11269\Drivers\RealTek\RealtekSetup.exe
</pre>

Jetzt benötigen wir die neueren Boot Camp Treiber für iMacPro1,1:

<pre>
	brigadier -m iMacPro1,1
</pre>

Dies erstellt den Ordner **BootCamp-041-55643**. Führen Sie nun den folgenden Befehl aus:

<pre>
	msiexec /i BootCamp-041-55643\Bootcamp\Drivers\Apple\bootcamp.msi
</pre>

Anschließend neu starten. Wir empfehlen ein Apple Software Update durchzuführen, um die W-Lan-Treiber zu aktualisieren:

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-windows-wifi-update.png">
</p>

Sie wollen wahrscheinlich auch nicht verpassen, die wahnsinnig tolle [Macs Fan Control][8] App zu installieren, oder? :)

<h2>Wechsel zwischen MacOS Mojave &amp; Windows</h2>

In MacOs können Sie unter Einstellungen → Startlaufwerk das Startlaufwerk auswählen:

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-mac-boot-menu.png">
</p>

Wenn Sie in Windows sind, können Sie das Boot Camp Control Panel über das Windows System-Tray öffnen, um ein Boot-Laufwerk auszuwählen:

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-windows-boot-menu.png">
</p>

Dieser Guide basiert auf dem [MacRumors thread][2]. Besonderen Dank an **h9826790** für das Mitteilen seiner nützlichen Erfahrungen. Alle Kommentare sind herzlich willkommen.

[1]: https://www.ebay.com/itm/new-hp-654540-001-2-5-to-3-5-Drive-Adapter-tray-for-hp-g9-g8-N54L-651314-001/152919595060?ssPageName=STRK%3AMEBIDX%3AIT&_trksid=p2057872.m2749.l2649
[2]: https://forums.macrumors.com/threads/how-to-boot-camp-without-a-boot-screen.2114788/
[3]: http://www.imgburn.com/
[4]: https://www.7-zip.org/
[5]: https://github.com/timsutton/brigadier/releases/download/0.2.4/brigadier.exe
[6]: https://support.apple.com/en-us/HT201624
[7]: https://forums.macrumors.com/threads/mp5-1-what-you-have-to-do-to-upgrade-to-mojave-bootrom-upgrade-instructions.2142418/
[8]: https://crystalidea.com/macs-fan-control
