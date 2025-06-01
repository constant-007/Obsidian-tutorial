---
publish: true
---

# 完成时

> [!tip]
> 如果您曾经希望Tasks能够自动对您完成的任务*执行某些操作*（*特别是*如果您使用[[Recurring Tasks|重复任务]]，这些任务往往会在包含它们的笔记中累积），那么**"完成时"**功能可能就是答案！

> [!released]
> 在Tasks 7.8.0中引入。

## 介绍

Obsidian Tasks可以在任务被标记为"已完成"时自动执行操作。

此功能通过在任务中添加（在描述*之后*）一个字段来启用，该字段包含：

- *方格旗*🏁表情符号***标识符***，后跟
- 一个字符串，标识在项目完成时要采取的所需***操作***。

> [!info]
> 如果您正在使用Tasks的[[Dataview Format|Dataview格式]]，则不使用🏁表情符号，而是在`[onCompletion:: ]`中的双冒号后跟所需的***操作***。

## 支持的操作

目前，支持这些"完成时"***操作***：

| 操作     | 行为                                                                         |
| ---------- | --------------------------------------------------------------------------------- |
| **Keep**   | 对刚完成的任务不执行任何操作。（这是默认操作。） |
| **Delete** | 删除任务的已完成实例。                                       |

> [!tip]
> 正在考虑为将来的实现添加几个额外的***操作***，即将刚完成的任务移动到：
>
> - 单独的"已完成任务存档"笔记，
>   - 请参阅[issue #2855](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2855)
> - 原始宿主笔记中的"已完成任务列表"，
>   - 请参阅[issue #2856](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2856)
> - 列表的末尾。
>   - 请参阅[discussion #2426](https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/2426)。

## 工作示例

### 演示

> [!info]
> 为了保持简单，以下假设**Tasks**配置为不使用[[Global Filter|全局过滤器]]，也不在您完成任务时添加[[Dates#Done date|完成日期]]。

> [!example] 假设您的库包含一个名为`My Project.md`的单个笔记文件，内容如下：
>
> ```text
> # My Project Tasks
> - [ ] Leave me alone
> - [ ] Leave me alone too! 🏁 keep
> - [ ] Delete me upon completion 🏁 delete
> - [ ] Delete my completed instance, leave my next instance 📅 2021-05-20 🔁 every day when done 🏁 delete
> ```

> [!success] 使用插件的默认设置，在*使用Tasks*将每个任务标记为"已完成"后，您的`My Project`笔记文件将包含：
>
> ```text
> # My Project Tasks
> - [x] Leave me alone
> - [x] Leave me alone too! 🏁 keep
> - [ ] Delete my completed instance, leave my next instance 📅 2021-05-21 🔁 every day when done 🏁 delete
> ```

> [!note] 请注意
>
> - 分配了`keep`操作的任务与根本没有onCompletion字段的任务处理方式相同，并且
> - 重复任务的下一个实例已替换了原始的已完成实例。

### 不要破坏您的嵌套任务

> [!warning] ***永远不要***在具有[嵌套任务或列表项](https://help.obsidian.md/Editing+and+formatting/Basic+formatting+syntax#Nesting+lists)（也称为子项目或子项）的任务上放置`🏁 delete`。
>
> 不要这样做：
>
> ```text
> - [ ] Delete me upon completion 🏁 delete
>     - [ ] I am a nested task
>     - I am a nested list item.
> ```
>
> 当第一个任务完成时，文本将变成：
>
> ```text
>     - [ ] I am a nested task
>     - I am a nested list item.
> ```
>
> 这两行现在缩进了，这意味着它们现在形成了一个代码块，而不是列表！
>
> | 之前：2个任务和一个列表项 | 之后：没有任务，只有一个代码块 |
> | ------------------------------- | ---------------------------------- |
> | ![[on-completion-before.png]]   | ![[on-completion-after.png]]       |
>
> 如果发生这种情况，Tasks尚未发出任何警告。

## 分配和更改给定任务的"完成时"操作

可以使用[[Auto-Suggest|自动建议]]添加"完成时"标识符和所需的**操作**标识符，以节省手动输入它们的时间。

我们最终还将启用[[Create or edit Task|'Create or edit Task' Modal|'创建或编辑任务'模态对话框]]来编辑"完成时"**操作**。我们在[issue #3222](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/3222)中跟踪此问题。
