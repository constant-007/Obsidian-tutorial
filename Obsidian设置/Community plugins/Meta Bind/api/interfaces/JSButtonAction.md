---
editUrl: false
next: false
prev: false
title: "JSButtonAction"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:44](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L44)

JavaScript文件按钮动作接口，用于执行外部JavaScript文件。

## 属性

### args?

> `optional` **args**: [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)\<`string`, `unknown`\>

定义位置: [packages/core/src/config/ButtonConfig.ts:47](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L47)

可选的参数对象，传递给JavaScript文件。

***

### file

> **file**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:46](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L46)

要执行的JavaScript文件路径。

***

### type

> **type**: [`JS`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonactiontype/#js)

定义位置: [packages/core/src/config/ButtonConfig.ts:45](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L45)

按钮动作类型，固定为JS。
