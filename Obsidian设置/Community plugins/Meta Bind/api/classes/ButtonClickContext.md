---
editUrl: false
next: false
prev: false
title: "ButtonClickContext"
---

定义位置: [packages/core/src/config/ButtonConfig.ts:210](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L210)

提供关于按钮点击事件的信息。

## 构造函数

### Constructor

> **new ButtonClickContext**(`type`, `shiftKey`, `ctrlKey`, `altKey`): `ButtonClickContext`

定义位置: [packages/core/src/config/ButtonConfig.ts:216](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L216)

#### 参数

<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
</tr>
</thead>
<tbody>
<tr>
<td>

`type`

</td>
<td>

[`ButtonClickType`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonclicktype/)

</td>
</tr>
<tr>
<td>

`shiftKey`

</td>
<td>

`boolean`

</td>
</tr>
<tr>
<td>

`ctrlKey`

</td>
<td>

`boolean`

</td>
</tr>
<tr>
<td>

`altKey`

</td>
<td>

`boolean`

</td>
</tr>
</tbody>
</table>

#### 返回

`ButtonClickContext`

## 属性

### altKey

> **altKey**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:214](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L214)

***

### ctrlKey

> **ctrlKey**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:213](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L213)

***

### shiftKey

> **shiftKey**: `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:212](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L212)

***

### type

> **type**: [`ButtonClickType`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonclicktype/)

定义位置: [packages/core/src/config/ButtonConfig.ts:211](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L211)

## 方法

### openInNewTab()

> **openInNewTab**(): `boolean`

定义位置: [packages/core/src/config/ButtonConfig.ts:233](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L233)

点击是否应该导致链接在新标签页中打开。
仅在点击链接时适用。

#### 返回

`boolean`

***

### fromMouseEvent()

> `static` **fromMouseEvent**(`event`, `type`): `ButtonClickContext`

定义位置: [packages/core/src/config/ButtonConfig.ts:223](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/config/ButtonConfig.ts#L223)

#### 参数

<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
</tr>
</thead>
<tbody>
<tr>
<td>

`event`

</td>
<td>

[`MouseEvent`](https://developer.mozilla.org/docs/Web/API/MouseEvent)

</td>
</tr>
<tr>
<td>

`type`

</td>
<td>

[`ButtonClickType`](/obsidian-meta-bind-plugin-docs/api/enumerations/buttonclicktype/)

</td>
</tr>
</tbody>
</table>

#### 返回

`ButtonClickContext`
