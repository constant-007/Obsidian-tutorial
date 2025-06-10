---
editUrl: false
next: false
prev: false
title: "UpdateMetadataButtonAction"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:80](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L80)

更新元数据按钮动作接口，用于修改笔记的元数据。

## 属性

### bindTarget

> **bindTarget**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:82](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L82)

要更新的绑定目标字符串。

***

### evaluate

> **evaluate**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:83](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L83)

是否将值作为JavaScript表达式进行计算。

***

### type

> **type**: [`UPDATE_METADATA`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonactiontype/#update_metadata)

定义位置: [packages/core/src/config/ButtonConfig.ts:81](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L81)

按钮动作类型，固定为UPDATE_METADATA。

***

### value

> **value**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:84](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L84)

要设置的值或JavaScript表达式。
