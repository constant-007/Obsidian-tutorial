---
editUrl: false
next: false
prev: false
title: "ViewFieldDeclaration"
---

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:14](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L14)

视图字段声明接口，扩展了基础字段声明，用于定义视图字段的属性和行为。

## 继承

- [`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/) - 基础字段声明

## 属性

### argumentContainer

> **argumentContainer**: `ViewFieldArgumentContainer`

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:17](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L17)

视图字段参数容器，包含字段的配置参数

***

### declarationString?

> `optional` **declarationString**: `string`

定义位置: [packages/core/src/parsers/FieldDeclaration.ts:5](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/FieldDeclaration.ts#L5)

字段的声明字符串（可选）

#### 继承自

[`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/).[`declarationString`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/#declarationstring)

***

### errorCollection

> **errorCollection**: `ErrorCollection`

定义位置: [packages/core/src/parsers/FieldDeclaration.ts:6](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/FieldDeclaration.ts#L6)

错误收集器，用于存储字段解析过程中的错误信息

#### 继承自

[`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/).[`errorCollection`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/#errorcollection)

***

### templateDeclaration

> **templateDeclaration**: (`string` \| [`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/))[]

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:15](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L15)

模板声明数组，包含字符串和绑定目标声明的组合

***

### viewFieldType

> **viewFieldType**: [`ViewFieldType`](/obsidian-meta-bind-plugin-docs/api/enumerations/viewfieldtype/)

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:16](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L16)

视图字段类型，指定字段的显示方式

***

### writeToBindTarget?

> `optional` **writeToBindTarget**: [`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:18](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L18)

可选的写入绑定目标，用于将视图字段的输出写入指定位置
