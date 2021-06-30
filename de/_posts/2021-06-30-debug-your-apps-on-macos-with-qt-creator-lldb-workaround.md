---
permalink: /blog/debug-your-apps-on-macos-with-qt-creator-lldb-workaround
layout: blog-post
title: "Debug your apps on macOS in Qt Creator (lldb workaround)"
tags: [ "dev"]
---

Many developers started complaining that lldb debugger shipped with latest XCode update (12.4) no longer works when trying to debug your app. It can be difficult to diagnose the issue because you only see "Debugger started" and "Debugger finished" message in Qt Creator. By using **View->Views->Debugger Log** you can actually locate the problem and see the "Not allowed to attach to process" error message. Basically lldb now requires your app to be signed with the **get-task-allow** entitlement which allows other processes (like the debugger) to attach to your app. Alternatively you can also disable system integrity protection ([SIP](https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection)) but it's highly unadvisable because as it would expose your PC to security risks.

What you should really do is to sign your app using the following command line:

`codesign --entitlements debuggee-entitlement.xml ...`

debuggee-entitlement.xml:

```

<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>com.apple.security.get-task-allow</key>
    <true/>
</dict>
</plist>

```

Signing with this entitlement must be done **only for the debug binary**, otherwise your app will be [rejected for notarization](https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution/resolving_common_notarization_issues?language=objc).