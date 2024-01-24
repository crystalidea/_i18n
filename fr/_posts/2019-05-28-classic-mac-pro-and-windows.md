---
permalink: /blog/classic-mac-pro-and-windows
layout: blog-post
title: "Classic Mac Pro (5,1): installing Windows 10, switching between macOS Mojave &amp; Windows without boot screen"
image: /assets/images/blog/classic-mac-pro.png
tags: [ "macpro", "bootcamp"]
---

Classic Mac Pro 5,1 (or simply cMP, also 4,1 upgraded to 5,1) is now considered by Apple as [vintage][6]. It's pretty 
disappointing considering how capable and upgradable these machines still are. Installing Windows is no longer officially 
supported, but it's completely possible though not quite easy. 

Another challenge is that macOS Mojave 10.14 now implies using Metal-capable GPU while most of them are not able to 
display Apple boot menu (which you normally see holding the Option key) required to boot into Windows. Basicaly your screen
remains black until macOS is loaded. Well, some EFI bootable cards that support boot menu exist but they are released almost 
10 years ago and are really outdated. What is more, none of them supports displaying of boot menu with 4k 60hz monitor connected.

This guide is for those who want macOS Mojave + Windows 10 + modern GPU (in our case Sapphire Radeon Pulse RX 580 8GB).

<!--more-->

<p class="font-gray font-xs text-right">Updated 28 May 2019</p>

<h2>Installing Windows 10 in 5 steps</h2>

It's supposed that you have the latest Boot ROM version **144.0.0.0.0**. If not, please [update][7] first.

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-firmware.png">
</p>

<h3>Step 1: Use separate drive for Windows</h3>

Boot Camp Assistant no longer supports cMP and doesn't allow creating a separate partition for Windows.
Windows has to be installed on a separate drive, which is good actually to avoid messing with partitions in future.

We recommend using the internal SATA II connector in one of four drive bays or alternatively one of two SATA II connectors in the optical drive area. 
Using the [HP 654540-001 3.5" → 2.5" adapter][1] (7$) to place 2.5" SSD in a drive bay can be quite convenient.

Of cause, SATA II (up to 300MB/s) is a bottleneck for modern 2.5" SSDs (up to 550 MB/s where SATA III is preferable) 
but real life experience shows that the difference is hardly noticable unless you deal 
with lots of big files (e.g. >1GB where sequential read/write speeds matter) on your system drive.

We didn't test using PCIe → SATA III adapter or PCIe → NVMe adapter for Windows partition. Many people reported it was not possible in their case. If you successfully did it please let us know in the comments below or via e-mail.

<h3>Step 2: Create a bootable Windows 10 DVD disk</h3>

**<span style="color:red">Warning</span>**: DO NOT install Windows from a USB flash drive. It has been discovered that Windows when installed in EFI mode is corrupting the Mac Pro’s firmware by signing it with multiple Secure Boot (X.509) certificates. Also, you wouldn't be able to boot into Windows after selecting its drive as bootable in macOS Preferences → Startup disk. Therefore Windows should only be installed in Legacy BIOS mode **from an optical drive**.

Make sure that your Windows 10 ISO file fits on the DVD disk, in our case we had to burn Windows 10 1803 ISO (64-bit) to a single-layer DVD+R disc 4.7GB. 

Burning a DVD disk under macOS can be done with the following Terminal command:

<pre>drutil burn %path_to_iso_file%</pre>

On Windows we recommend using the free [ImgBurn][3] app.

<h3>Step 3: Boot from your Windows 10 DVD disk</h3>

Turn on your mac while holding the "C" key to boot from the optical disk (if you have PCIe drives installed and can't boot from the disc, remove those PCIe adapters).
Proceed with installation normally until you see the "Where do you want to install Windows" drive selection screen.

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-windows-drive-selection-1.png">
</p>

<h3>Step 4: Format the target drive</h3>

Press Shift+F10 to launch command prompt. Type the following commands:

<pre>
    diskpart
    list disk
</pre>

Now make sure to select the correct target drive number N (NOT your macOS disk), after that type:

<pre>
    select disk N
    clean
    exit
    exit
</pre>

You should now see your drive as Unallocated space.

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-windows-drive-selection.png">
</p>

Press the "New" button to create necessary partitions. There should be only two partitions (for legacy installation, EFI mode creates four) automatically created:

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-windows-drive-selection-2.png">
</p>

Select the newly created partition 2 and continue with installation normally. Your mac will be rebooted twice.
Every reboot do not forget entering the boot menu (by holding the Option key) and selecting 'Windows' boot drive there. When finished, boot into Windows. 

<h3>Step 5: Install Windows drivers and Boot Camp utility</h3>

Windows 10 installs all necessary drivers automatically except Bluetooth and internal speaker. 
These need to be installed from the original Boot Camp package for MacPro5,1.
Download and install [7zip][4], download [Brigadier 0.2.4][5] app, open Windows command prompt where Brigadier is located and type:

<pre>
	brigadier -m MacPro5,1
</pre>

When finished, it will create a folder **BootCamp-031-11269**, you need to install these for Bluetooth and internal speaker correspondingly, make sure you run the command prompt as administrator: 

<pre>
	BootCamp-031-11269\Drivers\Apple\x64\AppleBluetoothBroadcomInstaller64.exe
	BootCamp-031-11269\Drivers\RealTek\RealtekSetup.exe
</pre>

Now we need newer BootCamp drivers intended for iMacPro1,1:

<pre>
	brigadier -m iMacPro1,1
</pre>

When finished, it will create a folder **BootCamp-041-55643**, you need to run this command: 

<pre>
	msiexec /i BootCamp-041-55643\Bootcamp\Drivers\Apple\bootcamp.msi 
</pre>

When finished, reboot. We also recommend running Apple Software Update to update Wifi drivers:

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-windows-wifi-update.png">
</p>

You probably don't want to forget installing our awesome [Macs Fan Control][8] app, do you? :)

<h2>Switching between macOS Mojave &amp; Windows</h2>

When you're in macOS, use Preferences → Startup disk to select a boot drive:

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-mac-boot-menu.png">
</p>

When you're in Windows, use the Boot Camp Control Panel from your Windows tray to select a boot drive:

<p class="text-center">
	<img src="/assets/images/blog/classic-mac-pro-windows-boot-menu.png">
</p>

This guide is based on this [MacRumors thread][2]. Special thanks to **h9826790** for sharing his useful experience. Any comments are welcome.

[1]: https://www.ebay.com/itm/new-hp-654540-001-2-5-to-3-5-Drive-Adapter-tray-for-hp-g9-g8-N54L-651314-001/152919595060?ssPageName=STRK%3AMEBIDX%3AIT&_trksid=p2057872.m2749.l2649
[2]: https://forums.macrumors.com/threads/how-to-boot-camp-without-a-boot-screen.2114788/
[3]: http://www.imgburn.com/
[4]: https://www.7-zip.org/
[5]: https://github.com/timsutton/brigadier/releases/download/0.2.4/brigadier.exe
[6]: https://support.apple.com/en-us/HT201624
[7]: https://forums.macrumors.com/threads/mp5-1-what-you-have-to-do-to-upgrade-to-mojave-bootrom-upgrade-instructions.2142418/
[8]: https://crystalidea.com/macs-fan-control