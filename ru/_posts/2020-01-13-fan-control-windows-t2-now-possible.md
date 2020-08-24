---
permalink: /blog/fan-control-windows-t2-now-possible
layout: blog-post
title: "Macs Fan Control now works in Windows 10 on modern Apple computers equipped with the T2 chip"
image: /assets/images/blog/T2-chip-2.png
tags: [ "macs-fan-control"]
---

[Macs Fan Control](/macs-fan-control) wasn't able to work under Windows on Apple computers equipped with the T2 security chip since its introduction in 2018. We honestly thought it wasn't actually possible but now it is! We're happy to announce that the program now flawlessly works in Windows 10 on modern Apple computers that have the T2 chip:

<!--more-->

- MacBook Pro introduced in 2018 or later
- MacBook Air introduced in 2018 or later
- Mac mini introduced in 2018
- Mac Pro introduced in 2019. [NOT YET WORKING](https://github.com/crystalidea/macs-fan-control/issues/262)
- iMac Pro [NOT YET WORKING](https://github.com/crystalidea/macs-fan-control/issues/262)

Basically, the app now works on any Intel-based Apple computer in both Windows & macOS. [Complete list](/macs-fan-control/supported-models) of supported models.

## Under the hood

It's finally possible thanks to a custom developed kernel mode driver (AppleSMC.sys). It's digitally signed with a EV certificate which means you don't have to change Secure Boot settings. The driver gets installed automatically and removed when you uninstall the app.

## Changes in Pro version licensing

Starting from 01-13-2020 (13th of January 2020) when [buying the Pro version](/macs-fan-control/buy) you can choose whether to buy it only for **macOS** or both **macOS+Windows**. If you bought the Pro version before 01-13-2020, your license key is also valid on both systems.

