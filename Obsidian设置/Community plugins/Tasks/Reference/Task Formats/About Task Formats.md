---
publish: true
---

# 关于任务格式

<span class="related-pages">#task-formats #index-pages</span>

## 什么是"任务格式"？

在这个项目中，我们使用"任务格式"来指代在Markdown任务行中包含的字符，用于表达该任务的属性，例如到期日期和优先级。

自创建以来，Tasks插件一直只使用表情符号字符，如📅和⏫。

## 选择任务格式

> [!released]
> 在Tasks 3.3.0中引入。

您现在可以选择Tasks用于读取和写入任务行数据的任务格式：

![选择任务格式的设置选项截图](settings-task-format.png)

## 支持的任务格式

Tasks支持这些任务格式：

- [[Tasks Emoji Format|Tasks表情符号格式]] - 默认格式
  - `⏫ 🔁 every day when done`
  - `🛫 2023-04-05 ⏳ 2023-04-06 📅 2023-04-07`
  - `➕ 2023-04-03 ✅ 2023-04-08`
- [[Dataview Format|Dataview格式]]
  - `[priority:: high], [repeat:: every day when done]`
  - `[start:: 2023-04-05], [scheduled:: 2023-04-06], [due:: 2023-04-07]`
  - `[created:: 2023-04-03], [completion:: 2023-04-08]`
  - **注意：** 请务必阅读此格式的文档，因为Tasks和Dataview解释之间存在一些重要差异。

## 非默认任务格式对Tasks行为的影响

> [!Warning]
> 在对多种格式的初始支持中，**Tasks一次只支持读取和写入一种格式**。
>
> 如果您选择Dataview格式，Tasks将不再读取任何自己的表情符号标识符（直到您将格式改回Tasks为止）。
>
> 我们在[issue #1891](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1891)中跟踪这个问题，Tasks将在未来版本中学会*读取*所有支持的任务格式。

### 尊重所选格式的Tasks功能

所选的任务格式决定Tasks插件如何读取和写入任务数据。

以下功能使用所选格式：

- **任务行的读取和写入**
  - 这些将**仅**使用所选格式。
- **实时预览**
- [[Create or edit Task|创建或编辑任务]]模态框以所选格式保存任务
  - 请注意，在编辑任务时，它以默认（表情符号）格式显示当前值。
- [[Auto-Suggest|自动建议]]
  - 请注意，对于dataview格式，您应该首先输入所选的括号 - `[]`或`()` - 然后开始输入以选择要在括号中插入的字段。

### 不尊重所选格式的Tasks功能

在对多种格式的早期支持中，以下功能尚未使用所选格式，而是使用默认（表情符号）格式：

- **阅读模式**
  - 在阅读模式下查看包含任务行的笔记时，任务数据以表情符号显示，无论用户选择的任务格式如何。
  - 我们在[issue #1889](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1889)中跟踪这个问题。
- **Tasks查询块中任务的显示**
  - 查看包含任务搜索结果的笔记时，任务数据以表情符号显示，无论用户选择的任务格式如何。
  - 我们在[issue #1890](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1890)中跟踪这个问题。

## 任务格式支持的限制

- 任务行上字段的顺序仍然很重要。
  - 参见[[Auto-Suggest#What do I need to know about the order of items in a task?|自动建议#关于任务项目顺序我需要了解什么？]]
  - 我们在[issue #1505](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1505)中跟踪这个问题。
  - 参见[[Find tasks with invalid data#Finding unread emojis|查找具有无效数据的任务#查找未读表情符号]]来查找和修复任何带有未读表情符号值的任务。
- 目前，Tasks一次只支持一种格式（如上所述）。
  - 如果您选择Dataview格式，它将不再读取或写入Tasks表情符号标识符。
  - 我们在[issue #1891](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1891)中跟踪这个问题。
- Tasks中没有将保险库从一种任务格式转换为另一种的功能。
