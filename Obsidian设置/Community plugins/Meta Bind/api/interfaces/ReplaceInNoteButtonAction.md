---
editUrl: false
next: false
prev: false
title: "ReplaceInNoteButtonAction"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:95](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L95)

替换笔记内容按钮动作接口，用于替换笔记中指定行范围的内容。

## 属性

### fromLine

> **fromLine**: `string` \| `number`

定义位置: [packages/core/src/config/ButtonConfig.ts:97](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L97)

替换开始行号，可以是数字或特殊字符串。

***

### replacement

> **replacement**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:99](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L99)

用于替换的新内容。

***

### templater?

> `optional` **templater**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:100](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L100)

可选，是否使用Templater处理替换内容。

***

### toLine

> **toLine**: `string` \| `number`

定义位置: [packages/core/src/config/ButtonConfig.ts:98](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L98)

替换结束行号，可以是数字或特殊字符串。

***

### type

> **type**: [`REPLACE_IN_NOTE`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonactiontype/#replace_in_note)

定义位置: [packages/core/src/config/ButtonConfig.ts:96](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L96)

按钮动作类型，固定为REPLACE_IN_NOTE。
