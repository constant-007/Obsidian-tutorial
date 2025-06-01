---
publish: true
---

# 结合Dataview和Tasks

<span class="related-pages">#plugin/dataview #task-format/dataview </span>

## Tasks和dataview

> [!released]
> Dataview格式的解析在Tasks 3.3.0中引入。

Tasks现在对读取[[Dataview Format|Dataview格式]]的数据有部分支持。

## 提高Dataview与Tasks的兼容性

[Dataview](https://github.com/blacksmithgu/obsidian-dataview)插件为Obsidian库提供了许多数据分析功能，包括关于任务的查询。
本节只描述了最大化Dataview和Tasks之间兼容性的设置；有关Dataview的所有其他信息，包括Dataview对任务表情符号字段的命名，
请参阅其[文档](https://blacksmithgu.github.io/obsidian-dataview/data-annotation/#tasks)。

> 从Dataview 0.5.43开始，除了重复之外的所有Tasks表情符号字段都可以通过Dataview或dataviewjs查询。信息在Dataview的[任务和列表的元数据](https://blacksmithgu.github.io/obsidian-dataview/annotation/metadata-tasks/)页面中。

### 自动任务完成

> [!released]
> 在Dataview 0.5.42中引入

如果您在Tasks中使用"在每个已完成任务上设置完成日期"选项，您可以配置Dataview，这样从Dataview查询结果中点击任务的复选框将添加或删除`✅ YYYY-MM-DD`完成日期，就像在Task查询结果中点击复选框或使用命令`Tasks: Toggle Done`一样。

0. 通过在"设置" -> "社区插件" -> "检查更新"中检查更新来确保Dataview是最新的。
1. 在"设置" -> "Dataview"中，向下滚动并启用"自动任务完成"设置。
2. 就在"自动任务完成"设置下方，启用"使用表情符号快捷方式完成"设置。
3. 关闭然后重新打开Obsidian。

![Dataview settings page with Tasks-style done dates enabled](../images/dataview-settings.png)
_注意：这是Dataview设置页面，不是Tasks设置页面。_

---

> [!warning]
> Dataview不理解重复任务。从Dataview TASK查询中勾选重复任务将添加完成日期，但不会生成该重复任务的新实例。
> 要从Dataview TASK查询结果中获得重复任务的正确行为，请点击任务的文本（不是复选框）转到编写任务的文件，
> 然后使用"Tasks: Toggle Done"命令或从那里点击复选框。

## 相关页面

- [[How to get tasks in current file|如何获取当前文件中的任务]] - 使用Dataview插件生成Tasks代码块的示例，以完成Tasks单独无法做到的事情。
