---
editUrl: false
next: false
prev: false
title: "SimpleJsViewFieldDeclaration"
---

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:67](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L67)

简单JavaScript视图字段声明接口，定义JavaScript视图字段的基本配置。

## 属性

### bindTargetMappings

> **bindTargetMappings**: [`SimpleJsViewFieldBindTargetMapping`](/obsidian-meta-bind-plugin-docs/api/interfaces/simplejsviewfieldbindtargetmapping/)[]

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:68](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L68)

绑定目标映射数组，定义JavaScript变量与绑定目标的映射关系。

***

### code

> **code**: `string`

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:71](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L71)

要执行的JavaScript代码字符串。

***

### hidden?

> `optional` **hidden**: `boolean`

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:70](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L70)

可选，是否隐藏视图字段。

***

### writeToBindTarget?

> `optional` **writeToBindTarget**: [`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

定义位置: [packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts:69](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/parsers/viewFieldParser/ViewFieldDeclaration.ts#L69)

可选的写入绑定目标，用于将计算结果写入指定位置。
