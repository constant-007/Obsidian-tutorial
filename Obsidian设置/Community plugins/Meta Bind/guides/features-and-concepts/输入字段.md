---
title: 输入字段
description: Meta Bind 输入字段教程。
---

输入字段允许您为笔记的元数据创建输入字段，并在实时预览和阅读模式下与它们交互。
有点像 Obsidian 的属性 UI，但不仅仅在笔记的顶部。

### 创建输入字段

在笔记中创建输入字段有两种方式。

第一种是使用**内联**代码块，如 `INPUT[inputType]`。
第二种是使用以 meta-bind 为语言的**代码块**，类似这样：

````custom_markdown
```meta-bind
INPUT[inputType]
```
````

其中 `inputType` 是有效的输入字段类型，如 `toggle`。

## 绑定到元数据

:::tip
您可以在[这里](/obsidian-meta-bind-plugin-docs/guides/bindtargets)找到关于绑定目标和可能用法的深入指南。
:::

输入字段可以且应该绑定到元数据字段，即前置元数据中的属性。
这通过在输入类型后面添加绑定目标来实现，用冒号分隔。

在这个例子中，我们将构建一个切换开关，通过在 `true` 和 `false` 之间切换 `completed` 前置元数据字段来切换笔记的完成状态。

首先，我们创建一个切换开关。

```meta-bind
INPUT[toggle]
```

然后我们告诉它使用[绑定目标](/obsidian-meta-bind-plugin-docs/guides/bindtargets)绑定到 `completed` 前置元数据字段。

```meta-bind ":completed"
INPUT[toggle:completed]
```

我们的输入字段就开始工作了。切换开关会改变前置元数据，当前置元数据改变时，切换开关也会改变。

当然，您可以在输入字段中利用[绑定目标](/obsidian-meta-bind-plugin-docs/guides/bindtargets)的全部功能。例如，以下是可能的：

```meta-bind ":memory^completed"
INPUT[toggle:memory^completed]
```

:::note
指定绑定目标是可选的，但建议这样做。

如果您不指定绑定目标，输入字段在您重新打开笔记或重启 Obsidian 时将不会保持其状态，因为输入字段没有地方存储其数据。
:::

输入字段只有在与其交互时才会写入其绑定值。
这意味着例如，输入字段不会在加载时自动创建其绑定属性（当该属性尚不存在时）。

## 参数

某些输入类型支持参数来进一步自定义它们。
参数在输入类型后面的括号中指定。

假设我们想创建一个下拉选择框，您可以在其中选择不同的评分。为此我们将使用 `inlineSelect` 输入字段。
要向下拉选择框添加选项，我们将使用 `option(name)` 参数。

```meta-bind
INPUT[inlineSelect(
    option(bad),
    option(meh),
    option(ok),
    option(good),
    option(great)
):rating]
```

现在我们可以在下拉框中看到四个选项。

如果我们希望在前置元数据中用数值来表示评分，我们可以向 `option(value, name)` 传递两个值。`value` 将是写入前置元数据的值，`name` 将是在下拉选择框中显示的值。

```meta-bind
INPUT[inlineSelect(
    option(1, bad),
    option(2, meh),
    option(3, ok),
    option(4, good),
    option(5, great)
):rating]
```

我们也可以通过用单引号包围来在值名称中包含逗号。注意只支持单引号，双引号不起作用。

```meta-bind
INPUT[inlineSelect(
    option(1, 'if you value your time, do not watch'),
    ...
):rating]
```

这样的字符串也支持使用反斜杠转义。要在名称中包含单个反斜杠，您可以使用双反斜杠 `\\`。

```meta-bind
INPUT[inlineSelect(
    option(1, 'if you value your time, don\'t watch'),
    ...
):rating]
```
