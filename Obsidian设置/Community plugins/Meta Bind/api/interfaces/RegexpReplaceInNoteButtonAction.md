---
editUrl: false
next: false
prev: false
title: "RegexpReplaceInNoteButtonAction"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:109](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L109)

正则表达式替换笔记内容按钮动作接口，用于使用正则表达式替换笔记中的内容。

## 属性

### regexp

> **regexp**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:111](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L111)

用于匹配的正则表达式模式。

***

### regexpFlags?

> `optional` **regexpFlags**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:112](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L112)

可选的正则表达式标志（如"g"、"i"、"m"等）。

***

### replacement

> **replacement**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:113](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L113)

用于替换匹配内容的字符串。

***

### type

> **type**: [`REGEXP_REPLACE_IN_NOTE`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonactiontype/#regexp_replace_in_note)

定义位置: [packages/core/src/config/ButtonConfig.ts:110](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L110)

按钮动作类型，固定为REGEXP_REPLACE_IN_NOTE。
