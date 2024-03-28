---
permalink: /blog/revert-unread-badge-to-number-in-parentheses-thunderbird-115-supernova
layout: blog-post
title: Revert Unread "Badge" to Number in Parentheses in Thunderbird 115 (Supernova)
tags: [ "tech"]
---

The recent Thundebird upgrade brought unpleasant (for some) change of unread messages counter. The simple fix provided below reverts this to what it was before.

<p class="text-center">
    <img src="/assets/images/blog/thunderbird-unread-fix.png">
    <span class="font-xs">Before and after the fix</span>
</p>

<!--more-->

### 1. Enable userChrome.css support in Thunderbird

By default userChrome.css usage is disabled in Thunderbird. To enable it you need to set **toolkit.legacyUserProfileCustomizations.stylesheets** to true on in the [Config Editor](https://support.mozilla.org/en-US/kb/config-editor).

### 2. Put this CSS code to chrome/userChrome.css in your profile folder

```CSS

/* This code reverts Mozilla Thunderbird unread badges to numbers in parentheses like it was before SuperNova 115 */

.name {
  flex: inherit !important;
  margin-right: 4px !important;
}

.folder-count-badge.unread-count {
  color: inherit !important;
  font-size: inherit !important;
  padding: 0 !important;
  min-width: 0 !important;
}

.folder-count-badge.unread-count:before {
    content: '(';
}

.folder-count-badge.unread-count:after {
    content: ')';
}

.unread > .container > .unread-count
{
  background-color: inherit !important;
}

/* total */

.folder-count-badge.total-count {
  flex: 1;
  text-align: right !important;
  background-color: inherit !important;
  padding: 0 !important;
  margin-inline-end: 0 !important;
}

```

### 3. Restart Thunderbird