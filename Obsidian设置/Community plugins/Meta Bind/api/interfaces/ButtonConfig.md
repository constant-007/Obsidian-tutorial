---
editUrl: false
next: false
prev: false
title: "ButtonConfig"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:151](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L151)

## 属性

### action?

> `optional` **action**: [`ButtonAction`](/obsidian-meta-bind-plugin-docs/api/type-aliases/buttonaction/)

定义位置: [packages/core/src/config/ButtonConfig.ts:193](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L193)

按钮被点击时要运行的单个动作
与 `actions` 属性互斥

***

### actions?

> `optional` **actions**: [`ButtonAction`](/obsidian-meta-bind-plugin-docs/api/type-aliases/buttonaction/)[]

定义位置: [packages/core/src/config/ButtonConfig.ts:198](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L198)

按钮被点击时要运行的多个动作
与 `action` 属性互斥

***

### backgroundImage?

> `optional` **backgroundImage**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:176](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L176)

可选的背景图片添加到按钮上，
由于无法通过纯 CSS 从库中加载图片，因此需要此属性

***

### class?

> `optional` **class**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:167](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L167)

可选的 CSS 类名添加到按钮上

***

### cssStyle?

> `optional` **cssStyle**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:171](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L171)

可选的 CSS 样式添加到按钮上

***

### hidden?

> `optional` **hidden**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:188](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L188)

按钮是否隐藏

***

### icon?

> `optional` **icon**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:159](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L159)

可选的图标显示在标签前面

***

### id?

> `optional` **id**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:184](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L184)

可选的 ID，用于内联按钮

***

### label

> **label**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:155](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L155)

显示在按钮上的文本

***

### style

> **style**: [`ButtonStyleType`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonstyletype/)

定义位置: [packages/core/src/config/ButtonConfig.ts:163](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L163)

按钮的样式

***

### tooltip?

> `optional` **tooltip**: `string`

定义位置: [packages/core/src/config/ButtonConfig.ts:180](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L180)

鼠标悬停在按钮上时显示的可选工具提示
