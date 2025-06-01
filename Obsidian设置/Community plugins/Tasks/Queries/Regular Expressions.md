---
publish: true
---

# 正则表达式

## 介绍

> [!released]
在Tasks 1.12.0中引入。

[正则表达式](https://en.wikipedia.org/wiki/Regular_expression)（"regex"）搜索是简单的`includes`和`does not include`搜索的强大替代方案。

### 注意事项

> [!warning]
> 正则表达式（或'regex'）搜索是一个强大但高级的功能，需要深入的知识才能成功使用，避免遗漏预期的搜索结果。

很容易编写一个看起来正确但使用了完全改变搜索字符串含义的特殊字符的正则表达式。

例如，`\d`**不**匹配**两个**字符`\d`，它匹配以下任意**一个**字符：`0123456789`。

本文档只对该功能进行简要概述，提供一些启发性示例，然后链接到其他资源进行详细说明。

话虽如此，正则表达式搜索是一个有价值的工具，在许多其他工具中都有使用，投入时间学习它们在未来的许多其他工具和场景中都能获得很好的回报。

## 基础知识

正则表达式搜索过滤器的组成部分包括：

1. 字段名称，例如`description`或`path`
2. `regex matches`或`regex does not match`
3. 搜索模式，在一对正斜杠内，例如`/pc_abigail|pc_edwina|at_work/`
   - 该模式搜索`pc_abigail`、`pc_edwina`或`at_work`，无需创建三个单独过滤器的布尔组合
4. 可选地，在末尾添加一个额外的[标志](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions#advanced_searching_with_flags)，如`i`，可以改变表达式的含义
   - 请注意，许多允许的标志在Tasks环境中并不相关，因为没有多行搜索或全局搜索等。

区分大小写的示例，显示组成部分：

```text
description regex matches /pc_abigail|pc_edwina|at_work/
^1          ^2            ^3
```

不区分大小写的示例，显示组成部分：

```text
description regex matches /pc_abigail|pc_edwina|at_work/i
^1          ^2            ^3                            ^4
```

## 注意事项

- 正则表达式搜索**区分大小写**，不像简单的`includes`和`does not include`
- 可以通过在结束的`/`后添加`i`标志来使正则表达式搜索**不区分大小写**，例如：`/I aM cAsE INsensitive because of the LiTle i after the closing slash/i`
- Tasks不支持多行正则表达式搜索，因为每个任务都是单行。

## 转义特殊字符

要在Tasks中字面搜索任何字符`[ \ ^ $ . | ? * + ( )`，您应该在每个字符前放置一个`\`字符。

这被称为'转义'。参见[转义，特殊字符](https://javascript.info/regexp-escaping)。

请参见下一节了解其中一些字符的含义。

> [!Tip]
> 自Tasks 4.3.0起，不再需要将`/`字符转义为`\/`，尽管如果您确实转义了它们，搜索仍然有效。
>
> 因此，这两个搜索现在是相同的，都将搜索包含`Root/Sub-Folder/Sub-Sub-Folder`的任何文件夹中的任务：
>
> ```task
> folder regex matches /Root/Sub-Folder/Sub-Sub-Folder/
> folder regex matches /Root\/Sub-Folder\/Sub-Sub-Folder/
> ```

## 解释：检查正则表达式

> [!released]
> 在Tasks 4.3.0中引入。

要查看Tasks如何解释您的正则表达式，您可以在查询中添加一个`explain`行。

例如，此查询的结果：

<!-- snippet: DocsSamplesForExplain.test.explain_regular_expression.approved.query.text -->
```text
explain
path regex matches /^Root/Sub-Folder/Sample File\.md/i
```
<!-- endSnippet -->

 将在开始处的[[Explaining Queries|查询解释]]中包含此额外文本：

<!-- snippet: DocsSamplesForExplain.test.explain_regular_expression.approved.explanation.text -->
```text
Explanation of this Tasks code block query:

  path regex matches /^Root/Sub-Folder/Sample File\.md/i =>
    using regex:     '^Root\/Sub-Folder\/Sample File\.md' with flag 'i'
```
<!-- endSnippet -->

解释中使用撇号（`'`）而不是正斜杠（`/`）是为了强调查询中的分隔斜杠不包含在搜索字符串中。

## 特殊字符

如果使用正则表达式搜索，了解可用的特殊字符很重要，原因如下：

1. 它们能够以简单的方式编写复杂的查询
2. 如果在搜索中不"转义"，它们可能导致混乱的结果或错误的搜索。

以下是[许多特殊字符](https://javascript.info/regexp-escaping)的一些示例：

- `.`匹配任何字符
- `[...]`表示搜索方括号内的任何字符。
  - 例如，`[aeiou]`将匹配`a`、`e`、`i`、`o`或`u`中的任何一个。
  - 参见[集合和范围 \[...\]](https://javascript.info/regexp-character-sets-and-ranges)
- 开始和结束
  - `^`匹配字符串的开始（但当`[^在括号内]`时，它表示"非"）
  - `$`匹配字符串的结束
  - 参见[锚点：字符串开始 ^ 和结束 $](https://javascript.info/regexp-anchors)
- `|`在正则表达式中是`OR`
  - 参见[交替 (OR) \|](https://javascript.info/regexp-alternation)
- `\`为某些字符添加特殊含义。例如：
  - `\d`匹配一个数字，从0到9
  - `\D`匹配非数字字符
  - 参见[字符类](https://javascript.info/regexp-character-classes)

有关所有选项的详细、清晰介绍，请参见JavaScript.info上的[正则表达式](https://javascript.info/regular-expressions)。

## 重要链接

学习资源：

- JavaScript.info上的[正则表达式](https://javascript.info/regular-expressions)
- [正则表达式教程](https://regexone.com/)
- [正则表达式速查表](https://www.rexegg.com/regex-quickstart.html)

在线工具，用于实验和测试正则表达式：

- [正则表达式测试工具：regex101](https://regex101.com/)：选择'ECMAScript (JavaScript)'风格

实现细节：

- 使用[JavaScript的RegExp实现](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions)实现
- 支持[JavaScript RegExp标志](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions#advanced_searching_with_flags)，尽管并非所有标志在此环境中都相关。

## 已知限制

请注意Tasks正则表达式搜索实现的以下限制：

- [前瞻和后顾](https://www.regular-expressions.info/lookaround.html)搜索未经测试，推测在Apple移动设备上不起作用，或导致搜索缓慢的严重性能问题。

## 正则表达式示例

以下是一些正则表达式搜索示例，可以给出一些可以做什么的想法。

在[Tasks-Demo示例保险库](https://github.com/obsidian-tasks-group/obsidian-tasks/tree/main/resources/sample_vaults/Tasks-Demo)的[正则表达式搜索](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/resources/sample_vaults/Tasks-Demo/Filters/Regular%20Expression%20Searches.md)文件中还有更多示例。

### 搜索字段的开始

查找描述以Log开头的任务，精确大小写：

```text
description regex matches /^Log/
```

---

查找描述以Log开头的任务，忽略大小写

```text
description regex matches /^Log/i
```

### 查找空字段

我想查找没有描述的任务，可能是因为它们是从模板创建的：

```text
description regex matches /^$/
```

我想排除没有描述的任务：

```text
description regex does not match /^$/
```

工作原理：在正则表达式中，`/^$/`匹配开始和结束之间没有任何内容的文本。

### 查找正在等待的任务

我想查找正在等待其他事情的任务。但'waiting'可以用几种不同的方式拼写：

```text
description regex matches /waiting|waits|wartet/i
```

### 查找时间

在描述中查找包含时间的任务 - 简单版本。这会匹配无效时间，如`99:99`，因为`\d`表示'任何数字'。

```text
description regex matches /\d\d:\d\d/
```

---

在描述中查找包含时间的任务。由于指定了每个位置允许的数字，这比前面的示例更精确。

```text
description regex matches /[012][0-9]:[0-5][0-9]/
```

### 查找子标签

假设您想搜索这种形式的标签：`#tag/subtag3/subsubtag5`，其中`3`和`5`允许是任何单个数字。

- 我们可以使用`[0-9]`或`\d`来匹配单个数字。
- 要查找子标签，任何`/`字符都必须'转义'以防止它们截断搜索模式的其余部分。

转义`/`会得到这个指令，我们也使其不区分大小写以查找大写标签：

```text
tags regex matches /#tag\/subtag[0-9]\/subsubtag[0-9]/i
```

### 查找短标签

假设您想搜索具有非常短标签的任务：`#t`，并且不匹配像`#task`和`#t/subtag`这样的标签。

```text
tag regex matches /#t$/i
```

`$`防止搜索模式后标签中有任何更多字符。

`i`使搜索不区分大小写。