---
title: 视图字段
description: Meta Bind 视图字段教程。
---

视图字段是在笔记中响应式显示元数据的强大方式。
它们可以绑定到多个前置元数据字段，视图字段会在前置元数据字段的值发生变化时立即更新，就像 dataview 内联查询一样，但具有即时更新功能。
视图字段甚至可以进行计算并将计算值保存回前置元数据。

## 创建视图字段

想象一下，我们有一个用于计划即将到来的徒步旅行的笔记。
在前置元数据中，我们已经创建了一个字段来跟踪旅行的公里距离。
我们还创建了一个输入字段来从笔记内部更改距离。
它看起来像这样：

```custom_markdown
Distance: `INPUT[number:distance]` km
```

但现在我们想为我们的美国朋友了解这在自由单位中有多长。
这就是视图字段的用武之地。

```custom_markdown "VIEW[{distance}]"
Distance: `INPUT[number:distance]` km
Distance in freedom units: `VIEW[{distance}]` miles
```

这将显示距离，并在我们使用上面的输入字段更改值时发生变化，但我们仍然缺少转换。
此时 mathjs 变得有用。有了它，我们可以简单地将公里转换为英里。

```custom_markdown "VIEW[number({distance} km, miles)]"
Distance: `INPUT[number:distance]` km
Distance in freedom units: `VIEW[number({distance} km, miles)]` miles
```

为了使其看起来更好一些，我们还可以将数字四舍五入到小数点后两位。当我们使用输入字段更改距离时，显示的值仍然会立即更改。

```custom_markdown "VIEW[round(number({distance} km, miles), 2)]"
Distance: `INPUT[number:distance]` km
Distance in freedom units: `VIEW[round(number({distance} km, miles), 2)]` miles
```

花括号中对前置元数据的引用遵循与输入字段的绑定目标相同的[绑定目标](/obsidian-meta-bind-plugin-docs/guides/bindtargets)规则。
所以如果出于某种原因您不想将值持久化到前置元数据，您可以使用 `memory` 存储类型。

```custom_markdown "memory^distance"
Distance: `INPUT[number:memory^distance]` km
Distance in freedom units: `VIEW[round(number({memory^distance} km, miles), 2)]` miles
```

## 视图字段类型

您也可以指定视图字段类型。默认类型（如果您不指定任何类型）是 math。

指定视图字段类型的方式如下：

```meta-bind
VIEW[content][viewFieldType]
```

这意味着以下两个示例是等效的。两者都计算 `a` 乘以 `b`。

```meta-bind
VIEW[{a} * {b}]
VIEW[{a} * {b}][math]
```

## 参数

视图字段与输入字段一样，支持参数来进一步自定义它们。
它们的语法也相同，意味着它们在视图字段类型后面的括号中指定。

例如，如果您希望 text 视图字段渲染 markdown 而不是纯文本，
您可以像这样添加 renderMarkdown 参数。

```meta-bind
VIEW[**{someText}**][text(renderMarkdown)]
```

这将把存储在 `someText` 前置元数据属性中的文本作为 markdown 渲染。

## 保存值

您可以通过指定"写入"绑定目标将视图字段计算的值保存回前置元数据属性。请参阅[绑定目标](/obsidian-meta-bind-plugin-docs/guides/bindtargets)。

假设您想计算一个值 `c`，该值具有 `a * b` 的值，换句话说，您想计算 `a * b` 并将结果保存到 `c`。这可以通过将 `c` 指定为视图字段的"写入"绑定目标来完成，如下所示：

```meta-bind ":c"
VIEW[{a} * {b}][math:c]
```

### 循环依赖

当然，您可以滥用这一点并创建循环依赖，通过执行以下示例之类的操作来导致 Obsidian 崩溃。

```meta-bind
VIEW[{a}][math:b]
VIEW[{b} + 1][math:a]
```

或者像这样：

```meta-bind
VIEW[{a} + 1][math:a]
```

Meta Bind **将检测**这些依赖循环并**将防止**您意外锁定自己无法访问 Obsidian 和您的笔记。

### 限制

视图字段只有在您打开它们所在的笔记时才会工作。

假设您有两个笔记，`NoteA` 和 `NoteB`。

`NoteA` 看起来像这样：

```custom_markdown title="NoteA.md"
---
someInputValue: 1
someComputedValue: 2
---

Input: `INPUT[number:someComputedValue]`
Computed Value: `VIEW[{someInputValue} * 2][math:someComputedValue]`
```

假设您还想在 `NoteB` 中更改和读取 `NoteA` 的值。

所以 `NoteB` 看起来像这样：

```custom_markdown title="NoteB.md"
Input: `INPUT[number:NoteA#someComputedValue]`
Computed Value: `VIEW[{NoteA#someComputedValue}]`
```

如果您同时打开两个笔记，当您使用输入字段更改输入值时，`NoteB` 中的视图字段将按预期更新。
但如果您关闭 `NoteA`（这样只有 `NoteB` 打开），那么视图字段将不再更新，因为进行计算的视图字段在 `NoteA` 中，而该笔记不再加载。

## JS 视图字段

您也可以创建由 JavaScript 驱动的视图字段。
这些只能作为代码块创建，**不能内联**。
默认情况下，JS 视图字段是禁用的，因为它们可能会带来安全风险。

:::note
此功能要求您具备以下条件：

1. 安装并启用 [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin)。
2. 在 Meta Bind 设置中启用 **JavaScript**。
:::

JS 视图字段由两个部分组成，用 `---` 分隔。
第一部分包含[绑定目标](/obsidian-meta-bind-plugin-docs/guides/bindtargets)和其他配置。
第二部分包含 JavaScript 代码。

渲染时，JS 视图字段显示 JavaScript 部分返回的值，就像 [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin) 一样。
这意味着您可以执行诸如渲染 markdown 之类的操作。

在 [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin#api-docs) 代码块中可用的相同变量和 API 在 JS 视图字段中也可用。
绑定的变量在 `context.bound` 对象中可用。

当绑定目标部分的绑定变量之一发生变化时，JS 视图字段将自动更新。

### 示例

````custom_markdown
```meta-bind-js-view
{bind_target} as var1
{other_note#bind_target} as var2
---
return `${context.bound.var1 * context.bound.var2} km`;
```
````

以下示例将其值保存到另一个[绑定目标](/obsidian-meta-bind-plugin-docs/guides/bindtargets)。

````custom_markdown {4}
```meta-bind-js-view
{bind_target} as var1
{other_note#bind_target} as var2
save to {other_bind_target}
---
return `${context.bound.var1 * context.bound.var2} km`;
```
````

以下 JS 视图字段将另外被隐藏。

````custom_markdown {5}
```meta-bind-js-view
{bind_target} as var1
{other_note#bind_target} as var2
save to {other_bind_target}
hidden
---
return `${context.bound.var1 * context.bound.var2} km`;
```
````