---
permalink: /blog/fan-control-on-apple-computers-with-t2-chip-on-windows-boot-camp
layout: blog-post
title: Lüftersteuerung unter Windows (via Boot Camp) auf Apple-Computern mit T2 Chip
tags: [ "macs-fan-control"]
image: /assets/images/blog/T2-chip.png
---

**Update 2020**: Now you can control fans on Windows 10 with the latest version of [Macs Fan Control](/macs-fan-control). Enjoy!

~~Jahrelang hat unsere wunderbare App [Macs Fan Control](/macs-fan-control) tausenden Menschen bei der Temperaturüberwachung und der Lüftersteuerung ihrer Apple-Computer geholfen. Die zusätzliche Verwendung der App unter Windows (installiert via Boot Camp) war außerdem immer ein cooles Feature. Die Einführung des neuen [T2 security chip](https://support.apple.com/en-us/HT208862) macht momentan die Verwendung der App unter Windows (iMac Pro und Macbook Pro 2018) unmöglich.~~

<!--more-->

~~Mehr Sicherheit ist immer toll (auch wenn keiner danach gefragt hat) - aber NUR wenn die dadurch entstehenden Einschränkungen optional sind und sie sich von erfahrenen Nutzern ausschalten lassen. Leider gehört das jedoch nicht zur Firmenphilosophie: Apple-Computer haben zunehmend mehr Einschränkungen und machen es dadurch für erfahrene Nutzer und Entwickler schwerer. Anscheinend blockiert der T2 Chip momentan den Zugriff auf [SMC](https://en.wikipedia.org/wiki/System_Management_Controller) unter Windows; SMC ist jedoch essentiell um Sensorwerte und Lüfterinformationen auszulesen.~~

~~Wir konnten das Problem sowohl auf iMac Pro als auch auf MacBook Pro 2018 nachweisen. Leider müssen wir davon ausgehen, dass dieses Problem auch in Zukunft nicht gelöst wird, jedoch gibt es ein [GitHub issue](https://github.com/crystalidea/macs-fan-control/issues/80).~~

PS.: Es gibt eine weitere Einschränkungen durch den T2 Chip, die nichts mit der App zu tun hat: Es ist im Moment nicht möglich, 3rdParty Operating Systems mit Ausnahme von Windows 10 auf Apple Computern mit T2 Chip zu installieren (zuvor haben manche Enthusiasten Linux installiert). Der T2 Chip macht es unmöglich das interne Laufwerk zu sehen. Apple hat nur für Windows 10 eine großzügige Ausnahme eingeräumt (aber nur, wenn Sie es über Boot Camp installieren). Als mögliche Alternative könnte Linux auf einem externen USB/Thunderbolt Laufwerk installiert werden, leider konnten wir dies bisher nur für Windows ausprobieren, aber es hat funktioniert (obwohl das interne Laufwerk nicht sichtbar war).
