---
permalink: /blog/fix-bootcamp-control-panel-startup-disk
layout: blog-post
title: Fix Boot Camp Control panel doesn't see macOS drive/partition
image: /assets/images/blog/boot-camp-control-panel.png
tags: [ "bootcamp"]
---

**Problem**: Boot Camp Control panel on Windows 10 doesn't display macOS drive/partition which you could select to boot into.

<!--more-->

**Cause**: The Boot Camp utility is not able to read APFS drive/partitions. The most recent Boot Camp version is currently available only for iMacPro1,1.

**Solution**: Basically you need to update to **Boot Camp 6.1** or later. 

1. Install [7Zip][1]
2. Install and run [Brigadier][2] it using the --model parameter:
<pre>
 brigadier.exe --model iMacPro1,1
</pre>
 and run the Boot Camp installer manually:
 <pre>
 msiexec /i BootCamp-041-55643\BootCamp\Drivers\Apple\BootCamp.msi
</pre>

[1]: https://www.7-zip.org/
[2]: https://github.com/timsutton/brigadier/releases
