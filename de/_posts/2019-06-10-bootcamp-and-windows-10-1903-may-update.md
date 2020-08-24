---
permalink: /blog/bootcamp-and-windows-10-1903-may-update
layout: blog-post
title: Boot Camp und Windows 10 1903 (Mai-Update)
image: /assets/images/blog/bsod.png
tags: [ "bootcamp"]
---

**Problem**: Das neueste Windows 10 Update 1903 löst einen Blue Screen aus (BSOD, blue screen of death) mit der Fehlermeldung WDF_VIOLATION auf einigen MacBook Modellen (MacBook Pro 2010/2011, MacBook Air 2011, Mac Mini 2012, iMac 2010/2011 und ein paar weitere). Dieser schwerwiegende Fehler taucht auf, wenn Windows bereits geladen wurde und das System versucht das Apple Boot Camp Utility (BootCamp.exe) auszuführen. Dieses Tool ist verantwortlich für die Steuerung der Bildschirmhelligkeit, Lautstärke, Funktionstasten, Hintergrundbeleuchtung, usw. über die Apple Tastatur. Bei manchen Geräten passiert dieser Crash nur, wenn Sie versuchen unsere [Macs Fan Control](/macs-fan-control) App zu starten.

<!--more-->

**Ursache**: Ältere Versionen der MacHALDriver.sys Treiber, die mit der Boot Camp Utility geliefert werden sind nicht kompatibel mit Windows 10 1903.

**Lösung**: Sie müssen nur ein Update auf **Boot Camp 6** oder eine neuere Version durchführen.

Zuerst müssen Sie die alten Treiber deaktivieren, um einen normalen Windows-Start ausführen zu können. Die Treiberdateien unter c:\windows\system32\MacHALDriver.sys müssen umbenannt werden, z.B. in "MacHALDriver.sys.old". Es gibt zwei Möglichkeiten:
   - (unter Windows) Starten Sie im sicheren Modus (F8 gedrückt halten) und benennen Sie die Datei um.
   - (unter MacOS) Installieren Sie [Tuxera NTFS][3] oder [Paragon NTFS for Mac][4] um Schreibzugang auf das Windows-Laufwerk/Partition zu gewähren und die Treiberdateien umzubenennen. Beide Apps sind kommerziell aber haben eine begrenzte Probelaufzeit.

   Anschließend können Sie Windows 10 booten, aber die Apple Boot Camp Utility wird nicht funktionieren. Macs Fan Control kann ohne den Boot Camp Treiber arbeiten, aber nur sehr _langsam_.

Installieren Sie [7Zip][1] und [Brigadier][2]. Führen Sie letztgenannten aus um die neueste offizielle Version des Boot Camp von Apple herunterzuladen und auf Ihrem Gerät zu installieren. Manchmal lädt es trotzdem eine fehlerhafte alte Version (z.B. für iMac Mitte 2010) herunter. In diesem Fall empfehlen wir das Boot Camp mit Hilfe des --model Parameters für ein anderes Model herunterzuladen:
<pre>
 brigadier.exe --model iMacPro1,1
</pre>
 und führen Sie den Boot Camp Installer manuell aus (führen Sie die Eingabeaufforderung als Administrator aus):
 <pre>
 msiexec /i BootCamp-041-55643\BootCamp\Drivers\Apple\BootCamp.msi
</pre>

**Tipp**: Um dieses Problem zu vermeiden, empfehlen wir Ihnen dringend, Ihr Boot Camp mit Hilfe Brigadier App zu aktualisieren, _bevor_ Sie das Windows 1903 Update durchführen.

[1]: https://www.7-zip.org/
[2]: https://github.com/timsutton/brigadier/releases
[3]: https://www.tuxera.com/products/tuxera-ntfs-for-mac/
[4]: https://www.paragon-drivers.com/en/ntfsmac/
