# 向您的页面添加元数据

Dataview无法查询您库中的所有内容。为了能够搜索、过滤和显示内容，这些内容需要被**索引**。一些内容会自动索引，如项目符号或任务列表——所谓的**隐式字段**，下面会详细介绍——而其他数据需要保存在元数据**字段**中才能通过dataview访问。

## 什么是"字段"？

元数据字段是一个**键**和一个**值**的配对。字段的_值_具有数据类型（更多信息[在这里](./types-of-metadata.md)），这决定了在查询该字段时它的行为方式。

您可以向**笔记**、**列表项**或**任务**添加任意数量的字段。

## 如何添加字段？

您可以通过三种不同方式向**笔记**添加字段。字段的外观取决于您添加它们的方式。

在**任务或列表项**上，您将可以使用YAML前端数据信息，但无法将它们添加到特定的列表项。如果您想仅向一个列表项或任务添加元数据，请使用[内联字段](#内联字段)。

### 前端数据

前端数据是一种常见的Markdown扩展，允许在页面顶部添加YAML元数据。它由Obsidian原生支持，并在其[官方文档](https://help.obsidian.md/Advanced+topics/YAML+front+matter)中有详细说明。所有YAML前端数据字段将自动作为Dataview字段可用。

```yaml
    ---
    alias: "document"
    last-reviewed: 2021-08-17
    thoughts:
      rating: 8
      reviewable: false
    ---
```

通过这个，您的笔记具有名为`alias`、`last-reviewed`和`thoughts`的元数据字段。这些字段中的每一个都有不同的**数据类型**：

- `alias`是一个[文本](types-of-metadata.md#text)，因为它被包装在""中
- `last-reviewed`是一个[日期](types-of-metadata.md#date)，因为它遵循ISO日期格式
- `thoughts`是一个[对象](types-of-metadata.md#object)字段，因为它使用了YAML前端数据对象语法

您可以用以下查询来查询此笔记：

~~~
```dataview
LIST
WHERE thoughts.rating = 8
```
~~~

### 内联字段

对于那些想要更自然外观注释的人，Dataview通过`Key:: Value`语法支持"内联"字段，您可以在文件中的任何地方使用。这允许您将可查询的数据写在需要的地方——例如在句子中间。

如果您的内联字段有自己的行，前面没有任何内容，您可以这样写：

```markdown
# Markdown Page

Basic Field:: Some random Value
**Bold Field**:: Nice!
```

`::`后的所有内容都是字段的值，直到下一个换行符。

> [!hint] 注意`::`
> 注意在使用内联字段时，您需要在键和值之间使用双冒号`::`，这与YAML前端数据字段只需要一个冒号不同。

如果您想在句子内嵌入元数据，或在同一行上有多个字段，您可以使用括号语法并将您的字段包装在方括号中：

```markdown
I would rate this a [rating:: 9]! It was [mood:: acceptable].
```

> [!info] 列表项和任务上的字段
> 当您想要用元数据注释列表项，例如任务时，您总是需要使用括号语法（因为字段不是该行中的唯一信息）
> ```markdown
> - [ ] Send an mail to David about the deadline [due:: 2022-04-05].
> ```
> 括号内联字段是向特定列表项显式添加字段的唯一方法，YAML前端数据总是应用于整个页面（但在列表项的上下文中也可用。）

还有替代的括号语法，它在阅读模式下呈现时隐藏键：

```markdown
This will not show the (longKeyIDontNeedWhenReading:: key).
```

将呈现为：

```markdown
This will not show the key.
```

您可以在一个文件中将YAML前端数据和内联字段与所有语法变体一起使用。您不需要决定使用其中一种，可以混合使用它们以适应您的工作流程。

## 字段名称

假设您在一个笔记中使用了上面内联字段的所有示例，那么以下元数据将对您可用：

| 元数据键                          | 清理后的元数据键                      | 值                 | 值的数据类型 |
| ----------------------------- | ----------------------------- | ----------------- | ------ |
| `Basic Field`                 | `basic-field`                 | Some random Value | 文本     |
| `Bold Field`                  | `bold-field`                  | Nice!             | 文本     |
| `rating`                      | -                             | 9                 | 数字     |
| `mood`                        | -                             | acceptable        | 文本     |
| `due`                         | -                             | 2022-04-05的日期对象   | 日期     |
| `longKeyIDontNeedWhenReading` | `longkeyidontneedwhenreading` | key               | 文本     |

如您在表格中所见，如果您在元数据键名称中使用**空格或大写字母**，dataview将为您提供该键的**清理版本**。

**有空格的键**不能在查询中直接使用。您有两种可能性：要么使用清理后的名称，它总是全小写并用破折号代替空格，要么使用**row**变量语法。在[FAQ](../resources/faq.md)中了解更多。

**有大写字母的键**如果您愿意，可以直接使用。清理版本允许您独立于大小写查询键，并使其更容易使用：例如，当使用清理键`somemetadata`时，您可以查询在一个文件中名为`someMetadata`而在另一个文件中名为`someMetaData`的同一字段。

此外，**粗体字段键缺少其格式标记**。即使用于使其显示为粗体的`**`是文件中键名称的一部分，在索引您的笔记时它们也会被忽略。其他所有内置格式也是如此，如删除线或斜体。这意味着格式化的键只能在没有格式的情况下查询。这允许您在笔记的上下文中格式化键，而不用担心可能为同一类型的信息创建不同的键。

### 表情符号和非拉丁字符的使用

在命名元数据字段时，您不仅限于拉丁字符。您可以使用UTF-8中可用的所有字符：

```markdown
Noël:: Un jeu de console
クリスマス:: 家庭用ゲーム機
[🎅:: a console game]
[xmas🎄:: a console game]
```

**使用表情符号作为元数据键**是可能的，但它有一些限制。在字段名称中使用表情符号时，您需要将它们放在方括号中，以便dataview正确识别它们。
另外，请注意在切换操作系统时（即从Windows到Android），同一个表情符号可能使用另一个字符代码，您在查询时可能找不到您的元数据。

> [!info] 任务字段简写
> 对此的一个例外是任务中的[简写语法](./metadata-tasks.md#field-shorthands)。您可以使用简写而无需括号。但请注意，这仅适用于列出的简写——每个其他字段（无论是否带有表情符号）都需要使用`[key:: value]`语法。

## 隐式字段

即使您没有向笔记中显式添加任何元数据，dataview也为您提供了大量的开箱即用的索引数据。隐式字段的一些示例包括：

- 文件创建日期 (`file.cday`)
- 文件中的链接 (`file.outlinks`)
- 文件中的标签 (`file.etags`)
- 文件中的所有列表项 (`file.lists`和`file.tasks`)

以及更多。可用的隐式字段根据您是查看页面还是列表项而有所不同。在[页面上的元数据](metadata-pages.md)和[任务和列表上的元数据](metadata-tasks.md)上找到可用隐式字段的完整列表。
