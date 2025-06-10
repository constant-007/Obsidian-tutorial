---
editUrl: false
next: false
prev: false
title: "OpenButtonAction"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:50](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L50)

打开按钮动作接口，用于打开文件或URL链接。

## 属性

### link

> **link**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:52](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L52)

要打开的链接，可以是文件路径或URL。

***

### newTab?

> `optional` **newTab**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:53](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L53)

可选，是否在新标签页中打开链接。

***

### type

> **type**: [`OPEN`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonactiontype/#open)

定义位置: [packages/core/src/config/ButtonConfig.ts:51](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L51)

按钮动作类型，固定为OPEN。
