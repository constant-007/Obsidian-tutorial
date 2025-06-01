---
publish: true
---

# 状态

<span class="related-pages">#feature/statuses</span>

## 介绍

> [!released]
自定义状态在Tasks 1.23.0中引入。

本页面提供了使用Tasks的**自定义状态**的概述，有些人将其称为自定义复选框或替代/备用复选框。

您可以做这样的事情：

![Selection of checkboxes from Minimal theme](../images/theme-minimal-reading-view-sample.png) ![Selection of checkboxes from ITS theme](../images/theme-its-reading-view-sample.png)

### 相关页面

一旦您熟悉了本页面的背景信息，可以在以下相关页面中找到更多信息。

- [[Style custom statuses|如何设置自定义状态样式]]。
- [[Set up custom statuses|如何设置您的自定义状态]]。
- [[About Status Collections|关于状态集合]]。
- [[Check your Statuses|检查您的状态]]。

## 我需要设置状态吗？

如果您对所有任务都以`[ ]`和`[x]`开头感到满意，那么**不需要**，您可以忽略Tasks的状态功能。

## 关于状态

### 什么是状态？

Tasks插件中的每个任务现在都有一个状态。

状态只是Tasks对以下内容的称呼：

1. 任务行中`[`和`]`之间的字符（`符号`）
2. 以及一些您可以自定义的选项，告诉tasks如何处理所有具有该字符的任务。

一些obsidian用户称它们为其他名称，如"替代复选框"，但这更多的是关于它们如何显示，而不是关于具有特定状态的任务的实际*行为*。

### 状态中有什么？

这些是您可以为每个状态修改的选项：

![Task Status modal](../images/settings-custom-statuses-dialog-2.png)

这里有更多详细信息。

- **状态符号**
  - 任务开头`[]`中的单个字符。
  - 此字符将控制您的主题或CSS片段如何渲染任务。
- **状态名称**
  - 状态的名称。
  - 这很灵活：对于自定义状态，您可以使用任何您希望的名称。
  - 可以使用`status.name`搜索，例如`status.name includes My custom in-progress status`。
- **下一个状态符号**
  - 切换任务时要使用的状态符号。
- **状态类型**
  - `TODO`、`IN_PROGRESS`、`DONE`、`CANCELLED`、`NON_TASK`之一。
  - Tasks需要知道每个状态的类型，以便知道在搜索时如何处理它们，以及在切换具有该状态的任务时要做什么。
  - 类型可以使用`status.type`搜索，例如`status.type is IN_PROGRESS`。
  - 还可用：
    - `sort by status.type`
    - `group by status.type`
  - 有关更多信息，请参阅[[Status Types|状态类型]]

### 未知状态

如果Tasks读取到具有它不知道的状态符号的行会发生什么？

所有这样的任务都被赋予一个名为`Unknown`的状态，具有以下属性：

| 属性           | 值                                                               |
| ------------------ | ------------------------------------------------------------------- |
| 状态符号      | 任务行中`[`和`]`之间的无法识别的字符 |
| 状态名称        | **Unknown**                                                         |
| 下一个状态符号 | `x`                                                                 |
| 状态类型        | `TODO`                                                              |

### 完成日期、重复和状态

是任务状态类型**变为**`DONE`控制何时：

- 任务**获得**其完成日期（如果在设置中启用了完成日期），
- 创建重复任务的新副本。

是任务状态类型**从**`DONE`变化控制何时：

- 任务**失去**其完成日期（如果在设置中启用了完成日期）。

有关上述内容的更详细解释，请参阅[[Recurring Tasks and Custom Statuses|重复任务和自定义状态]]。

## 状态可以做什么？

现在我们已经看到了状态中有什么，我们可以用它们做什么？

我们可以使用它们来控制当任务的复选框被点击或切换时Tasks做什么。

[[Example Statuses|示例状态]]页面有各种示例，供您参考。

## 更多关于状态

### 核心状态

核心状态代表传统的markdown任务：

```text
- [ ] 我是一个尚未完成的任务
- [x] 我是一个已经完成的任务
```

它们不需要任何自定义CSS样式或主题就能在Tasks块或实时预览中正确显示。

在Tasks 1.23.0之前，这些是Tasks知道的唯一状态。

请参阅[[Core Statuses|核心状态]]了解更多信息。

### 自定义状态

自定义状态代表任何非标准的markdown任务。

这里有一些具有示例自定义状态的任务，即在`[`和`]`之间具有非标准字符：

```text
- [X] 已检查
- [-] 已放弃/取消的任务
- [?] 一个问题
- [/] 半完成/进行中的任务
```

它们**需要自定义CSS样式或主题**才能在Tasks块或实时预览中正确显示。

### 有什么大不了的？

人们一直在使用主题和CSS片段来设置Obsidian中自定义复选框的样式。

Tasks的自定义状态允许您做的是**还可以自定义任务的行为**。

### 设置自定义状态

<!-- force a blank line --><!-- include: snippet-statuses-overview.md -->

> [!info]
> 理解和设置状态（或"替代复选框"）的大致步骤：
>
> - 理解什么是状态：
>   - [[Statuses|状态]]
>   - [[Custom Statuses|自定义状态]]
> - 选择您的状态样式方案：这将确定您的自定义状态的名称和符号：
>   - 一些常见的在[[About Status Collections|关于状态集合]]中显示
> - 设置您的状态样式方案
>   - [[Style custom statuses|如何设置自定义状态样式]]。
> - 配置Tasks使用您的自定义状态
>   - [[Set up custom statuses|如何设置您的自定义状态]]
>   - [[Check your Statuses|检查您的状态]]
> - 可选地，更新您的任务搜索以利用新的灵活性
>   - [[Filters#Filters for Task Statuses|任务状态过滤器]]

<!-- force a blank line --><!-- endInclude -->

## 使用状态

### 编辑您的任务

[[Create or edit Task#Status|'Create or edit Task' Modal]]允许您更改任务的状态。

### 相关命令

> [!info]
目前还没有应用自定义状态的新命令。
我们在[issue #1486](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1486)中跟踪此问题。

### 相关搜索

- `done` - 匹配状态类型为`DONE`、`CANCELLED`和`NON_TASK`的任务
- `not done` - 匹配状态类型为`TODO`和`IN_PROGRESS`的任务
- **状态名称**
  - `status.name`文本搜索
  - `sort by status.name`
  - `group by status.name`
- **状态类型**
  - `status.type`文本搜索
  - `sort by status.type`
  - `group by status.type`

有关详细信息，请参阅[[Filters#Filters for Task Statuses|任务状态过滤器]]

> [!info]
我们设想添加`status.symbol`。我们在[issue #1630](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1630)中跟踪此问题。

## 致谢：Sytone和'Tasks SQL Powered'插件

此插件的读取、搜索和编辑自定义状态的实现完全得益于[Sytone](https://github.com/sytone)的工作和他的Tasks分支['Tasks SQL Powered'](https://github.com/sytone/obsidian-tasks-x)。[^task-x-version]

在Tasks中从'Tasks SQL Powered'复制代码的地方，Sytone被特别标记为共同作者，即联合作者，这些提交可以在GitHub网站上看到：[Commits "Co-Authored-By: Sytone"](https://github.com/search?q=repo%3Aobsidian-tasks-group%2Fobsidian-tasks+%22Co-Authored-By%3A+Sytone%22&type=commits&s=committer-date&o=desc)。

随后，Tasks中的自定义状态实现与'Tasks SQL Powered'有了显著分歧。然而，如果没有Sytone的基础工作，新功能和修复都不可能实现，对此我们非常感激。

[^task-x-version]: 'Tasks SQL Powered'截至2022年8月2日的[修订版2c0b659](https://github.com/sytone/obsidian-tasks-x/tree/2c0b659457cc80806ff18585c955496c76861b87)
