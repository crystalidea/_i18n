---
permalink: /blog/mac-studio-fan-control-and-fan-noise
layout: blog-post
title: Mac Studio fan control and fan noise
tags: [ "macs-fan-control"]
image: /assets/images/blog/mac-studio.png
---

We're happy to announce that the most recent version of <a href="{% link macs-fan-control/index.html %}">Macs Fan Control</a> fully supports new Apple Mac Studio 2022 mini desktop computer. 

<!--more-->

Mac Studio has 2 exhaust fans that are treated as a single fan, which means their speed (RPM) must be always synchronized (like in [iMac Pro](/blog/fan-control-imac-pro)). Macs Fan Control displays individually CPU efficiency/performance cores as well as GPU clusters temperatures. For convenience there's **CPU Core Average** virtual sensor that is calculated as average of all cores. Similarly there's **GPU Cluster Average** sensor for all GPU clusters.

## Fan speed and noise 

We've got two interesting observations:

- On both M1 Max & Ultra Mac Studio idle fan speed is locked at around 1315 RPM which is considerably higher than specified minimum of 1100 RPM

- No matter how hard and how long you push both CPU and GPU at the same time, fan speed never gets higher! [Confirming video](https://youtu.be/HOomaPcmgoM?t=1435) by Max Tech

Lots of users complain on relatively **high idle fan noise** when Mac Studio is close to a user (see related hot topics on MacRumors: [Mac studio fan noise - it's going to be one of the loudest Macs at idle](https://forums.macrumors.com/threads/mac-studio-fan-noise-its-going-to-be-one-of-the-loudest-macs-at-idle.2337251) and [Mac Studio Max - it's not that quiet](https://forums.macrumors.com/threads/mac-studio-max-its-not-that-quiet.2338488)). We recommend setting fan speed at 1100 RPM which is considerably less audible and according to our observations does not affect the cooling performance.

<p class="text-center">
    <img src="/assets/images/blog/mac-studio-m1-ultra-screenshot.png" data-rjs="2">
    <span class="font-xs">Macs Fan Control running on M1 Ultra powered Mac Studio</span>
</p>

One more thing: MacBook Pro 14/16" is also running the same M1 Max chip and has zero-RPM fan mode with no fan spinning while Mac Studio features much serious heatsink (even copper for M1 Ultra) and doesn't have zero-RPM fan mode. We think it's quite strange and we're planning to do some tweaks in the app in the next update ([v1.6](https://github.com/crystalidea/macs-fan-control/issues/582)).