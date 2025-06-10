---
editUrl: false
next: false
prev: false
title: "Mountable"
---

定义位置: [packages/core/src/utils/Mountable.ts:1](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L1)

可挂载基类，提供对象在 DOM 中挂载和卸载的基础功能。

## 扩展类

- [`FieldMountable`](/obsidian-meta-bind-plugin-docs/api/classes/fieldmountable/) - 字段挂载类

## 构造函数

### Constructor

> **new Mountable**(): `Mountable`

定义位置: [packages/core/src/utils/Mountable.ts:6](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L6)

#### 返回值

`Mountable`

## 方法

### getTargetEl()

> **getTargetEl**(): `undefined` \| [`HTMLElement`](https://developer.mozilla.org/docs/Web/API/HTMLElement)

定义位置: [packages/core/src/utils/Mountable.ts:22](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L22)

获取可挂载对象当前挂载到的元素。

#### 返回值

`undefined` \| [`HTMLElement`](https://developer.mozilla.org/docs/Web/API/HTMLElement) - 目标元素或 undefined

***

### isMounted()

> **isMounted**(): `boolean`

定义位置: [packages/core/src/utils/Mountable.ts:15](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L15)

检查可挂载对象是否当前已挂载。

#### 返回值

`boolean` - 如果已挂载返回 true，否则返回 false

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

***

### registerUnmountCb()

> **registerUnmountCb**(`cb`): `void`

定义位置: [packages/core/src/utils/Mountable.ts:91](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L91)

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

***

### unmount()

> **unmount**(): `void`

定义位置: [packages/core/src/utils/Mountable.ts:70](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/utils/Mountable.ts#L70)

卸载可挂载对象。
如果对象未挂载，将抛出错误。

#### 返回值

`void`
