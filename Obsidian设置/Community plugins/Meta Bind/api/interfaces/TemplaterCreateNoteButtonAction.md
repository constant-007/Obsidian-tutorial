---
editUrl: false
next: false
prev: false
title: "TemplaterCreateNoteButtonAction"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:66](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L66)

Templater创建笔记按钮动作接口，用于通过Templater模板创建新笔记。

## 属性

### fileName?

> `optional` **fileName**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:70](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L70)

可选的新笔记文件名。

***

### folderPath?

> `optional` **folderPath**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:69](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L69)

可选的文件夹路径，指定笔记创建位置。

***

### openIfAlreadyExists?

> `optional` **openIfAlreadyExists**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:72](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L72)

可选，如果笔记已存在是否打开现有笔记。

***

### openNote?

> `optional` **openNote**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:71](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L71)

可选，是否在创建后打开新笔记。

***

### templateFile

> **templateFile**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:68](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L68)

要使用的Templater模板文件路径。

***

### type

> **type**: [`TEMPLATER_CREATE_NOTE`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonactiontype/#templater_create_note)

定义位置: [packages/core/src/config/ButtonConfig.ts:67](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L67)

按钮动作类型，固定为TEMPLATER_CREATE_NOTE。
