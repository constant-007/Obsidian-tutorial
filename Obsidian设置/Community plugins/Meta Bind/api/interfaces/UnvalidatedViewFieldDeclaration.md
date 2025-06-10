---
editUrl: false
next: false
prev: false
title: "UnvalidatedViewFieldDeclaration"
---

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:21](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L21)

未验证视图字段声明接口，扩展了部分未验证视图字段声明和字段声明。

## 继承

- [`PartialUnvalidatedViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedviewfielddeclaration/).[`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/)

## 属性

### arguments

> **arguments**: [`UnvalidatedFieldArgument`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedfieldargument/)[]

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:26](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L26)

未验证的字段参数数组。

#### 继承自

[`PartialUnvalidatedViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedviewfielddeclaration/).[`arguments`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedviewfielddeclaration/#arguments)

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

### templateDeclaration?

> `optional` **templateDeclaration**: (`string` \| [`UnvalidatedBindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedbindtargetdeclaration/))[]

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:24](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L24)

可选的模板声明数组，包含字符串和未验证绑定目标声明。

#### 继承自

[`PartialUnvalidatedViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedviewfielddeclaration/).[`templateDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedviewfielddeclaration/#templatedeclaration)

***

### viewFieldType?

> `optional` **viewFieldType**: `ParsingResultNode`

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:25](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L25)

可选的视图字段类型解析结果节点。

#### 继承自

[`PartialUnvalidatedViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedviewfielddeclaration/).[`viewFieldType`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedviewfielddeclaration/#viewfieldtype)

***

### writeToBindTarget?

> `optional` **writeToBindTarget**: [`UnvalidatedBindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedbindtargetdeclaration/)

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:27](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L27)

可选的写入绑定目标，用于将视图字段的输出写入指定位置。

#### 继承自

[`PartialUnvalidatedViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedviewfielddeclaration/).[`writeToBindTarget`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedviewfielddeclaration/#writetobindtarget)
