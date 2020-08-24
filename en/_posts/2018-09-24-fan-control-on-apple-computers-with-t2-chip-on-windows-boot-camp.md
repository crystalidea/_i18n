---
permalink: /blog/fan-control-on-apple-computers-with-t2-chip-on-windows-boot-camp
layout: blog-post
title: Fan control on Apple computers equipped with T2 chip on Windows (via Boot Camp)
tags: [ "macs-fan-control"]
image: /assets/images/blog/T2-chip.png
---

**Update 2020**: Now you can control fans on Windows 10 with the latest version of [Macs Fan Control](/macs-fan-control). Enjoy!

~~For years our wonderful [Macs Fan Control](/macs-fan-control) app has been helping thousands of people to monitor temperatures and take control over fans on Apple computers. Additional possibility of running the app under Windows (installed via Boot Camp) has always been an extra cool thing. The introduction of the new [T2 security chip](https://support.apple.com/en-us/HT208862) makes it currently impossible for the app to work under Windows (iMac Pro and MacBook Pro 2018).~~

<!--more-->

~~Extra security is great (even we didn't ask for it) but ONLY when it's limitations are optional and an experienced user can turn them off. Unfortunately, this is not an Apple thing: its computers become more and move about restrictions and limitations, which is not good for experienced users and developers. It seems that the T2 chip blocks access to [SMC](https://en.wikipedia.org/wiki/System_Management_Controller) under Windows, while SMC is essential to get sensors values and fans info.~~

~~We confirmed the problem themselves on both iMac Pro and MacBook Pro 2018. Unfortunately, we believe it won't be solved in the future, though there's a [GitHub issue](https://github.com/crystalidea/macs-fan-control/issues/80).~~

PS. There's another restriction of the T2 chip not related to the app: it's currently not possible to install any 3rdParty operating system except Windows 10 on Apple computers equipped with T2 chip (earlier some enthusiasts installed Linux). The T2 chip makes it impossible to see the internal drive, Apple generously did an exception only for Windows 10 (but only if you install it via Boot Camp). A possible option could be Linux installed on a USB/Thunderbolt external drive, unfortunately we tried this only for Windows but it worked (though the internal drive was not visible).