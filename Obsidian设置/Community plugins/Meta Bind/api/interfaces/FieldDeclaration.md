---
editUrl: false
next: false
prev: false
title: "FieldDeclaration"
---

定义位置: [packages/core/src/parsers/FieldDeclaration.ts:4](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/FieldDeclaration.ts#L4)

字段声明接口，定义了字段的基本属性。

## 被扩展

- [`InputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/inputfielddeclaration/) - 输入字段声明
- [`UnvalidatedInputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedinputfielddeclaration/) - 未验证的输入字段声明
- [`ViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/viewfielddeclaration/) - 视图字段声明
- [`UnvalidatedViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedviewfielddeclaration/) - 未验证的视图字段声明
- [`JsViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/jsviewfielddeclaration/) - JavaScript视图字段声明
- [`UnvalidatedJsViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/unvalidatedjsviewfielddeclaration/) - 未验证的JavaScript视图字段声明

## 属性

### declarationString?

> `optional` **declarationString**: `string`

定义位置: [packages/core/src/parsers/FieldDeclaration.ts:5](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/FieldDeclaration.ts#L5)

字段的声明字符串（可选）

***

### errorCollection

> **errorCollection**: `ErrorCollection`

定义位置: [packages/core/src/parsers/FieldDeclaration.ts:6](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/FieldDeclaration.ts#L6)

错误收集器，用于存储字段解析过程中的错误信息
