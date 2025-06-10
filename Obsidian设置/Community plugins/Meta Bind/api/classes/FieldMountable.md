---
editUrl: false
next: false
prev: false
title: "FieldMountable"
---

定义位置: [packages/core/src/fields/FieldMountable.ts:4](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/fields/FieldMountable.ts#L4)

字段挂载类，继承自 Mountable，用于管理字段在 DOM 中的挂载和卸载。

## 继承

- [`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/) - 基础挂载类

## 构造函数

### Constructor

> **new FieldMountable**(`mb`, `uuid`, `filePath`): `FieldMountable`

定义位置: [packages/core/src/fields/FieldMountable.ts:9](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/fields/FieldMountable.ts#L9)

#### 参数

<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>描述</th>
</tr>
</thead>
<tbody>
<tr>
<td>

`mb`

</td>
<td>

`MetaBind`

</td>
<td>

Meta Bind 实例

</td>
</tr>
<tr>
<td>

`uuid`

</td>
<td>

`string`

</td>
<td>

字段的唯一标识符

</td>
</tr>
<tr>
<td>

`filePath`

</td>
<td>

`string`

</td>
<td>

字段所在的文件路径

</td>
</tr>
</tbody>
</table>

#### 返回值

`FieldMountable`

#### 重写

[`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/).[`constructor`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/#constructor)

## 属性

### mb

> `readonly` **mb**: `MetaBind`

定义位置: [packages/core/src/fields/FieldMountable.ts:5](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/fields/FieldMountable.ts#L5)

Meta Bind 实例的只读引用

## 方法

### getFilePath()

> **getFilePath**(): `string`

定义位置: [packages/core/src/fields/FieldMountable.ts:21](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/fields/FieldMountable.ts#L21)

获取字段所在的文件路径。

#### 返回值

`string` - 文件路径

***

### getTargetEl()

> **getTargetEl**(): `undefined` \| [`HTMLElement`](https://developer.mozilla.org/docs/Web/API/HTMLElement)

定义位置: [packages/core/src/utils/Mountable.ts:22](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L22)

获取可挂载对象当前挂载到的元素。

#### 返回值

`undefined` \| [`HTMLElement`](https://developer.mozilla.org/docs/Web/API/HTMLElement) - 目标元素或 undefined

#### 继承自

[`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/).[`getTargetEl`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/#gettargetel)

***

### getUuid()

> **getUuid**(): `string`

定义位置: [packages/core/src/fields/FieldMountable.ts:17](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/fields/FieldMountable.ts#L17)

获取字段的唯一标识符。

#### 返回值

`string` - 字段的 UUID

***

### isMounted()

> **isMounted**(): `boolean`

定义位置: [packages/core/src/utils/Mountable.ts:15](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L15)

检查可挂载对象是否当前已挂载。

#### 返回值

`boolean` - 如果已挂载返回 true，否则返回 false

#### 继承自

[`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/).[`isMounted`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/#ismounted)

***

### mount()

> **mount**(`targetEl`): `void`

定义位置: [packages/core/src/utils/Mountable.ts:50](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L50)

将可挂载对象挂载到指定元素。
如果可挂载对象已经挂载，将抛出错误。

#### 参数

<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>描述</th>
</tr>
</thead>
<tbody>
<tr>
<td>

`targetEl`

</td>
<td>

[`HTMLElement`](https://developer.mozilla.org/docs/Web/API/HTMLElement)

</td>
<td>

目标挂载元素

</td>
</tr>
</tbody>
</table>

#### 返回值

`void`

#### 继承自

[`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/).[`mount`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/#mount)

***

### registerUnmountCb()

> **registerUnmountCb**(`cb`): `void`

定义位置: [packages/core/src/utils/Mountable.ts:29](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L29)

注册卸载回调函数，在对象卸载时执行。

#### 参数

<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>描述</th>
</tr>
</thead>
<tbody>
<tr>
<td>

`cb`

</td>
<td>

() => `void`

</td>
<td>

卸载时执行的回调函数

</td>
</tr>
</tbody>
</table>

#### 返回值

`void`

#### 继承自

[`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/).[`registerUnmountCb`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/#registerunmountcb)

***

### unmount()

> **unmount**(): `void`

定义位置: [packages/core/src/utils/Mountable.ts:74](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L74)

卸载可挂载对象。
如果对象未挂载，将抛出错误。

#### 返回值

`void`

#### 继承自

[`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/).[`unmount`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/#unmount)
