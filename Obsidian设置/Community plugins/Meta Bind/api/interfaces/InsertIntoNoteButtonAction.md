---
editUrl: false
next: false
prev: false
title: "InsertIntoNoteButtonAction"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:116](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L116)

插入到笔记按钮动作接口，用于在笔记的指定行插入内容。

## 属性

### line

> **line**: `string` \| `number`

定义位置: [packages/core/src/config/ButtonConfig.ts:118](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L118)

要插入内容的行号，可以是数字或特殊字符串（如"end"）。

***

### templater?

> `optional` **templater**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:120](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L120)

可选，是否使用Templater处理插入的内容。

***

### type

> **type**: [`INSERT_INTO_NOTE`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonactiontype/#insert_into_note)

定义位置: [packages/core/src/config/ButtonConfig.ts:117](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L117)

按钮动作类型，固定为INSERT_INTO_NOTE。

***

### value

> **value**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:119](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L119)

要插入的内容。
