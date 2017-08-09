---
permalink: /blog/snapshots-vs-realtime-monitor-when-monitoring-installations
layout: blog-post
title: Snapshots vs Realtime monitor when monitoring program installation
tags: [ "uninstall-tool"]
image: /assets/images/blog/icon_install_128.png
---

There're two approaches towards monitoring programs installations (in order to be able to perform clean removal). The first old school way - using of registry and file system snapshots before and after installation, then comparison of these 2 snapshots. The second, the one that is used in [Uninstall Tool](/uninstall-tool) - real-time monitoring using [Install Tracker (Installation Monitor)](/uninstall-tool/install-tracker-installation-monitor). This is the most advanced and modern way and here's why:

<!--more-->

- **Speed**. No need to wait for creating/comparing snapshots, a user simply installs the program the way he used to. A couple of mouse clicks may be required in the end of installation.
- **Accuracy**. Snapshots can be inaccurate because legitimate data of other programs can trap into the snapshot (programs that write to registry/file system at the time you install an app). This situation is impossible when using **Install Tracker** as it's using kernel mode driver that tracks only 'our' processes and does monitoring of them.

# {% t uninstall-tool.install_tracker.stripe_2_header %}

{% include how-to-monitor-installation.html %}