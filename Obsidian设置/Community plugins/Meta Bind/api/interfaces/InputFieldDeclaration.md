---
editUrl: false
next: false
prev: false
title: "InputFieldDeclaration"
---

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:14](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L14)

输入字段声明接口，定义了输入字段的结构和属性。

## 继承

- [`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/)

## 属性

### argumentContainer

> **argumentContainer**: `InputFieldArgumentContainer`

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:17](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L17)

输入字段参数容器，包含字段的配置参数。

***

### bindTarget

> **bindTarget**: `undefined` \| [`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:16](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L16)

绑定目标声明，指定字段绑定的数据位置。

***

### declarationString?

> `optional` **declarationString**: `string`

定义位置: [packages/core/src/parsers/FieldDeclaration.ts:5](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/FieldDeclaration.ts#L5)

声明字符串，字段的原始声明文本。

#### 继承自

[`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/).[`declarationString`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/#declarationstring)

***

### errorCollection

> **errorCollection**: `ErrorCollection`

定义位置: [packages/core/src/parsers/FieldDeclaration.ts:6](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/FieldDeclaration.ts#L6)

错误集合，收集解析过程中的错误信息。

#### 继承自

[`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/).[`errorCollection`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/#errorcollection)

***

### inputFieldType

> **inputFieldType**: [`InputFieldType`](/obsidian-meta-bind-plugin-docs/api/enumerations/inputfieldtype/)

定义位置: [packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts:15](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/inputFieldParser/InputFieldDeclaration.ts#L15)

输入字段类型，指定字段的具体类型。
