---
publish: true
---

# 任务属性

<span class="related-pages">#feature/scripting</span>

> [!released]
> 任务属性在Tasks 4.0.0中引入。

## 简介

在越来越多的位置，Tasks允许对您任务中的值进行程序化/脚本化访问：

- [[Grouping#Custom Groups|分组#自定义分组]]
- [[Sorting#Custom Sorting|排序#自定义排序]]
- [[Filters#Custom Filters|过滤器#自定义过滤器]]

本页面记录了您可以在Tasks中访问的所有可用信息片段。

<!-- NEW_TASK_FIELD_EDIT_REQUIRED - Add a note in the relevant bullet list, to record when the new field was added. (No need to add a new table row manually here.) -->

## 任务状态的值

更多信息，包括添加您自己的自定义状态，请参阅[[Statuses|状态]]。

<!-- placeholder to force blank line before included text --><!-- include: TaskProperties.test.task_status.approved.md -->

| 字段 | 类型1 | 示例1 | 类型2 | 示例2 |
| ----- | ----- | ----- | ----- | ----- |
| `task.isDone` | `boolean` | `false` | `boolean` | `false` |
| `task.status.name` | `string` | `'Todo'` | `string` | `'In Progress'` |
| `task.status.type` | `string` | `'TODO'` | `string` | `'IN_PROGRESS'` |
| `task.status.typeGroupText` | `string` | `'%%2%%TODO'` [^commented] | `string` | `'%%1%%IN_PROGRESS'` [^commented] |
| `task.status.symbol` | `string` | `' '` | `string` | `'/'` |
| `task.status.nextSymbol` | `string` | `'x'` | `string` | `'x'` |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

1. `task.status.typeGroupText`（在Tasks 4.9.0中添加）是在自定义分组函数中将状态类型排序为自然顺序的便捷方法。

## Tasks中日期的值

<!-- placeholder to force blank line before included text --><!-- include: TaskProperties.test.task_dates.approved.md -->

| 字段 | 类型1 | 示例1 | 类型2 | 示例2 |
| ----- | ----- | ----- | ----- | ----- |
| `task.created` | `TasksDate` | `2023-07-01 00:00` | `TasksDate` | `` |
| `task.start` | `TasksDate` | `2023-07-02 00:00` | `TasksDate` | `` |
| `task.scheduled` | `TasksDate` | `2023-07-03 00:00` | `TasksDate` | `` |
| `task.due` | `TasksDate` | `2023-07-04 00:00` | `TasksDate` | `` |
| `task.cancelled` | `TasksDate` | `2023-07-06 00:00` | `TasksDate` | `` |
| `task.done` | `TasksDate` | `2023-07-05 00:00` | `TasksDate` | `` |
| `task.happens` | `TasksDate` | `2023-07-02 00:00` | `TasksDate` | `` |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

1. 这些值中的每一个都是`TasksDate`对象。下面的[[#TasksDate属性中的值]]部分显示了可以对它们做什么。
1. 注意，目前所有存储的日期都没有时间，或者更确切地说，它们的时间是本地时间一天开始时的午夜。
1. 有关日期属性的示例用法，请参阅[[Filters#Due Date|过滤器#到期日期]]和[[Grouping#Due Date|分组#到期日期]]。
1. `task.happens`是`task.due`、`task.scheduled`和`task.start`中较早的那个。
1. `task.cancelled`在Tasks 5.5.0中添加。

## TasksDate属性中的值

<!-- placeholder to force blank line before included text --><!-- include: TaskProperties.test.task_date_fields.approved.md -->

| 字段 | 类型1 | 示例1 | 类型2 | 示例2 |
| ----- | ----- | ----- | ----- | ----- |
| `task.due` | `TasksDate` | `2023-07-04 00:00` | `TasksDate` | `` |
| `task.due.moment` | `Moment` | `moment('2023-07-04 00:00')` | `null` | `null` |
| `task.due.formatAsDate()` | `string` | `'2023-07-04'` | `string` | `''` |
| `task.due.formatAsDate('no date')` | `string` | `'2023-07-04'` | `string` | `'no date'` |
| `task.due.formatAsDateAndTime()` | `string` | `'2023-07-04 00:00'` | `string` | `''` |
| `task.due.formatAsDateAndTime('no date')` | `string` | `'2023-07-04 00:00'` | `string` | `'no date'` |
| `task.due.format('dddd')` | `string` | `'Tuesday'` | `string` | `''` |
| `task.due.format('dddd', 'no date')` | `string` | `'Tuesday'` | `string` | `'no date'` |
| `task.due.toISOString()` | `string` | `'2023-07-04T00:00:00.000Z'` | `string` | `''` |
| `task.due.toISOString(true)` | `string` | `'2023-07-04T00:00:00.000+00:00'` | `string` | `''` |
| `task.due.category.name` | `string` | `'Future'` | `string` | `'Undated'` |
| `task.due.category.sortOrder` | `number` | `3` | `number` | `4` |
| `task.due.category.groupText` | `string` | `'%%3%% Future'` [^commented] | `string` | `'%%4%% Undated'` [^commented] |
| `task.due.fromNow.name` | `string` | `'in 22 days'` | `string` | `''` |
| `task.due.fromNow.sortOrder` | `number` | `320230704` | `number` | `0` |
| `task.due.fromNow.groupText` | `string` | `'%%320230704%% in 22 days'` [^commented] | `string` | `''` |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

1. 这些示例引用`task.due`，但它们可以用于上面[[#Tasks中日期的值]]部分显示的任何日期属性。
1. `TasksDate`格式化方法使用[moment.js格式字符](https://momentjs.com/docs/#/displaying/format/)。
1. `TasksDate`格式化方法都接受一个可选的`fallBackText`字符串值，这是当没有日期时要使用的值。<br>`fallBackText`值可以是以下任意之一：
    - 固定字符串，例如`'no date'`，
    - [[Expressions|表达式]]，例如`task.priorityName`或`task.priorityNameGroupText`，
    - 空字符串`''`或`""`，意味着"不为缺少此日期属性的任务添加标题"。
1. 您可以查看当前的[TasksDate源代码](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/src/DateTime/TasksDate.ts)，以探索其实现。
1. `task.due.toISOString(true)`防止UTC转换 - 请参阅[moment文档](https://momentjs.com/docs/#/displaying/as-iso-string/)
1. `category`将日期分为5个命名组：
    - `Invalid date`
    - `Overdue`
    - `Today`
    - `Future`
    - `Undated`
    - 它们按照上面列出的顺序编号为0、1、2、3和4。
1. `fromNow`按[距离现在的时间](https://momentjs.com/docs/#/displaying/fromnow/)对日期进行分组，例如：
    - `2 months ago`
    - `8 days ago`
    - `in 11 hours`
    - `in 5 days`
    - `in 3 months`
    - `in a year`
1. `category`属性在Tasks 4.9.0中添加。
    - `Invalid date`类别在Tasks 6.0.0中添加。
1. `fromNow`属性在Tasks 4.9.0中添加。

## 任务依赖关系的值

<!-- placeholder to force blank line before included text --><!-- include: TaskProperties.test.task_dependency_fields.approved.md -->

| 字段 | 类型1 | 示例1 | 类型2 | 示例2 |
| ----- | ----- | ----- | ----- | ----- |
| `task.id` | `string` | `'abcdef'` | `string` | `''` |
| `task.dependsOn` | `string[]` | `['123456', 'abc123']` | `any[]` | `[]` |
| `task.isBlocked(query.allTasks)` | `boolean` | `false` | `boolean` | `false` |
| `task.isBlocking(query.allTasks)` | `boolean` | `false` | `boolean` | `false` |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

1. 请参阅[[Task Dependencies|任务依赖关系]]页面，该页面解释了依赖关系功能。
1. `Task.isBlocked()`的行为与`is blocked`相同：请参阅[[Filters#Blocked Tasks|过滤器#被阻塞的任务]]。
1. `Task.isBlocking()`的行为与`is blocking`相同：请参阅[[Filters#Blocking Tasks|过滤器#阻塞任务]]。
1. 任务依赖关系在Tasks 6.1.0中发布。

## 其他任务属性的值

<!-- placeholder to force blank line before included text --><!-- include: TaskProperties.test.task_other_fields.approved.md -->

| 字段 | 类型1 | 示例1 | 类型2 | 示例2 |
| ----- | ----- | ----- | ----- | ----- |
| `task.description` | `string` | `'Do exercises #todo #health'` | `string` | `'minimal task'` |
| `task.descriptionWithoutTags` | `string` | `'Do exercises'` | `string` | `'minimal task'` |
| `task.priorityNumber` | `number` | `2` | `number` | `3` |
| `task.priorityName` | `string` | `'Medium'` | `string` | `'Normal'` |
| `task.priorityNameGroupText` | `string` | `'%%2%%Medium priority'` [^commented] | `string` | `'%%3%%Normal priority'` [^commented] |
| `task.urgency` | `number` | `3.3000000000000007` | `number` | `1.9500000000000002` |
| `task.isRecurring` | `boolean` | `true` | `boolean` | `false` |
| `task.recurrenceRule` | `string` | `'every day when done'` | `string` | `''` |
| `task.onCompletion` | `string` | `'delete'` | `string` | `''` |
| `task.tags` | `string[]` | `['#todo', '#health']` | `any[]` | `[]` |
| `task.originalMarkdown` | `string` | `'  - [ ] Do exercises #todo #health 🆔 abcdef ⛔ 123456,abc123 🔼 🔁 every day when done 🏁 delete ➕ 2023-07-01 🛫 2023-07-02 ⏳ 2023-07-03 📅 2023-07-04 ❌ 2023-07-06 ✅ 2023-07-05 ^dcf64c'` | `string` | `'- [/] minimal task'` |
| `task.lineNumber` | `number` | `17` | `number` | `0` |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

1. `task.description`的开头和结尾的空格被去除。
1. `task.description`包含任何标签。
1. `task.priorityName`和`task.priorityNumber`的值是：
    - 'Highest': 0
    - 'High': 1
    - 'Medium': 2
    - 'Normal': 3
    - 'Low': 4
    - 'Lowest': 5
1. `task.priorityNameGroupText`（在Tasks 4.9.0中添加）是在自定义分组函数中将优先级名称排序为自然顺序的便捷方法。
1. `task.isRecurring`是：
    - `true`如果任务有**有效的**重复规则，
    - `false`如果：
        - **要么**它没有重复规则
        - **要么**重复规则无效（例如`🔁  every seven weeks`）。
1. `task.recurrenceRule`是：
    - **要么**如果任务有**有效的**重复规则，则是重复规则的标准化文本
        - 一个示例可能是`every 7 weeks`。
        - 注意，此文本是程序化生成和标准化的，因此可能与任何手动输入任务中的文本不完全匹配。
        - 例如，一个带有`🔁 every Sunday`的任务将有一个`task.recurrenceRule`值为`every week on Sunday`。
    - **要么**空字符串（`''`）如果：
        - **要么**它没有重复规则，
        - **要么**重复规则无效（例如`🔁  every seven weeks`）。
1. `task.onCompletion`（在Tasks 7.8.0中添加）将有以下值之一：
    - `delete`
    - `keep`
    - ``（空字符串），这是默认值，当任务没有指定[[On Completion|完成时]]操作时。
1. 注意，如果在设置中启用了[[Global Filter|全局过滤器]]，并且过滤器是标签，它将从`task.tags`中移除。

## 文件属性的值

<!-- placeholder to force blank line before included text --><!-- include: TaskProperties.test.task_file_properties.approved.md -->

| 字段 | 类型1 | 示例1 | 类型2 | 示例2 |
| ----- | ----- | ----- | ----- | ----- |
| `task.file.path` | `string` | `'some/folder/fileName.md'` | `string` | `''` |
| `task.file.pathWithoutExtension` | `string` | `'some/folder/fileName'` | `string` | `''` |
| `task.file.root` | `string` | `'some/'` | `string` | `'/'` |
| `task.file.folder` | `string` | `'some/folder/'` | `string` | `'/'` |
| `task.file.filename` | `string` | `'fileName.md'` | `string` | `''` |
| `task.file.filenameWithoutExtension` | `string` | `'fileName'` | `string` | `''` |
| `task.hasHeading` | `boolean` | `true` | `boolean` | `false` |
| `task.heading` | `string` | `'My Header'` | `null` | `null` |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

1. `task.file`是一个`TasksFile`对象。
1. 您可以查看当前的[TasksFile源代码](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/src/Scripting/TasksFile.ts)，以探索其功能。
1. `.md`文件扩展名的存在是为了匹配Tasks过滤器指令[[Filters#File Path|path]]和[[Filters#File Name|filename]]中的现有约定。
1. `task.file.pathWithoutExtension`在Tasks 4.8.0中添加。
1. `task.file.filenameWithoutExtension`在Tasks 4.8.0中添加。

[^commented]: `%% ... %%`注释内的文本被隐藏不显示。它用于控制分组标题的排序顺序。

## Obsidian属性的值

> [!released]
> 对Obsidian属性的访问在Tasks 7.7.0中引入。

这些在[[Obsidian Properties|Obsidian属性]]中有完整描述。

<!-- placeholder to force blank line before included text --><!-- include: TaskProperties.test.task_frontmatter_properties.approved.md -->

| 字段 | 类型1 | 示例1 |
| ----- | ----- | ----- |
| `task.file.hasProperty('creation date')` | `boolean` | `true` |
| `task.file.property('creation date')` | `string` | `'2024-05-25T15:17:00'` |
| `task.file.property('sample_checkbox_property')` | `boolean` | `true` |
| `task.file.property('sample_date_property')` | `string` | `'2024-07-21'` |
| `task.file.property('sample_date_and_time_property')` | `string` | `'2024-07-21T12:37:00'` |
| `task.file.property('sample_list_property')` | `string[]` | `['Sample', 'List', 'Value']` |
| `task.file.property('sample_number_property')` | `number` | `246` |
| `task.file.property('sample_text_property')` | `string` | `'Sample Text Value'` |
| `task.file.property('sample_text_multiline_property')` | `string` | `'Sample\nText\nValue\n'` |
| `task.file.property('sample_link_property')` | `string` | `'[[yaml_all_property_types_populated]]'` |
| `task.file.property('sample_link_list_property')` | `string[]` | `['[[yaml_all_property_types_populated]]', '[[yaml_all_property_types_empty]]']` |
| `task.file.property('tags')` | `string[]` | `['#tag-from-file-properties']` |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

1. `task.file.hasProperty()`和`task.file.property()`在Tasks 7.7.0中添加
1. `task.file.hasProperty('property name')`如果属性`'property name'`在文件中存在且具有非`null`值，则返回true。
1. `task.file.property('property name')`返回文件中的值，如果没有值则返回`null`。
