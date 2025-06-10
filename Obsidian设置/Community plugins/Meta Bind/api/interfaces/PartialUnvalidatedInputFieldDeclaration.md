---
editUrl: false
next: false
prev: false
title: "PartialUnvalidatedInputFieldDeclaration"
---

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:20](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L20)

部分未验证输入字段声明接口，包含输入字段的基本配置属性。

## 被扩展

- [`UnvalidatedInputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedinputfielddeclaration/)

## 属性

### arguments

> **arguments**: [`UnvalidatedFieldArgument`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedfieldargument/)[]

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:24](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L24)

未验证的字段参数数组。

***

### bindTarget?

> `optional` **bindTarget**: [`UnvalidatedBindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedbindtargetdeclaration/)

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:23](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L23)

可选的未验证绑定目标声明。

***

### inputFieldType?

> `optional` **inputFieldType**: `ParsingResultNode`

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:21](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L21)

可选的输入字段类型解析结果节点。

***

### templateName?

> `optional` **templateName**: `ParsingResultNode`

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:22](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L22)

可选的模板名称解析结果节点。
