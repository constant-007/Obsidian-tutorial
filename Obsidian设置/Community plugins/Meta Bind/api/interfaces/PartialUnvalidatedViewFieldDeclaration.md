---
editUrl: false
next: false
prev: false
title: "PartialUnvalidatedViewFieldDeclaration"
---

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:23](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L23)

部分未验证视图字段声明接口，包含视图字段的基本配置属性。

## 被扩展

- [`UnvalidatedViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedviewfielddeclaration/)

## 属性

### arguments

> **arguments**: [`UnvalidatedFieldArgument`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedfieldargument/)[]

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:26](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L26)

未验证的字段参数数组。

***

### templateDeclaration?

> `optional` **templateDeclaration**: (`string` \| [`UnvalidatedBindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedbindtargetdeclaration/))[]

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:24](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L24)

可选的模板声明数组，包含字符串和未验证绑定目标声明。

***

### viewFieldType?

> `optional` **viewFieldType**: `ParsingResultNode`

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:25](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L25)

可选的视图字段类型解析结果节点。

***

### writeToBindTarget?

> `optional` **writeToBindTarget**: [`UnvalidatedBindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedbindtargetdeclaration/)

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:27](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L27)

可选的写入绑定目标，用于将视图字段的输出写入指定位置。
