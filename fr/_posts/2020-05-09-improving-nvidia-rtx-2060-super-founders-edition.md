---
permalink: /blog/improving-nvidia-rtx-2060-super-founders-edition
layout: blog-post
title: "Improving NVIDIA GeForce RTX 2060 SUPER Founders Edition"
image: /assets/images/blog/rtx2060s.jpg
tags: ["hardware"]
---

NVIDIA GeForce RTX 2060 SUPER Founders Edition is a great looking card of premium build quality that performs on the same level as RTX 2070 (also with 8GB of GDDR6) with a competitive 400$ price tag. Dual axial fans provide outstanding thermal results and very quiet acoustics when gaming. But does it have some flaws? From our perspective: 

- Idle fan noise
- No way of controlling LED RGB logo (GEFORCE RTX)

<!--more-->

**Idle fan noise**. The GPU has a striking idle temperature of 31C° but at a cost of idle fan speed fixed at 42% (1500 RPM). Browsing Internet hearing this noise can be quite annoying (specially when your PC is sitting next to you on the table). Even with MSI Afterburned there's absolutely no way to lower that speed, which we find accessive particularly if you care about acoustics as much as we do.

**LED RGB logo**. Some users dislike the default color, some want animation effects and some simply want to turn it off.

There's a single solution to both issues: flashing the default BIOS to the one from [EVGA RTX 2060 Super SC Ultra](https://www.techpowerup.com/review/evga-geforce-rtx-2060-super-sc-ultra/). It's also a dual-fan GPU that uses the same frequencies as with Founders Edition. What is more important: it features zero RPM mode under no load and has adjustable LED with [EVGA Precision X1](https://www.evga.com/precisionx1/) software.

### Disclaimer

<span class="font-xs">
WARNING! Flash the BIOS at your own risk. Flashing a video card BIOS to a different model and/or series WILL void your warranty. This process can also cause other permanent issues like video artifacts and premature hardware failure! We cannot and will not be held responsible for the misuse of the information provided in this guide. Please, if you have any questions, jump onto the forums and ask away! We do not suggest you attempt this EVER! The BIOS linked in this tutorial may not work for your video card!
</span>

### Flashing the BIOS

- Download [NVIDIA NVFlash with Board Id Mismatch Disabled](https://www.techpowerup.com/download/nvidia-nvflash-with-board-id-mismatch-disabled/)
- Download [EVGA RTX 2060 Super ROM](https://www.techpowerup.com/vgabios/?architecture=&manufacturer=EVGA&model=RTX+2060+Super&interface=&memType=&memSize=&since=), we used version **90.06.44.80.41**.
- Disable your GPU from the device manager
<p class="text-center">
    <img src="/assets/images/blog/rtx2060s-disable.jpg">
</p>
- Open Windows Command Prompt as Administrator
- Make a backup of your current ROM:
<pre>
nvflash64_patched_5.590.0.exe -b backup.rom
</pre>
- Flash
<pre>
nvflash64_patched_5.590.0.exe -6 EVGA.RTX2060Super.8192.190724.rom
</pre>
It will ask you to confirm a few times, follow the prompts and wait for it to finish flashing.
- Reboot

After that GPU-Z will show EVGA SC Ultra now and you can enjoy silence. If you face some difficulties much more detailed guide of flashing RTX BIOS can be found [here](https://www.overclockersclub.com/guides/how_to_flash_rtx_bios/). 

<p class="text-center">
    <img src="/assets/images/blog/rtx2060s-evga.png">
</p>

RGB and other tuning can be performed in the EVGA Precision X1 app. 

<p class="text-center">
    <img src="/assets/images/blog/rtx2060s-evga-precision.png">
</p>

Result:

<p class="text-center">
    <video width="576" source="" src="/assets/video/rtx_2060s_animating_logo.mp4" type="video/mp4" autoplay="" muted="" loop=""></video>
</p>