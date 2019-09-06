---
permalink: /blog/bootcamp-and-windows-10-1903-may-update
layout: blog-post
title: Boot Camp and Windows 10 1903 (May Update)
image: /assets/images/blog/bsod.png
tags: [ "bootcamp"]
---

**Problem**: the latest Windows 10 update 1903 runs into BSOD (Blue screen of death) with error message WDF_VIOLATION on some mac models (MacBook Pro 2010/2011, MacBook Air 2011, Mac Mini 2012, iMac 2010/2011 and some others). This fatal failure occurs when Windows is already loaded and system tries to start Apple Boot Camp Utility (BootCamp.exe). This tool is responsible for controlling screen brightness, volume, functional keys, backlit, etc with Apple keyboard. On some machines crash happens only if you try to start our [Macs Fan Control](/macs-fan-control) app.

<!--more-->

**Cause**: older versions of the MacHALDriver.sys driver supplied with the Boot Camp Utility are not compatible with Windows 10 1903.

**Solution**: Basically you need to update to **Boot Camp 6** or later. 

First you need to disable the old driver to allow Windows to boot normally. The driver file located at c:\windows\system32\MacHALDriver.sys must be renamed, e.g. to "MacHALDriver.sys.old". There're 2 options here:
   - (from Windows) Boot up in safe mode (holding the F8 key) and rename the file.
   - (from macOS) Install [Tuxera NTFS][3] or [Paragon NTFS for Mac][4] to allow write access to Windows drive/partition and rename the driver file. Both apps are commercial but have a trial period.

   After that you can boot Windows 10, but Apple Boot Camp Utility won't work. Macs Fan Control is able to work without the Boot Camp driver but _slowly_. 

Install [7Zip][1] and [Brigadier][2]. Run the latter to download and install the latest official Boot Camp from Apple for your machine. Sometimes it may still download a faulty old version (e.g. for mid-2010 iMac), in this case we recommend downloading Boot Camp for another model using the --model parameter:
<pre>
 brigadier.exe --model iMacPro1,1
</pre>
 and run the Boot Camp installer manually (run your command prompt as administrator):
 <pre>
 msiexec /i BootCamp-041-55643\BootCamp\Drivers\Apple\BootCamp.msi
</pre>

**Tip**: to avoid this problem, we highly recommend updating your Boot Camp using the Brigadier app _before_ updating Windows to 1903.

[1]: https://www.7-zip.org/
[2]: https://github.com/timsutton/brigadier/releases
[3]: https://www.tuxera.com/products/tuxera-ntfs-for-mac/
[4]: https://www.paragon-drivers.com/en/ntfsmac/