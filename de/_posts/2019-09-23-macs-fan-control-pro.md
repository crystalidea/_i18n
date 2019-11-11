---
permalink: /blog/macs-fan-control-pro
layout: blog-post
title: Macs Fan Control 1.5, introducing Pro version
image: /assets/images/blog/mfc_update_15.png
tags: [ "macs-fan-control"]
---

Our extremely popular [Macs Fan Control](/macs-fan-control) app now gets even better: Pro version with presets for advanced users, major UI improvements and more stability.

<!--more-->

<h2>Presets and Pro version</h2>

The app remains free but advanced users can get extra features by upgrading to the Pro version. Pro version is able to create and save custom fan presets so you can quickly switch between them depending on your activity. Additionally you get priority customer support and confidence in future updates and improvements.

<p class="text-center">
    <img src="/assets/images/blog/mfc_update_15_presets.png" class="product-screenshot" data-rjs="2">
</p>

Free version has only 3 presets:

- **Automatic**, all fans are set to Auto and controlled by the system
- **Full blast**, all fans are spinning at maximum RPM
- **Custom***, when you override fan control your way. This preset is saved between app launches (if you quit the app while the preset is active) and it gets lost when you switch back to **Auto** or **Full blast**. Basically it's the same behaviour you had with previous versions of the app.

<p class="text-center">
    <img src="/assets/images/blog/mfc_update_15_presets_free.png" class="product-screenshot" data-rjs="2">
</p>

<h2>NVMe drives support</h2>

For already a while all modern macs are equipped with NVMe blade drives instead of traditional SATA. In both Windows and macOS the app now displays those drives and their temperatures. New option in preferences lets you control whether you'd want to read drives temperatures (SMART and/or NVMe) or not. It can be quite useful for those who would like to optimize CPU usage and those who encounter issues with connected RAID and audio peripherals.

<h2>New helper tool</h2>

Macs Fan Control requires a helper tool to be installed for fan control. The old helper tool had many issues which are gone now, in the new version of the tool:

- Less CPU usage, less energy impact
- Better stability of the app (no random crashes, no high number of open mach ports) 

If you don't plan to override fan control, you're able to skip installing the tool and use the app in read-only mode. If you decide someday to override the default fan control, you'll be asked again to install the tool.

<h2>Improved User Interface</h2>

Finally the app gets support of the dark mode in macOS Mojave and Catalina:

<p class="text-center">
    <img src="/assets/images/blog/mfc_update_15_dark_mode.png" class="product-screenshot" data-rjs="2">
</p>

The new preferences dialog now also looks better:

<p class="text-center">
    <img src="/assets/images/blog/mfc_update_15_preferences.png" class="product-screenshot" data-rjs="2">
</p>

<h2>Compatibility</h2>

__macOS__:

The app is still compatible with macOS 10.7 and later but comes as two separate downloads: one for [macOS 10.14 Mojave+](/downloads/macsfancontrol.zip) and the second for [macOS 10.7 Lion - 10.13 High Sierra](/downloads/legacy/macsfancontrol.zip).

__Windows__:

Windows XP and later but only on mac models that are not equipped with the modern [T2 chip](/macs-fan-control/supported-models).