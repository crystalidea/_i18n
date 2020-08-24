---
permalink: /blog/fix-bootcamp-control-panel-startup-disk
layout: blog-post
title: Boot Camp-Systemsteuerung zeigt kein MacOS Laufwerk/Partition
image: /assets/images/blog/boot-camp-control-panel.png
tags: [ "bootcamp"]
---

**Problem**: Die Boot Camp-Systemsteuerung auf Windows 10 zeigt kein MaccOS Laufwerk/Partition an, das man zum Booten auswählen könnte.

<!--more-->

**Ursache**: Die Boot Camp Utility kann keine APFS Laufwerke/Partitionen lesen. Die aktuellste Boot Camp Version ist momentan nur für iMacPro1,1 verfügbar.

**Lösung**: Sie müssen ein Update auf **Boot Camp 6.1** oder auf neuere Versionen durchführen.

1. [7Zip][1] installieren
2. [Brigadier][2] installieren und mit den --model-Parametern ausführen:
<pre>
 brigadier.exe --model iMacPro1,1
</pre>
 und den Boot Camp Installer manuell ausführen:
 <pre>
 msiexec /i BootCamp-041-55643\BootCamp\Drivers\Apple\BootCamp.msi
</pre>

[1]: https://www.7-zip.org/
[2]: https://github.com/timsutton/brigadier/releases
