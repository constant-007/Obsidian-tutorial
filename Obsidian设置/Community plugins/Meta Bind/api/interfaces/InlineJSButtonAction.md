---
editUrl: false
next: false
prev: false
title: "InlineJSButtonAction"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:123](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L123)

内联JavaScript按钮动作接口，用于执行内联JavaScript代码。

## 属性

### args?

> `optional` **args**: [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)\<`string`, `unknown`\>

定义位置: [packages/core/src/config/ButtonConfig.ts:126](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L126)

可选的参数对象，传递给JavaScript代码。

***

### code

> **code**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:125](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L125)

要执行的JavaScript代码字符串。

***

### type

> **type**: [`INLINE_JS`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonactiontype/#inline_js)

定义位置: [packages/core/src/config/ButtonConfig.ts:124](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L124)

按钮动作类型，固定为INLINE_JS。
