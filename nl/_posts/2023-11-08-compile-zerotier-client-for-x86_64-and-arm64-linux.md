---
permalink: /blog/compile-zerotier-client-for-x86_64-and-arm64-linux
layout: blog-post
title: Compile ZeroTier client with no dependecies to use on any Linux
tags: [ "tech"]
---

Using the steps below you can successfully compile ZeroTier for x86_64, arm64 and arm32 (armv7) Linux systems. The resulting executable has zero dependencies thanks to static linking thus can be basically used on any Linux, including all Synology NAS models. We used a virtual machine for x86_64 build and Raspberry Pi 4 for arm64 build all running Ubuntu 22.04. 

Related: 

- [Install ZeroTier on Synology NAS (also arm64) without Docker](/blog/zerotier-synology-arm-no-docker). 
- [Compiled binaries](https://github.com/crystalidea/zerotier-linux-binaries/releases)

<!--more-->

Install required build tools:
```bash
sudo apt install curl build-essential pkg-config libssl-dev
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
```
Download & extract ZeroTier:
```bash
ZT_VERSION=1.12.2
wget https://github.com/zerotier/ZeroTierOne/archive/refs/tags/$ZT_VERSION.tar.gz
tar zxf $ZT_VERSION.tar.gz
cd ZeroTierOne-*
```
Build ZeroTier executable (takes time) and strip it to minimize size:
```bash
make -j`nproc` ZT_STATIC=1 
strip zerotier-one
```

Create a .tar.gz archive containing **zerotier-one** binary and **zerotier-cli **symlink:

```bash
tar -czvf zerotier_$(uname -p)_$ZT_VERSION.tar.gz zerotier-one zerotier-cli
```

Note: we [failed to compile](https://github.com/zerotier/ZeroTierOne/issues/2208) ZeroTier static on Raspberry Pi 2b 1GB for older armv7 32-bit Synology models.