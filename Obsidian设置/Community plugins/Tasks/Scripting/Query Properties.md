---
publish: true
---

# 查询属性

<span class="related-pages">#feature/scripting</span>

> [!released]
>
> - 查询属性在Tasks 4.7.0中引入。
> - 在不使用占位符的情况下在自定义过滤器和自定义分组中直接使用它们，这在Tasks 5.1.0中引入。

## 简介

在越来越多的位置，Tasks允许对包含搜索查询的文件属性进行程序化/脚本化访问：

- [[Placeholders|占位符]]
- [[Custom Filters|自定义过滤器]]
- [[Custom Sorting|自定义排序]]
- [[Custom Grouping|自定义分组]]

本页面记录了查询中所有可以访问的可用信息片段。

## 查询文件属性的值

<!-- placeholder to force blank line before included text --><!-- include: QueryProperties.test.query_file_properties.approved.md -->

| 字段 | 类型 | 示例 |
| ----- | ----- | ----- |
| `query.file.path` | `string` | `'root/sub-folder/file containing query.md'` |
| `query.file.pathWithoutExtension` | `string` | `'root/sub-folder/file containing query'` |
| `query.file.root` | `string` | `'root/'` |
| `query.file.folder` | `string` | `'root/sub-folder/'` |
| `query.file.filename` | `string` | `'file containing query.md'` |
| `query.file.filenameWithoutExtension` | `string` | `'file containing query'` |
| `query.file.hasProperty('task_instruction')` | `boolean` | `true` |
| `query.file.hasProperty('non_existent_property')` | `boolean` | `false` |
| `query.file.property('task_instruction')` | `string` | `'group by filename'` |
| `query.file.property('non_existent_property')` | `null` | `null` |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

1. `query.file`是一个`TasksFile`对象。
1. 您可以查看当前的[TasksFile源代码](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/src/Scripting/TasksFile.ts)，探索其功能。
1. `.md`文件扩展名的存在是为了匹配Tasks过滤器指令[[Filters#File Path|path]]和[[Filters#File Name|filename]]中的现有约定。
1. `query.file.pathWithoutExtension`在Tasks 4.8.0中添加。
1. `query.file.filenameWithoutExtension`在Tasks 4.8.0中添加。
1. `query.file.hasProperty()`在Tasks 7.15.0中添加。
1. `query.file.property()`在Tasks 7.15.0中添加。

## 查询搜索属性的值

<!-- placeholder to force blank line before included text --><!-- include: QueryProperties.test.query_search_properties.approved.md -->

| 字段 | 类型 | 示例 |
| ----- | ----- | ----- |
| `query.allTasks` | `Task[]` | `[... 包含库中所有Tasks跟踪任务的数组 ...]` |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

1. `query.allTasks`提供对Tasks从库中读取的所有任务的访问。
    - 如果启用了[[Global Filter|全局过滤器]]，则只包含包含全局过滤器的任务。
    - [[Global Query|全局查询]]不影响`query.allTasks`：包含Tasks插件跟踪的所有任务。
    - 查看[[Task Properties|任务属性]]了解每个任务上的可用属性。
    - `query.allTasks`在Tasks 6.1.0中添加。

## 相关页面

另请参阅[[Query File Defaults|查询文件默认值]]，了解从预定义的Obsidian属性生成查询指令的机制。
