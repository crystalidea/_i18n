---
permalink: /blog/solve-kmode-exception-not-handled-on-windows-10-2004
layout: blog-post
title: "Solve KMODE_EXCEPTION_NOT_HANDLED when trying to update to Windows 10 version 2004"
image: /assets/images/blog/kmode-exception-not-handled.jpg
---

Some computers with different hardware may encounter BSOD (Blue Screen of Death) with KMODE_EXCEPTION_NOT_HANDLED error code when trying to upgrade to Windows 10 version 2004 from previous versions (1909).

<!--more-->

We faced this problem ourselves but also found more people on the Internet with same symptoms: 

- Upgrade using Windows Update (1909 -> 2004) fails with a BSOD (KMODE_EXCEPTION_NOT_HANDLED). Windows treats this reasonably as unsuccessful upgrade and performs automatic rollback to the previous version (1909). No crash dumps are created despite of all necessary settings enabled. Not being able to have a crash dump makes it basically impossible to discover the actual reason for the problem is still unknown.
- Clean install fails as well when booting from a USB flash with Windows 10 (2004) leads to the same BSOD.

<p class="font-xs">
We even tried converting the working Windows 10 (1909) to a VMWare virtual machine and tried an upgrade there but it also ended up with a rollback.
</p>

The solution we came up with is not obvious and straightforward unfortunately. It also requires a fresh install so please make sure to create a backup.

1. Boot into your working Windows 10 version 1909
2. (optional but recommended) Backup your system drive using the free [Macrium Reflect](https://www.macrium.com/reflectfree) app to some external storage
3. Install Windows 10 version 2004 on some external USB drive (we used Samsung T5 SSD) using the [WinToUSB](https://www.easyuefi.com/wintousb/) app. The free version works only with Windows 10 Home edition but you can either later upgrade Windows to Pro/Enterprise/etc or support developers and buy the app. We believe there maybe other (free) tools around, it's simply the one we used.
4. Boot into this USB drive and finish your Windows version 2004 installation
5. Use the free [Macrium Reflect](https://www.macrium.com/reflectfree) app to clone the USB drive to your initial target drive (internal).
6. Boot into the target drive, change your Windows install from "Windows to Go" back to normal buy deleting the 'PortableOperatingSystem' value located at HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control in your Windows registry. [More info](https://social.technet.microsoft.com/Forums/en-US/af05f60a-4cb0-4561-b49f-71938dad6853/my-computer-thinks-its-a-windows-to-go-computer-but-its-not?forum=W8ITProWTG)
7. Reboot an enjoy your brand new Windows 10 version 2004. 

<div class="font-xs font-gray">

<p>For the reference, our hardware that faced the problem:</p>

<ul>
<li> ASRock Z390 Phantom Gaming-ITX/ac Mini ITX LGA1151 Motherboard</li>
<li> Intel Core i7-8700K 3.7 GHz 6-Core Processor</li>
<li> Samsung 970 Pro 512 GB M.2-2280 NVME Solid State Drive</li>
<li> NVIDIA GeForce RTX 2060 SUPER 8 GB Video Card</li>
</ul>

All latest drivers and BIOS version, of cause.

</div>