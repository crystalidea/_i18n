---
permalink: /blog/revert-unread-badge-to-number-in-parentheses-thunderbird
layout: blog-post
title: Как вернуть в Thunderbird число непрочитанных в скобках вместо «бейджа»
tags: [ "tech"]
---

<p class="font-gray font-xs text-right">Последнее обновление: 19 августа 2026 г.</p>

В Thunderbird 115 (Supernova) привычный счётчик непрочитанных сообщений в панели папок заменили цветным бейджем. Если прежний вид **Входящие (3)** нравился больше, вот как его вернуть — теперь это делается дополнением в один щелчок, а не ручной правкой CSS.

<p class="text-center">
    <img src="/assets/images/blog/thunderbird-unread-fix.png">
    <span class="font-xs">До и после исправления</span>
</p>

<!--more-->

### Установка дополнения Classic Folder Counts

Теперь исправление оформлено в виде небольшого дополнения для Thunderbird, так что править вручную ничего не нужно:

1. Скачайте файл `.xpi` со [страницы релизов](https://github.com/crystalidea/thunderbird-classic-folder-counts/releases/latest).
2. В Thunderbird откройте **Дополнения и темы**, нажмите значок шестерёнки, выберите **Установить дополнение из файла…** и укажите скачанный файл.

Счётчики меняются сразу — перезапуск не требуется. Менять что-либо в `about:config` тоже не нужно: Thunderbird устанавливает дополнение как есть. Оно работает во всех версиях начиная со 115 (Supernova).

### Что можно настроить

В настройках дополнения есть два флажка:

- **число непрочитанных в скобках** вместо бейджа;
- **общее число сообщений обычным текстом по правому краю** — видно, только если в меню панели папок включено отображение общего числа сообщений.

Оба применяются мгновенно, а один щелчок в разделе «Дополнения и темы» снова всё отключает.

Исходный код опубликован на [GitHub](https://github.com/crystalidea/thunderbird-classic-folder-counts). Никакой магии внутри нет: это та же таблица стилей, что и ниже; она регистрируется так же, как Thunderbird регистрирует `userChrome.css`, и удаляется обратно при отключении дополнения.

### Почему дополнение, а не userChrome.css

- не нужен флаг **toolkit.legacyUserProfileCustomizations.stylesheets** и не нужно искать папку профиля;
- изменения применяются без перезапуска Thunderbird;
- отключение — это один щелчок, а не правка файла;
- дополнение обновляется вслед за Thunderbird, а скопированный вручную фрагмент тихо устаревает — CSS ниже уже дважды разошёлся с реальностью, см. примечание в конце.

### Старый способ через userChrome.css

**Устарел, но всё ещё работает.** Подойдёт, если не хочется ничего устанавливать.

**1. Включите поддержку userChrome.css в Thunderbird.** По умолчанию использование userChrome.css в Thunderbird отключено. Чтобы включить его, задайте параметру **toolkit.legacyUserProfileCustomizations.stylesheets** значение true в [Редакторе настроек](https://support.mozilla.org/ru/kb/config-editor).

**2. Поместите этот CSS-код в chrome/userChrome.css в папке профиля:**

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

**3. Перезапустите Thunderbird.**

В Thunderbird 148 и новее две детали этого фрагмента разошлись с реальностью, и обе стоит добавить в правило `.folder-count-badge.unread-count`:

- в собственных правилах Thunderbird для бейджа `min-width` сменился на `min-inline-size`, поэтому `min-width: 0` больше не сжимает счётчик — добавьте `min-inline-size: 0 !important;`
- у свёрнутой папки, во вложенных папках которой есть непрочитанные сообщения, вокруг числа остаётся тонкий овальный контур, потому что границу ничто не сбрасывает — добавьте `border: none !important;`

В дополнении обе детали уже учтены.
