---
editUrl: false
next: false
prev: false
title: "UnvalidatedInputFieldDeclaration"
---

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:27](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L27)

未验证输入字段声明接口，扩展了部分未验证输入字段声明和字段声明。

## 继承

- [`PartialUnvalidatedInputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedinputfielddeclaration/).[`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/)

## 属性

### arguments

> **arguments**: [`UnvalidatedFieldArgument`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedfieldargument/)[]

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:24](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L24)

未验证的字段参数数组。

#### 继承自

[`PartialUnvalidatedInputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedinputfielddeclaration/).[`arguments`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedinputfielddeclaration/#arguments)

***

### bindTarget?

> `optional` **bindTarget**: [`UnvalidatedBindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedbindtargetdeclaration/)

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:23](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L23)

可选的未验证绑定目标声明。

#### 继承自

[`PartialUnvalidatedInputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedinputfielddeclaration/).[`bindTarget`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedinputfielddeclaration/#bindtarget)

***

### declarationString?

> `optional` **declarationString**: `string`

定义位置: [packages/core/src/parsers/FieldDeclaration.ts:5](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/FieldDeclaration.ts#L5)

字段的声明字符串（可选）。

#### 继承自

[`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/).[`declarationString`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/#declarationstring)

***

### errorCollection

> **errorCollection**: `ErrorCollection`

定义位置: [packages/core/src/parsers/FieldDeclaration.ts:6](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/FieldDeclaration.ts#L6)

错误收集器，用于存储字段解析过程中的错误信息。

#### 继承自

[`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/).[`errorCollection`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/#errorcollection)

***

### inputFieldType?

> `optional` **inputFieldType**: `ParsingResultNode`

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:21](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L21)

可选的输入字段类型解析结果节点。

#### 继承自

[`PartialUnvalidatedInputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedinputfielddeclaration/).[`inputFieldType`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedinputfielddeclaration/#inputfieldtype)

***

### templateName?

> `optional` **templateName**: `ParsingResultNode`

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:22](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L22)

可选的模板名称解析结果节点。

#### 继承自

[`PartialUnvalidatedInputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedinputfielddeclaration/).[`templateName`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedinputfielddeclaration/#templatename)
