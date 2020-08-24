---
permalink: /blog/stop-dropbox-client-using-gpu-on-windows
layout: blog-post
title: "Stop Dropbox client using GPU on Windows"
---

We've recently noticed that **dropbox.exe** process appears in the list of apps that consume GPU resources:

<p class="text-center">
    <img src="/assets/images/blog/dropbox-using-gpu.png">
</p>

Actually, quite many modern apps (e.g. Google Chrome or Mozilla Firefox) may also use GPU, but this behaviour can be turned off though not in the case of Dropbox Client, no command line switch exist either. While for most people this shouldn't be an issue, some advanced guys would want to have full control over their working environment and resources.

<!--more-->

The fix is extremely easy and straightforward:

1. Quit the Dropbox client app.
2. Rename or delete the file  
C:\Program Files (x86)\Dropbox\Client\%VERSION%\libGLESv2.dll
3. Start the client app again.

You can use the following "DropBoxNoGPU.bat" batch file that should work for all client versions:

<pre>
C:
cd "C:\Program Files (x86)\Dropbox\Client"

for /F "delims=" %%a in ('dir /ad /b') do (
   move %%a\libGLESv2.dll %%a\_libGLESv2.dll
)
</pre>
