---
editUrl: false
next: false
prev: false
title: "SimpleViewFieldDeclaration"
---

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:30](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L30)

简单视图字段声明接口，定义视图字段的基本配置。

## 属性

### arguments?

> `optional` **arguments**: [`SimpleFieldArgument`](/obsidian-meta-bind-plugin-docs/api/interfaces/simplefieldargument/)[]

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:33](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L33)

可选的字段参数数组。

***

### templateDeclaration?

> `optional` **templateDeclaration**: (`string` \| [`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/))[]

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:32](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L32)

可选的模板声明数组，包含字符串和绑定目标声明。

***

### viewFieldType?

> `optional` **viewFieldType**: `string`

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:31](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L31)

可选的视图字段类型字符串。

***

### writeToBindTarget?

> `optional` **writeToBindTarget**: [`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:34](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L34)

可选的写入绑定目标，用于将输出写入指定位置。
