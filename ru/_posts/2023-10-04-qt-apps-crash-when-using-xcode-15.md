---
permalink: /blog/qt-apps-crash-when-using-xcode-15
layout: blog-post
title: Solving problems using Qt with Xcode 15
tags: [ "dev"]
---

Once you upgrade to macOS Sonoma, you have to use Xcode 15 (Xcode 14 won't work) and might face similar problems described below.

<!--more-->

### Problem #1: QMake does not work with Xcode 15

When trying to build a project on macOS you get the following error:

```
failed to parse default search paths from compiler output
```

**Solution**: this has been fixed in Qt 6.5.3 (will be also fixed in Qt 5.15.16 commercial), for earlier Qt version you should apply the following [patch](https://codereview.qt-project.org/c/qt/qtbase/+/503916) to `mkspecs/features/toolchain.prf` file before compiling. It can be easily backported to Qt 5.15.x - [example](https://github.com/crystalidea/qt-build-tools/commit/134b1cc523bf266c7a2cd00e8902268537406f1c).

### Problem #2: your Qt app crashes when running on macOS < 14 (and iOS < 17)

Crash report will have something like this:

```
dyld[56529]: Symbol not found: __ZTVNSt3__13pmr15memory_resourceE
  Referenced from: <UUID> qt6/qtbase/build_arm64/libexec/moc
  Expected in:     <UUID> /usr/lib/libc++.1.dylib
```

**Solution**: this has been fixed in Qt 6.5.3 (will be also fixed in Qt 5.15.16 commercial), for earlier Qt version you should apply the following [patch](https://codereview.qt-project.org/c/qt/qtbase/+/482392) to some headers before compiling. It can be easily backported to Qt 5.15.x - [example](https://github.com/crystalidea/qt-build-tools/commit/fffd3d4b0a628dd780ff8cd553e8f8dc9c66c2ab).

### Problem #3: your Qt app crashes when running on macOS < 13 (and iOS < 15)

Crash reports might look different, our report on macOS 11:

```
Crashed Thread:        0  mainThread  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_INVALID_ADDRESS at 0x0000000008cfe004
Exception Note:        EXC_CORPSE_NOTIFY

Termination Signal:    Segmentation fault: 11
Termination Reason:    Namespace SIGNAL, Code 0xb
Terminating Process:   exc handler [1068]

Thread 0 Crashed:: mainThread  Dispatch queue: com.apple.main-thread
0   org.qt-project.QtCore           0x0000000109e5a4a9 operator==(QString const&, QString const&) + 9
1   org.qt-project.QtCore           0x0000000109faafd0 QObject::setObjectName(QString const&) + 112
2   com.crystalidea.anytoiso        0x0000000108d0c513 0x108cfe000 + 58643
3   com.crystalidea.anytoiso        0x0000000108d0c128 QAppMainWindow::QAppMainWindow(QWidget*, QFlags<Qt::WindowType>) + 88
4   com.crystalidea.anytoiso        0x0000000108d0ac79 main + 153
5   libdyld.dylib                   0x00007fff20480f3d start + 1

```

It's caused by the new optimized Xcode 15 linker when linking static libraries. 

> Binaries using symbols with a weak definition crash at runtime on iOS 14/macOS 12 or older. This impacts primarily C++ projects due to their extensive use of weak symbols. (114813650) (FB13097713)

[Xcode release notes with detailed explanation](https://developer.apple.com/documentation/xcode-release-notes/xcode-15-release-notes#Linking)

**Solution**: add this to your .pro file

`LIBS += -Wl,-ld_classic`