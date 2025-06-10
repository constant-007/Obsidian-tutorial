---
editUrl: false
next: false
prev: false
title: "PartialUnvalidatedJsViewFieldDeclaration"
---

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:55](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L55)

部分未验证JavaScript视图字段声明接口，包含JavaScript视图字段的基本配置属性。

## 被扩展

- [`UnvalidatedJsViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedjsviewfielddeclaration/)

## 属性

### bindTargetMappings

> **bindTargetMappings**: [`UnvalidatedJsViewFieldBindTargetMapping`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedjsviewfieldbindtargetmapping/)[]

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:56](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L56)

未验证的JavaScript视图字段绑定目标映射数组。

***

### code

> **code**: `string`

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:59](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L59)

JavaScript代码字符串。

***

### hidden

> **hidden**: `boolean`

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:58](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L58)

布尔值，指示字段是否为隐藏状态。

***

### writeToBindTarget?

> `optional` **writeToBindTarget**: [`UnvalidatedBindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedbindtargetdeclaration/)

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:57](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L57)

可选的写入绑定目标，用于将JavaScript视图字段的输出写入指定位置。
