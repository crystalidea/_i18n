---
permalink: /blog/optimizing-thermals-in-mac-pro-2013
layout: blog-post
title: "Optimizing thermals on Mac Pro 2013"
image: /assets/images/blog/mac-pro-2013.jpg
tags: [ "macs-fan-control"]
---

Mac Pro 2013 is still a beast of a machine. We still own one with the most balanced (from our perspective) custom CPU installed: 8 Core / 16 Threads 3.3 Ghz Base (4.0 Ghz Turbo) [E5-2667 v2](https://ark.intel.com/content/www/us/en/ark/products/75273/intel-xeon-processor-e5-2667-v2-25m-cache-3-30-ghz.html). It features same 130W TDP thermal design as with other CPUs that are officialy installed (12 core, for example).

The computer has a single whisper quiet fan but Apple traditionally prefers acoustics levels over actual thermals. In this post we demonstrate this behaviour and explain how to improve it.

<!--more-->

To stress test the CPU we're going to perform testing in Windows because of a little nice app called [powerMax](https://www.cpuid.com/softwares/powermax.html). It's able to torture CPU unprecedentedly with AVX CPU instructions (they heat up CPU badly, be very careful with it). [Speccy app](https://www.ccleaner.com/speccy) is used to display CPU core average temperature (between all 8 cores) along with GPUs and SSD temperatures. Room ambient temperature - 22C°. 

### Idle values (before the test):

<center>
    <img src="/assets/images/blog/mac-pro-2013-idle.png">
    <p class="font-xs">The fan is spinning at its minimum 790 RPM</p>
</center>

### After 10 minutes of AVX torture test:

<center>
    <img src="/assets/images/blog/mac-pro-2013-10-min-torture.png">
    <p class="font-xs">The fan is spinning at around 1200 RPM</p>
</center>

CPU Core Average reaches **83C°** after 4 minutes and remains there with fan spinning at around 1200 RPM. D500 GPU temperatures are at 66-67C° without any load and SSD temperature reaches 40C°. This is the price you pay for a computer in a compact stylish form-factor where basically all internals suffer from heat. What is more important, the default fan curve is **VERY** conservative to our mind: the fan starts to spin up after temperature already reached 80C! That's why a custom fan control for long CPU intensive tasks is preferred on this machine.

After the stress test is finished, the fan returns immediately to the minimum speed and all components (CPU/GPU/SSD) are slowly returning to the idle values. Even after 10 minutes of idle after the test, CPU temp sits at around 45C°, GPU at 51C° and SSD at 37C°.

On the other hand, if you manually set the fan spin at 1500 RPM, after about 3 minutes temperatures are back to idle values.

### Same 10 minutes AVX torture and custom fan control:

If you manually set the fan at 1500 RPM and do the test one more time, the situation drastically changes:

<center>
    <img src="/assets/images/blog/mac-pro-2013-10-min-torture-2.png">
    <p class="font-xs">The fan is spinning at 1500 RPM, thermals are much better now</p>
</center>

CPU and GPU temperatures dropped by around 9C° and SSD comfortly sits at 35C°. In a real world scenario with additional GPU and disk load added, custom fan control for Mac Pro trash can be basically essential.