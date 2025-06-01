---
publish: true
---

# 全局查询

## 概述

> [!released]
全局查询设置在Tasks 3.5.0中添加。

全局查询是[[Global Filter|全局过滤器]]的强大而灵活的替代方案。

您可以在设置中设置全局查询，Tasks将添加到库中所有查询的开头。

> [!example]
> 将全局查询设置为`path includes /tasks`，以下任务块：
>
> ````text
> ```tasks
> tags include work
> ```
> ````
>
> 将运行为：
>
> ````text
> ```tasks
> path includes /tasks
> tags include work
> ```
> ````

## 忽略全局查询

如果您需要在给定的Tasks块中忽略全局查询，可以在块的任何位置添加`ignore global query`指令。

例如，这允许您默认让任务搜索忽略某些文件夹。然后在少数搜索中，您可以启用在这些文件夹中搜索任务。

> [!example]
>
> ```text
> tags include work
> ignore global query
> ```

> [!note]
> 在全局查询本身内使用`ignore global query`是无害的，但会被忽略。

> [!released]
`ignore global query`指令在Tasks 4.6.0中添加。

## 示例

目前，任务块中允许的任何查询也可以作为您的全局查询。此功能对于默认为所有查询应用[过滤器](Filters)或[布局选项](Layout)特别有用。

> [!warning]
> 并不总是可以覆盖在全局查询中设置的过滤器。我们在[issue #2074](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2074)中跟踪此问题。

### [[Layout|布局]]

> [!example]
> **开启简短模式**
>
> ````text
> ```tasks
> short mode
> ```
> ````
>
> > [!info]
> > 您可以在任务块中使用`full mode`覆盖此设置

> [!example]
> **隐藏优先级**
>
> ````text
> ```tasks
> hide priority
> ```
> ````
>
> > [!info]
> > 您可以在任务块中使用`show priority`覆盖此设置

> [!example]
> **显示最多50个任务**
>
>
> ````text
> ```tasks
> limit 50
> ```
> ````
>
> > [!info]
> > 您可以通过在该任务块中指定新限制来覆盖此设置

### [[Filters|过滤器]]

> [!example]
> **仅显示特定标题下的任务**
>
> ````text
> ```tasks
> heading includes Task
> ```
> ````

> [!example]
> **排除特定路径的任务**
>
> ````text
> ```tasks
> path regex does not match /^_templates/
> ```
> ````

## 设置

[[Settings|Tasks选项面板]]中的以下设置控制库的全局查询：

![Image of the settings options for the global query, showing the default settings.](../images/settings-global-query.png)

更改全局查询应该无需重启Obsidian即可生效，但打开的查询可能需要刷新。
