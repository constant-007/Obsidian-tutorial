---
publish: true
aliases:
  - Queries/Queries
---

# 关于查询

<span class="related-pages">#index-pages</span>

## 最简单的查询

您可以使用`tasks`代码块查询来列出整个库中的任务。您可以通过点击查询结果旁边的小铅笔图标来编辑任务。
默认情况下，任务按状态、截止日期，然后按路径排序。您可以更改排序（请参阅下面的查询选项）。

查询任务的最简单方法是：

    ```tasks
    ```

在实时预览和阅读模式下，这将列出库中的*所有*任务，无论其状态等属性如何。

这可能不是您想要的。
因此，Tasks允许您设置查询选项来过滤您想要显示的任务。

例如，您可以只显示今天到期的任务（来自库中的任何地方）：

    ## 今天到期
    ```tasks
    due today
    not done
    ```

您可以创建任意数量的任务查询，如果您想以不同的方式设置样式，还可以将它们包装到[标注](https://help.obsidian.md/Editing+and+formatting/Callouts)中：

    > [!check] 今天到期
    > ```tasks
    > due today
    > not done
    > ```

在以下部分中，我们将解释查询任务可用的所有各种选项。

## Tasks查询选项

### 搜索任务 - 基础

- [[Filters|过滤器]]
  - 控制在Tasks查询中显示哪些任务。
- [[Explaining Queries|解释查询]]
  - 让Tasks显示您的查询是如何解释的，以便您可以检查您的指令。
- [[Comments|注释]]
  - 为您未来的自己写笔记，解释您的查询。
- [[Obsidian设置/Community plugins/Tasks/Queries/Examples|示例]]
  - 一些更常用的搜索指令的选择。

### 搜索任务 - 重用指令

- [[Global Query|全局查询]]
  - 在设置中设置全局查询，Tasks将添加到库中所有查询的开头。
- [[Query File Defaults|查询文件默认值]]
  - 在笔记frontmatter中设置属性，指示tasks向该文件中的所有查询添加指令。

> [!tip] 查询是这样组装的：
>
> 1. 从设置中获取**全局查询**。
>     - 如果在以下任何位置存在`ignore global query`，这将被丢弃。
> 2. 附加**查询文件默认值**，基于查询文件的属性。
> 3. 附加**查询源**，来自`tasks`块。
>
> 后面的[[Layout|布局]]指令将覆盖前面的指令。

### 搜索任务 - 高级

- [[Combining Filters|组合过滤器]]
  - 如何使用`AND`、`OR`和`NOT`。
  - 警告：确保您了解在这些指令中放置括号的位置！
- [[Regular Expressions|正则表达式]]
  - 简单文本搜索的复杂但强大的替代方案。
- [[Line Continuations|行继续]]
  - 将长指令分解为多行以提高可读性。

### 查看结果

- [[Backlinks|反向链接]]
  - 从查询中的任务导航回源Markdown行。

### 控制显示

- [[Limiting|限制]]
  - 控制查询结果中显示的最大任务数，以及每组任务中的最大任务数。
- [[Sorting|排序]]
  - 定义排序顺序。
- [[Grouping|分组]]
  - 定义标题来分组任务。
- [[Layout|布局]]
  - 隐藏和显示查询结果的各个元素。

## 查询技巧

### 查询指令中的大写字母 - 不区分大小写

> [!released]
> 在查询指令中使用大写字母的能力在Tasks 5.2.0中引入。

几乎所有Tasks查询指令现在都不区分大小写：它们现在可以用大写字母输入。这对于在手机上输入和强调重要单词特别有用。

例如，以下指令是相同的：

- `due before tomorrow`
- `Due before tomorrow`
- `due BEFORE Tomorrow`

这种灵活性的唯一例外是：

- 当[[Combining Filters|组合过滤器]]时，布尔运算符如`AND`、`OR`和`NOT`仍必须大写。
- 在[[Regular Expressions|正则表达式]]中，搜索模式和标志仍然区分大小写。
- [[Custom Filters|自定义过滤器]]、[[Custom Sorting|自定义排序]]和[[Custom Grouping|自定义分组]]中表达式的代码仍然区分大小写。

### 为什么我的查询不工作？

如果查询给出意外结果，请参阅[[Explaining Queries|解释查询]]并添加`explain`指令。

## 查询的限制

### 任务在查询结果中不缩进

默认情况下，结果列表将列出未缩进的任务。

> [!tip]
> 使用`show tree`指令在查询结果中缩进任务和列表项。请参阅[[Layout#Hide and Show Tree|隐藏和显示树]]。
>
> ![Sample search results with 'show tree' instruction](../images/show-tree.png)
<span class="caption">带有'show tree'指令的示例搜索结果</span>

您可以在以下位置查看相关功能请求：

- ["scope: sub-tasks and super-tasks" Issues](https://github.com/obsidian-tasks-group/obsidian-tasks/issues?q=is%3Aopen%20label%3A%22scope%3A%20sub-tasks%20and%20super-tasks%22%20is%3Aissue%20)
- ["scope: sub-tasks and super-tasks" Discussions](https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/categories/ideas-any-new-feature-requests-go-in-issues-please?discussions_q=is%3Aopen+label%3A%22scope%3A+sub-tasks+and+super-tasks%22+category%3A%22Ideas%3A+Any+New+Feature+Requests+go+in+Issues+please%22+sort%3Atop)

### 脚注不在查询结果中显示

> [!warning]
> 结果列表将不包含原始任务的任何脚注。
> 脚注将*不会*被传递到带有```tasks块的文档中。我们在[issue #2571](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2571)中跟踪此问题。

另请参阅[[Getting Started#Tasks with Footnotes|入门指南#带脚注的任务]]。
