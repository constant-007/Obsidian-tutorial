---
editUrl: false
next: false
prev: false
title: "CreateNoteButtonAction"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:87](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L87)

创建笔记按钮动作接口，用于创建新的笔记文件。

## 属性

### fileName

> **fileName**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:90](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L90)

要创建的笔记文件名。

***

### folderPath?

> `optional` **folderPath**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:89](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L89)

可选的文件夹路径，指定笔记创建位置。

***

### openIfAlreadyExists?

> `optional` **openIfAlreadyExists**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:92](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L92)

可选，如果笔记已存在是否打开现有笔记。

***

### openNote?

> `optional` **openNote**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:91](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L91)

可选，是否在创建后打开新笔记。

***

### type

> **type**: [`CREATE_NOTE`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonactiontype/#create_note)

定义位置: [packages/core/src/config/ButtonConfig.ts:88](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L88)

按钮动作类型，固定为CREATE_NOTE。
