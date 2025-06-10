---
editUrl: false
next: false
prev: false
title: "ObsAPI"
---

定义位置: [packages/obsidian/src/ObsAPI.ts:38](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/obsidian/src/ObsAPI.ts#L38)

用于 Obsidian 的 Meta Bind API。

## 继承

- `API`\<`ObsComponents`\>

## 构造函数

### Constructor

> **new ObsAPI**(`mb`): `ObsAPI`

定义位置: [packages/obsidian/src/ObsAPI.ts:42](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/obsidian/src/ObsAPI.ts#L42)

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

`mb`

</td>
<td>

`ObsMetaBind`

</td>
</tr>
</tbody>
</table>

#### 返回值

`ObsAPI`

#### 重写

`API<ObsComponents>.constructor`

## 属性

### mb

> `readonly` **mb**: `MetaBind`\<`ObsComponents`\>

定义位置: [packages/core/src/api/API.ts:63](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L63)

#### 继承自

`API.mb`

## 方法

### constructMDRCWidget()

> **constructMDRCWidget**(`inlineFieldType`, `content`, `filePath`, `component`): `MarkdownRenderChildWidget`

定义位置: [packages/obsidian/src/ObsAPI.ts:88](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/obsidian/src/ObsAPI.ts#L88)

从给定的小组件类型创建 CM6 小组件。

这仅对在 CodeMirror 插件中使用有用。

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

`inlineFieldType`

</td>
<td>

[`InlineFieldType`](/obsidian-meta-bind-plugin-docs/api/type-aliases/inlinefieldtype/)

</td>
<td>

内联字段类型

</td>
</tr>
<tr>
<td>

`content`

</td>
<td>

`string`

</td>
<td>

内容

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

文件路径

</td>
</tr>
<tr>
<td>

`component`

</td>
<td>

`Component`

</td>
<td>

组件

</td>
</tr>
</tbody>
</table>

#### 返回值

`MarkdownRenderChildWidget`

***

### createBindTarget()

> **createBindTarget**(`storageType`, `storagePath`, `property`, `listenToChildren`): [`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

定义位置: [packages/core/src/api/API.ts:591](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L591)

创建绑定目标声明。

#### 参数

<table>
<thead>
<tr>
<th>参数</th>
<th>类型</th>
<th>默认值</th>
<th>描述</th>
</tr>
</thead>
<tbody>
<tr>
<td>

`storageType`

</td>
<td>

`string`

</td>
<td>

`undefined`

</td>
<td>

存储类型（有时也称为元数据源）

</td>
</tr>
<tr>
<td>

`storagePath`

</td>
<td>

`string`

</td>
<td>

`undefined`

</td>
<td>

存储路径

</td>
</tr>
<tr>
<td>

`property`

</td>
<td>

`string`

</td>
<td>

`undefined`

</td>
<td>

属性名

</td>
</tr>
<tr>
<td>

`listenToChildren`

</td>
<td>

`boolean`

</td>
<td>

`false`

</td>
<td>

是否监听子元素变化

</td>
</tr>
</tbody>
</table>

#### 返回值

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

#### 继承自

`API.createBindTarget`

***

### createButton()

> **createButton**(`config`, `filePath`, `position`?): [`FieldMountable`](/obsidian-meta-bind-plugin-docs/api/classes/fieldmountable/)

定义位置: [packages/core/src/api/API.ts:405](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L405)

创建按钮。

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

`config`

</td>
<td>

[`ButtonConfig`](/obsidian-meta-bind-plugin-docs/api/interfaces/buttonconfig/)

</td>
<td>

按钮配置

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

文件路径

</td>
</tr>
<tr>
<td>

`position`?

</td>
<td>

[`NotePosition`](/obsidian-meta-bind-plugin-docs/api/classes/noteposition/)

</td>
<td>

位置（可选）

</td>
</tr>
</tbody>
</table>

#### 返回值

[`FieldMountable`](/obsidian-meta-bind-plugin-docs/api/classes/fieldmountable/)

#### 继承自

`API.createButton`

***

### createButtonGroup()

> **createButtonGroup**(`configs`, `options`, `filePath`, `position`?): [`FieldMountable`](/obsidian-meta-bind-plugin-docs/api/classes/fieldmountable/)

定义位置: [packages/core/src/api/API.ts:415](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L415)

创建按钮组。

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

`configs`

</td>
<td>

[`ButtonConfig`](/obsidian-meta-bind-plugin-docs/api/interfaces/buttonconfig/)[]

</td>
<td>

按钮配置数组

</td>
</tr>
<tr>
<td>

`options`

</td>
<td>

[`ButtonGroupOptions`](/obsidian-meta-bind-plugin-docs/api/interfaces/buttongroupoptions/)

</td>
<td>

按钮组选项

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

文件路径

</td>
</tr>
<tr>
<td>

`position`?

</td>
<td>

[`NotePosition`](/obsidian-meta-bind-plugin-docs/api/classes/noteposition/)

</td>
<td>

位置（可选）

</td>
</tr>
</tbody>
</table>

#### 返回值

[`FieldMountable`](/obsidian-meta-bind-plugin-docs/api/classes/fieldmountable/)

#### 继承自

`API.createButtonGroup`

***

### createExcludeBindTarget()

> **createExcludeBindTarget**(`bindTarget`, ...`properties`): [`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

定义位置: [packages/core/src/api/API.ts:602](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L602)

创建排除绑定目标声明。

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

`bindTarget`

</td>
<td>

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

</td>
<td>

基础绑定目标

</td>
</tr>
<tr>
<td>

...`properties`

</td>
<td>

`string`[]

</td>
<td>

要排除的属性

</td>
</tr>
</tbody>
</table>

#### 返回值

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

#### 继承自

`API.createExcludeBindTarget`

***

### createField()

> **createField**(`field`, `bindTarget`, `filePath`, `position`?): [`FieldMountable`](/obsidian-meta-bind-plugin-docs/api/classes/fieldmountable/)

定义位置: [packages/core/src/api/API.ts:347](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L347)

创建字段。

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

`field`

</td>
<td>

[`FieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/fielddeclaration/)

</td>
<td>

字段声明

</td>
</tr>
<tr>
<td>

`bindTarget`

</td>
<td>

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

</td>
<td>

绑定目标

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

文件路径

</td>
</tr>
<tr>
<td>

`position`?

</td>
<td>

[`NotePosition`](/obsidian-meta-bind-plugin-docs/api/classes/noteposition/)

</td>
<td>

位置（可选）

</td>
</tr>
</tbody>
</table>

#### 返回值

[`FieldMountable`](/obsidian-meta-bind-plugin-docs/api/classes/fieldmountable/)

#### 继承自

`API.createField`

***

### createFieldArgument()

> **createFieldArgument**(`name`, `value`): [`SimpleFieldArgument`](/obsidian-meta-bind-plugin-docs/api/interfaces/simplefieldargument/)

定义位置: [packages/core/src/api/API.ts:670](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L670)

创建字段参数。

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

`name`

</td>
<td>

`string`

</td>
<td>

参数名

</td>
</tr>
<tr>
<td>

`value`

</td>
<td>

`unknown`

</td>
<td>

参数值

</td>
</tr>
</tbody>
</table>

#### 返回值

[`SimpleFieldArgument`](/obsidian-meta-bind-plugin-docs/api/interfaces/simplefieldargument/)

#### 继承自

`API.createFieldArgument`

***

### createIncludeBindTarget()

> **createIncludeBindTarget**(`bindTarget`, ...`properties`): [`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

定义位置: [packages/core/src/api/API.ts:613](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L613)

创建包含绑定目标声明。

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

`bindTarget`

</td>
<td>

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

</td>
<td>

基础绑定目标

</td>
</tr>
<tr>
<td>

...`properties`

</td>
<td>

`string`[]

</td>
<td>

要包含的属性

</td>
</tr>
</tbody>
</table>

#### 返回值

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

#### 继承自

`API.createIncludeBindTarget`

***

### createInputFieldDeclaration()

> **createInputFieldDeclaration**(`inputFieldType`, ...`args`): [`SimpleInputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/simpleinputfielddeclaration/)

定义位置: [packages/core/src/api/API.ts:624](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L624)

创建输入字段声明。

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

`inputFieldType`

</td>
<td>

[`InputFieldType`](/obsidian-meta-bind-plugin-docs/api/enumerations/inputfieldtype/)

</td>
<td>

输入字段类型

</td>
</tr>
<tr>
<td>

...`args`

</td>
<td>

[`SimpleFieldArgument`](/obsidian-meta-bind-plugin-docs/api/interfaces/simplefieldargument/)[]

</td>
<td>

字段参数

</td>
</tr>
</tbody>
</table>

#### 返回值

[`SimpleInputFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/simpleinputfielddeclaration/)

#### 继承自

`API.createInputFieldDeclaration`

***

### createJsViewFieldDeclaration()

> **createJsViewFieldDeclaration**(`code`, `bindTarget`?, ...`args`): [`SimpleJsViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/simplejsviewfielddeclaration/)

定义位置: [packages/core/src/api/API.ts:656](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L656)

创建 JavaScript 视图字段声明。

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

`code`

</td>
<td>

`string`

</td>
<td>

JavaScript 代码

</td>
</tr>
<tr>
<td>

`bindTarget`?

</td>
<td>

[`SimpleJsViewFieldBindTargetMapping`](/obsidian-meta-bind-plugin-docs/api/interfaces/simplejsviewfieldbindtargetmapping/)

</td>
<td>

绑定目标映射（可选）

</td>
</tr>
<tr>
<td>

...`args`

</td>
<td>

[`SimpleFieldArgument`](/obsidian-meta-bind-plugin-docs/api/interfaces/simplefieldargument/)[]

</td>
<td>

字段参数

</td>
</tr>
</tbody>
</table>

#### 返回值

[`SimpleJsViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/simplejsviewfielddeclaration/)

#### 继承自

`API.createJsViewFieldDeclaration`

***

### createViewFieldDeclaration()

> **createViewFieldDeclaration**(`viewFieldType`, ...`args`): [`SimpleViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/simpleviewfielddeclaration/)

定义位置: [packages/core/src/api/API.ts:635](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L635)

创建视图字段声明。

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

`viewFieldType`

</td>
<td>

[`ViewFieldType`](/obsidian-meta-bind-plugin-docs/api/enumerations/viewfieldtype/)

</td>
<td>

视图字段类型

</td>
</tr>
<tr>
<td>

...`args`

</td>
<td>

[`SimpleFieldArgument`](/obsidian-meta-bind-plugin-docs/api/interfaces/simplefieldargument/)[]

</td>
<td>

字段参数

</td>
</tr>
</tbody>
</table>

#### 返回值

[`SimpleViewFieldDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/simpleviewfielddeclaration/)

#### 继承自

`API.createViewFieldDeclaration`

***

### getBindTargetScope()

> **getBindTargetScope**(`bindTarget`, `filePath`): [`Scope`](/obsidian-meta-bind-plugin-docs/api/type-aliases/scope/)

定义位置: [packages/core/src/api/API.ts:516](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L516)

获取绑定目标的作用域。

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

`bindTarget`

</td>
<td>

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

</td>
<td>

绑定目标

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

文件路径

</td>
</tr>
</tbody>
</table>

#### 返回值

[`Scope`](/obsidian-meta-bind-plugin-docs/api/type-aliases/scope/)

#### 继承自

`API.getBindTargetScope`

***

### getBindTargetValue()

> **getBindTargetValue**(`bindTarget`, `filePath`): `unknown`

定义位置: [packages/core/src/api/API.ts:498](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L498)

获取绑定目标的值。

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

`bindTarget`

</td>
<td>

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

</td>
<td>

绑定目标

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

文件路径

</td>
</tr>
</tbody>
</table>

#### 返回值

`unknown`

#### 继承自

`API.getBindTargetValue`

***

### getButtonActionRunner()

> **getButtonActionRunner**(): `ButtonActionRunner`\<`ObsComponents`\>

定义位置: [packages/core/src/api/API.ts:544](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L544)

获取按钮动作运行器。

#### 返回值

`ButtonActionRunner`\<`ObsComponents`\>

#### 继承自

`API.getButtonActionRunner`

***

### getMetadata()

> **getMetadata**(`filePath`): `unknown`

定义位置: [packages/core/src/api/API.ts:480](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L480)

获取文件的元数据。

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

`filePath`

</td>
<td>

`string`

</td>
<td>

文件路径

</td>
</tr>
</tbody>
</table>

#### 返回值

`unknown`

#### 继承自

`API.getMetadata`

***

### isInlineFieldAtPosition()

> **isInlineFieldAtPosition**(`position`, `filePath`): `boolean`

定义位置: [packages/core/src/api/API.ts:325](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L325)

检查指定位置是否有内联字段。

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

`position`

</td>
<td>

[`NotePosition`](/obsidian-meta-bind-plugin-docs/api/classes/noteposition/)

</td>
<td>

位置

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

文件路径

</td>
</tr>
</tbody>
</table>

#### 返回值

`boolean`

#### 继承自

`API.isInlineFieldAtPosition`

***

### parseBindTarget()

> **parseBindTarget**(`bindTargetString`): [`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

定义位置: [packages/core/src/api/API.ts:679](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L679)

解析绑定目标字符串。

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

`bindTargetString`

</td>
<td>

`string`

</td>
<td>

绑定目标字符串

</td>
</tr>
</tbody>
</table>

#### 返回值

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

#### 继承自

`API.parseBindTarget`

***

### parseInlineFieldFromString()

> **parseInlineFieldFromString**(`inlineField`): [`ParsingResult`](/obsidian-meta-bind-plugin-docs/api/type-aliases/parsingresult/)

定义位置: [packages/core/src/api/API.ts:314](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L314)

从字符串解析内联字段。

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

`inlineField`

</td>
<td>

`string`

</td>
<td>

内联字段字符串

</td>
</tr>
</tbody>
</table>

#### 返回值

[`ParsingResult`](/obsidian-meta-bind-plugin-docs/api/type-aliases/parsingresult/)

#### 继承自

`API.parseInlineFieldFromString`

***

### reactiveComponent()

> **reactiveComponent**(`bindTarget`, `filePath`, `renderFunction`): [`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/)

定义位置: [packages/core/src/api/API.ts:426](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L426)

创建响应式组件。

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

`bindTarget`

</td>
<td>

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

</td>
<td>

绑定目标

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

文件路径

</td>
</tr>
<tr>
<td>

`renderFunction`

</td>
<td>

(`value`: `unknown`, `element`: `HTMLElement`) =\> `void`

</td>
<td>

渲染函数

</td>
</tr>
</tbody>
</table>

#### 返回值

[`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/)

#### 继承自

`API.reactiveComponent`

***

### reactiveComponentV2()

> **reactiveComponentV2**(`renderFunction`): [`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/)

定义位置: [packages/core/src/api/API.ts:438](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L438)

创建响应式组件（V2版本）。

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

`renderFunction`

</td>
<td>

(`context`: `ContextService`) =\> `void`

</td>
<td>

渲染函数

</td>
</tr>
</tbody>
</table>

#### 返回值

[`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/)

#### 继承自

`API.reactiveComponentV2`

***

### runJavaScript()

> **runJavaScript**(`code`, `filePath`, `contextName`?): `Promise`\<`unknown`\>

定义位置: [packages/core/src/api/API.ts:553](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L553)

运行 JavaScript 代码。

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

`code`

</td>
<td>

`string`

</td>
<td>

JavaScript 代码

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

文件路径

</td>
</tr>
<tr>
<td>

`contextName`?

</td>
<td>

`string`

</td>
<td>

上下文名称（可选）

</td>
</tr>
</tbody>
</table>

#### 返回值

`Promise`\<`unknown`\>

#### 继承自

`API.runJavaScript`

***

### setBindTargetValue()

> **setBindTargetValue**(`bindTarget`, `value`, `filePath`): `void`

定义位置: [packages/core/src/api/API.ts:507](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L507)

设置绑定目标的值。

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

`bindTarget`

</td>
<td>

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

</td>
<td>

绑定目标

</td>
</tr>
<tr>
<td>

`value`

</td>
<td>

`unknown`

</td>
<td>

要设置的值

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

文件路径

</td>
</tr>
</tbody>
</table>

#### 返回值

`void`

#### 继承自

`API.setBindTargetValue`

***

### setMetadata()

> **setMetadata**(`filePath`, `value`): `void`

定义位置: [packages/core/src/api/API.ts:489](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L489)

设置文件的元数据。

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

`filePath`

</td>
<td>

`string`

</td>
<td>

文件路径

</td>
</tr>
<tr>
<td>

`value`

</td>
<td>

`unknown`

</td>
<td>

要设置的值

</td>
</tr>
</tbody>
</table>

#### 返回值

`void`

#### 继承自

`API.setMetadata`

***

### subscribeToBindTarget()

> **subscribeToBindTarget**(`bindTarget`, `filePath`, `callback`): `ListenerFunction`

定义位置: [packages/core/src/api/API.ts:530](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L530)

订阅绑定目标的变化。

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

`bindTarget`

</td>
<td>

[`BindTargetDeclaration`](/obsidian-meta-bind-plugin-docs/api/interfaces/bindtargetdeclaration/)

</td>
<td>

绑定目标

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

文件路径

</td>
</tr>
<tr>
<td>

`callback`

</td>
<td>

(`value`: `unknown`) =\> `void`

</td>
<td>

回调函数

</td>
</tr>
</tbody>
</table>

#### 返回值

`ListenerFunction`

#### 继承自

`API.subscribeToBindTarget`

***

### unloadInlineField()

> **unloadInlineField**(`position`, `filePath`): `void`

定义位置: [packages/core/src/api/API.ts:336](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L336)

卸载指定位置的内联字段。

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

`position`

</td>
<td>

[`NotePosition`](/obsidian-meta-bind-plugin-docs/api/classes/noteposition/)

</td>
<td>

位置

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

文件路径

</td>
</tr>
</tbody>
</table>

#### 返回值

`void`

#### 继承自

`API.unloadInlineField`

***

### updateInlineFieldsInFile()

> **updateInlineFieldsInFile**(`filePath`): `void`

定义位置: [packages/core/src/api/API.ts:394](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/core/src/api/API.ts#L394)

更新文件中的所有内联字段。

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

`filePath`

</td>
<td>

`string`

</td>
<td>

文件路径

</td>
</tr>
</tbody>
</table>

#### 返回值

`void`

#### 继承自

`API.updateInlineFieldsInFile`

***

### wrapInMDRC()

> **wrapInMDRC**(`filePath`, `component`, `mountable`): `MarkdownRenderChild`

定义位置: [packages/obsidian/src/ObsAPI.ts:125](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/6e87907d27dd07b6437b63c980b11d2bfef62599/packages/obsidian/src/ObsAPI.ts#L125)

将可挂载对象包装在 MarkdownRenderChild 中。

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

`filePath`

</td>
<td>

`string`

</td>
<td>

文件路径

</td>
</tr>
<tr>
<td>

`component`

</td>
<td>

`Component`

</td>
<td>

组件

</td>
</tr>
<tr>
<td>

`mountable`

</td>
<td>

[`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable/)

</td>
<td>

可挂载对象

</td>
</tr>
</tbody>
</table>

#### 返回值

`MarkdownRenderChild`

