---
editUrl: false
next: false
prev: false
title: "UnvalidatedJsViewFieldDeclaration"
---

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:53](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L53)

未验证JavaScript视图字段声明接口，扩展了部分未验证JavaScript视图字段声明和字段声明。

## 继承

- [`PartialUnvalidatedJsViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedjsviewfielddeclaration/).[`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/)

## 属性

### bindTargetMappings

> **bindTargetMappings**: [`UnvalidatedJsViewFieldBindTargetMapping`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedjsviewfieldbindtargetmapping/)[]

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:56](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L56)

未验证的JavaScript视图字段绑定目标映射数组。

#### 继承自

[`PartialUnvalidatedJsViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedjsviewfielddeclaration/).[`bindTargetMappings`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedjsviewfielddeclaration/#bindtargetmappings)

***

### code

> **code**: `string`

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:59](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L59)

JavaScript代码字符串。

#### 继承自

[`PartialUnvalidatedJsViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedjsviewfielddeclaration/).[`code`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedjsviewfielddeclaration/#code)

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

### hidden

> **hidden**: `boolean`

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:58](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L58)

布尔值，指示字段是否为隐藏状态。

#### 继承自

[`PartialUnvalidatedJsViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedjsviewfielddeclaration/).[`hidden`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedjsviewfielddeclaration/#hidden)

***

### writeToBindTarget?

> `optional` **writeToBindTarget**: [`UnvalidatedBindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedbindtargetdeclaration/)

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:57](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L57)

可选的写入绑定目标，用于将JavaScript视图字段的输出写入指定位置。

#### 继承自

[`PartialUnvalidatedJsViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedjsviewfielddeclaration/).[`writeToBindTarget`](/obsidian-meta-bind-plugin-docs/api/interfaces/partialunvalidatedjsviewfielddeclaration/#writetobindtarget)
