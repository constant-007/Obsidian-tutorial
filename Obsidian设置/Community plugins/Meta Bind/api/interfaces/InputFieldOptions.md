---
editUrl: false
next: false
prev: false
title: "InputFieldOptions"
---

定义位置: [packages/core/src/config/APIConfigs.ts:28](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/APIConfigs.ts#L28)

输入字段选项接口，定义输入字段的配置选项。

## 属性

### declaration

> **declaration**: `string` \| [`SimpleInputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/simpleinputfielddeclaration/)

定义位置: [packages/core/src/config/APIConfigs.ts:30](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/APIConfigs.ts#L30)

字段声明，可以是字符串形式或简单输入字段声明对象。

***

### renderChildType

> **renderChildType**: [`RenderChildType`](/obsidian-meta-bind-plugin-docs/api/enumerations/renderchildtype/)

定义位置: [packages/core/src/config/APIConfigs.ts:29](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/APIConfigs.ts#L29)

渲染子元素类型，指定字段的渲染方式。

***

### scope?

> `optional` **scope**: `BindTargetScope`

定义位置: [packages/core/src/config/APIConfigs.ts:31](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/APIConfigs.ts#L31)

可选的绑定目标作用域，限定字段绑定的作用范围。
