---
editUrl: false
next: false
prev: false
title: "ViewFieldOptions"
---

定义位置: [packages/core/src/config/APIConfigs.ts:34](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/APIConfigs.ts#L34)

视图字段选项接口，定义视图字段的配置选项。

## 属性

### declaration

> **declaration**: `string` \| [`SimpleViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/simpleviewfielddeclaration/)

定义位置: [packages/core/src/config/APIConfigs.ts:36](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/APIConfigs.ts#L36)

字段声明，可以是字符串形式或简单视图字段声明对象。

***

### renderChildType

> **renderChildType**: [`RenderChildType`](/obsidian-meta-bind-plugin-docs/api/enumerations/renderchildtype/)

定义位置: [packages/core/src/config/APIConfigs.ts:35](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/APIConfigs.ts#L35)

渲染子元素类型，指定字段的渲染方式。

***

### scope?

> `optional` **scope**: `BindTargetScope`

定义位置: [packages/core/src/config/APIConfigs.ts:37](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/APIConfigs.ts#L37)

可选的绑定目标作用域，限定字段绑定的作用范围。
