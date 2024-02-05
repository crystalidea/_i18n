---
permalink: /blog/zerotier-synology-arm-no-docker
layout: blog-post
title: Install ZeroTier on Synology NAS (also ARM64) without Docker
tags: [ "tech"]
---

The official ZeroTier [tutorial for Synology](https://docs.zerotier.com/synology/) currently has the following limitations:

- **No ARM64** - Docker ([Container Manager](https://www.synology.com/en-global/dsm/packages/ContainerManager)) package cannot be installed on older ARM64/aarch64 Synology models (RS819, DS119j, DS418, DS418j, DS218, DS218play and DS118 particularly). Even if you manage to install Docker yourself (might be tricky), the official [zerotier-synology](https://hub.docker.com/r/zerotier/zerotier-synology) image is amd64 only at the moment (there's a [pull request](https://github.com/zerotier/ZeroTierOne/pull/2169) for arm support, hopefully it will be merged some day).
- **Older ZeroTier client**: at the time of writing <ins>zerotier-synology</ins> uses ZeroTier 1.10.6 while the latest version is 1.12.2

If you want to use the latest ZeroTier and/or if you have ARM64-based Synology and/or simply <ins>prefer to avoid Docker</ins>, this tutorial is for you.

<!--more-->

## 1. Create a persistent TUN

SSH to your synology as root and proceed with commands.

```bash
ssh user@synology-ip
sudo -i
echo -e '#!/bin/sh -e \ninsmod /lib/modules/tun.ko' > /usr/local/etc/rc.d/tun.sh
chmod a+x /usr/local/etc/rc.d/tun.sh
/usr/local/etc/rc.d/tun.sh
```
Check for the TUN
```bash
ls /dev/net/tun
```
The command output should be /dev/net/tun.

## 2. Install ZeroTier

Create ZeroTier folder:
```bash
mkdir /volume1/Work/.zerotier
cd /volume1/Work/.zerotier
```
then download and run <ins>zerotier-download.sh</ins> script:
```bash
wget https://raw.githubusercontent.com/crystalidea/zerotier-linux-binaries/main/zerotier-download.sh
./zerotier-download.sh
```

The script downloads **zerotier-one** executable (with zero dependencies) for the target cpu architecture along with **zerotier-cli** symlink. If interested, learn how we compiled ZeroTier without dependencies [here](/blog/compile-zerotier-client-for-x86_64-and-arm64-linux).

Finally, download <ins>zerotier-start.sh</ins> script that will be run by Synology as root (see next step).
```bash
wget https://raw.githubusercontent.com/crystalidea/zerotier-linux-binaries/main/zerotier-start.sh
```

Do not close the SSH window yet.

## 3. Create DSM scheduled task

Open DSM and go to Control Panel -> Task Scheduler and create **zerotier** triggered task that will be automatically executed by Synology every boot:

<p class="text-center">
    <img src="/assets/images/blog/dsm_create_task.png" width="60%">
</p>

The task must be **Boot-up** and executed under **root**, the task name can be arbitrary. Task settings should include full path to <ins>zerotier-start.sh</ins>

<p class="text-center">
    <img src="/assets/images/blog/dsm_create_task_1.png" width="60%">
    <img src="/assets/images/blog/dsm_create_task_2.png" width="60%">
</p>

It's highly recommended to record all tasks output to some folder:

<p class="text-center">
    <img src="/assets/images/blog/dsm_create_task_settings.png" width="60%">
    <img src="/assets/images/blog/dsm_create_task_3.png" width="60%">
</p>

To avoid reboot now run the scheduled task manually:

<p class="text-center">
    <img src="/assets/images/blog/dsm_create_task_run.png" width="60%">
</p>

Go back to SSH and check if the ZeroTier service is running:

```bash
sudo ./zerotier-cli status
```
Which should output something like this
```
200 info 339748e2d0 1.12.2 ONLINE
```

If not, you should check the log folder. Now you can join the networks you need and authorize them online.

## Final thoughts

- The method successfully survives DSM updates
- Updating ZeroTier is as easy as replacing one file and reboot
- We [failed to compile](https://github.com/zerotier/ZeroTierOne/issues/2208) ZeroTier static on Raspberry Pi 2b 1GB for older armv7 32-bit Synology models