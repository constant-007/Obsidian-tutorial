---
publish: true
---

# 入门指南

## 在您的库中查找任务

Tasks跟踪您库中的清单项目。
创建新任务的最简单方法是创建一个新的清单项目。
清单项目的markdown语法是以带空格的方括号开头的列表项：

```text
- [ ] 倒垃圾
```

现在Tasks跟踪您需要倒垃圾！

> [!Info]
> 您可以使用以下任何列表样式编写任务：
>
> ```text
> - [ ] 以连字符开头的任务
>
> * [ ] 以星号开头的任务
>
> + [ ] 以加号开头的任务
>
> 1. [ ] 带有 `.` 字符的编号列表中的任务
>
> 2) [ ] 带有 `)` 字符的编号列表中的任务
> ```

> [!released]
>
> - 对带有 `+` 的任务的支持在Tasks 4.5.0中引入。
> - 对带有 `)` 的编号列表的支持在Tasks 7.18.5中引入。

要在markdown文件中列出所有未完成的任务，只需添加一个[[About Queries|查询]]作为tasks代码块，如下所示：

````markdown
    ```tasks
    not done
    ```
````

## 为您的任务添加数据（可选）

现在您有了所有未完成任务的列表！这足以开始使用tasks。
您可以_可选地_开始使用Tasks提供的其他功能之一或多个。
例如，[[Priority|优先级]]或[[Dates#Start date|日期]]。

本Tasks用户指南几乎完全使用表情符号为您的任务添加数据。

但是，如果您更喜欢使用文本而不是表情符号，请参阅[[About Task Formats|关于任务格式]]了解其他选项。

## 轻松编辑任务

创建任务的更便捷方法是使用命令面板中的`Tasks: Create or edit`命令。
您也可以为该命令绑定快捷键。
该命令将解析编辑器中当前行的内容并预填充一个模态框。
在模态框中，您可以更改任务的描述、截止日期和重复规则以创建重复任务。

您可以在[[Create or edit Task|'Create or edit Task' Modal]]中了解更多信息。

有关截止日期和重复以及许多其他功能的更多详细信息，请参阅"入门指南"中的其他页面。

您无法在模态框中切换任务的（未）完成状态。
为此，请执行以下操作之一。

## 完成任务

有两种方法将任务标记为完成：

1. 在预览模式下，单击任务开头的复选框以在"待办"和"已完成"状态之间切换。
2. 在编辑模式下，使用命令`Tasks: Toggle Done`。
    - 只有当光标位于带有清单项目的行上时，该命令才可用。
    - 您可以将该命令映射到快捷键，以便在编辑器视图中快速切换状态（我建议用它替换原始的"切换清单状态"）。
    - 如果清单项目不是任务（例如由于全局过滤器），该命令将像常规清单项目一样切换它。

"已完成"的任务将在其行末尾附加完成日期。
例如：`✅ 2021-04-09` 表示任务在2021年4月9日完成。

## 限制和警告

### 更新Tasks插件后重启

> [!warning]
> 每当Tasks表现异常时，**请尝试重启Obsidian**。

### 多行清单项目

> [!warning]
> Tasks只支持**单行清单项目**。

通过此插件渲染的任务列表**以及**构建任务列表的清单项目
只渲染项目的第一行。
多行清单项目中第一行之后的文本
被忽略（但在存储的`.md`文件中不受影响）。

这样可以工作：

```markdown
-   [ ] 这是一个任务
    -   这是一个子项目
    -   另一个子项目
    -   [ ] 还有一个子任务
        -   更多详细信息
```

以下_不起作用：_

```markdown
-   [ ] 这个任务从这一行开始
        然后它的描述在下一行继续
```

我们在[issue #2061](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2061)中跟踪此问题。

### 编号列表中的任务

Tasks可以读取**编号列表**中的任务。

> [!released]
>
> - 读取编号列表内任务的功能在Tasks 1.20.0中引入。
> - 读取带有`)`的编号列表内任务的功能在Tasks 7.18.5中引入。

例如：

```markdown
1. [ ] 执行第一步
2. [ ] 执行下一步
3. [ ] 执行后续步骤
```

或：

```markdown
1) [ ] 执行第一步
2) [ ] 执行下一步
3) [ ] 执行后续步骤
```

编辑和切换编号列表中的任务工作正常：原始编号得以保留。

> [!warning]
> 但是，当这些任务在任务块中显示时，它们显示为普通的项目符号列表项。
>
> 这是因为它们通常以与原始列表完全不同的顺序显示，经常与项目符号列表中的任务混合在一起。在这种情况下，原始编号就没有意义了。

### 块引用和标注中的任务

<!-- force a blank line --><!-- include: snippet-callout-titles-bug.md -->

> [!Warning] 警告：Obsidian 1.6.0到1.6.3版本中的错误导致某些任务无法找到
> 请参阅[[Missing tasks in callouts with some Obsidian 1.6.x versions|某些Obsidian 1.6.x版本中标注中缺失的任务]]了解如何==让Obsidian 1.6.5修复其元数据缓存==，以防它被早期的1.6.x版本破坏。

<!-- force a blank line --><!-- endInclude -->
Tasks可以读取[块引用](https://www.markdownguide.org/basic-syntax/#blockquotes-1)或[Obsidian内置标注](https://help.obsidian.md/How+to/Use+callouts)内的任务。

> [!released]
读取标注和块引用内任务的功能在Tasks 1.11.1中引入

> [!warning]
> 但是，在以下非常特定的情况下，Tasks无法添加或删除完成日期或创建重复任务的下一个副本：
 >
 > - Obsidian处于**实时预览**编辑器模式（右下角的铅笔图标），
 > - 并且任务的markdown在**标注**中，
 > - 并且用户**点击了任务的复选框**来完成或重新打开任务。

如果您在这种情况下切换任务状态，您将看到警告。使用命令`Tasks: Toggle Done`，或切换到阅读视图（右下角的书本图标）来点击复选框。

从`tasks`查询块点击其复选框完成任务_将_在任何编辑器模式下工作，即使查询在标注内。

我们在[issue #1768](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1768)中跟踪此问题。

> [!warning]
> 当任务在标注中时，标注中的任何前置标题不会被Tasks读取，因此`group by heading`使用标注外的前一个标题 - 如果没有则为`(No Heading)`。

我们在[issue #1989](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1989)中跟踪此问题。

### Canvas中的任务

> [!warning]
> Tasks无法读取**Obsidian Canvas卡片**中的任务。

我们在[issue #2100](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2100)中跟踪此问题。

### 代码块中的任务

> [!warning]
> Tasks无法读取**代码块内**的任务，例如**Admonitions插件**使用的那些。请改用Obsidian的内置标注。

### 注释中的任务

Obsidian支持两种**注释**样式：

- `<!-- 我是注释中的文本 -->`
- `%% 我是注释中的文本 %%`

> [!warning]
> 按设计，Tasks**不会**读取这些注释内的任何任务，因为Obsidian不会读取它们。

### 带脚注的任务

> [!warning]
> Tasks只能渲染**内联脚注**。不支持常规脚注。

```markdown
-   [ ] 这是一个任务^[带有工作的内联脚注]
-   [ ] 这个脚注_不会工作_[^notworking]
```

另请参阅[[About Queries#Footnotes are not displayed in query results|查询结果中不显示脚注]]。

### 带块引用的任务

> [!warning]
> Tasks对**任务内块引用**的支持有限。它渲染正确，但由于Tasks只支持单行，任务的元数据将在块引用内。

### 在'松散'列表中渲染任务

> [!warning]
> 如果您有带空行的列表（通常称为['松散'列表](https://spec.commonmark.org/0.30/#loose)），Tasks不会渲染**列表项周围的空格**。

```markdown
-   [ ] 空行前的第一个任务

-   [ ] 另一个任务。上面的空行_不会_导致任务间距更大。
```

### 元数据/表情符号的顺序

> [!warning]
> Tasks**从行末向后**读取任务行，寻找带有值的元数据表情符号、标签和块链接。一旦找到它不认识的值，就停止读取。

这意味着您只能在日期、优先级、重复规则等元数据之后放置**块链接**（`^link-name`）和**标签**。其他任何内容都会破坏日期、优先级和重复规则的解析。

```markdown
-   [ ] 优先级放在标签前的任务 _优先级将被识别_ 🔼 #tag
-   [ ] 日期放在标签前的任务 _日期将被识别_ 📅 2021-04-09 #tag
-   [ ] 日期放在其他文本前的任务 _日期将不被识别_ 📅 2021-04-09 其他文本
-   [ ] 带块链接的任务 _有效_ 📅 2021-04-09 ^e5bebf
```

我们在[issue #1505](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1505)中跟踪此问题。

如果您担心任务中的某些值没有按预期解析，也许是因为Tasks搜索找不到任务，您可以：

- 在[[Create or edit Task|'Create or edit Task' Modal]]中查看单个任务
- 搜索所有可能的问题：请参阅[[Find tasks with invalid data#Finding unread emojis|查找未读表情符号]]。

如果**描述字段中有任何Tasks表情符号可见**，请关闭模态框并删除或向左移动任何无法识别的文本。

![Create or Edit Modal](../images/modal-showing-unparsed-emoji.png)
<br>`Tasks: Create or edit`模态框显示由于尾随`其他文本`而未解析的截止日期。

### 支持的文件名

> [!warning]
> Tasks只支持文件扩展名为`.md`的markdown文件中的清单项目。
