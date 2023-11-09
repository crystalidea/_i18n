---
permalink: /blog/compile-zerotier-client-for-x86_64-and-arm64-linux
layout: blog-post
title: Compile ZeroTier client with no dependecies to use on any Linux
tags: [ "tech"]
---

Using the steps below you can successfully compile ZeroTier for both x86_64 and arm64 Linux systems. The resulting executable has zero dependencies thanks to static linking thus can be basically used on any Linux, inluding all Synology NAS models. We used x86_64 virtual machine and Raspberry Pi 4 both running Ubuntu 22.04.

Related: 

- [Use ZeroTier on Synology NAS (also arm64) without Docker](/blog/zero-tier-synology-arm-no-docker). 
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
Build and create a zip package:
```bash
make -j`nproc` ZT_STATIC=1 
strip zerotier-one
```

Create binary package:

```bash
tar -czvf zerotier_$(uname -p)_$ZT_VERSION.tar.gz zerotier-one zerotier-cli
```