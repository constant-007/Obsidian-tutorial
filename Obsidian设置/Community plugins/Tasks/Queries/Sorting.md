---
publish: true
---

# 排序

<span class="related-pages">#feature/sorting</span>

<!-- NEW_QUERY_INSTRUCTION_EDIT_REQUIRED -->

## 目录

本页面很长。以下是主要部分的链接：

- [[#默认排序顺序]]
- [[#自定义排序]]
- [[#按任务状态排序]]
- [[#按任务依赖排序]]
- [[#按任务中的日期排序]]
- [[#按其他任务属性排序]]
- [[#按文件属性排序]]
- [[#多重排序条件]]
- [[#注意事项]]
- [[#反向排序]]
- [[#示例]]

## 默认排序顺序

以下指令是默认排序顺序，它们**自动附加到*每个*Tasks搜索的末尾**：

<!-- snippet: Sort.test.Sort_save_default_sort_order.approved.text -->
```text
sort by status.type
sort by urgency
sort by due
sort by priority
sort by path
```
<!-- endSnippet -->

它首先按`IN_PROGRESS`、`TODO`、`DONE`、`CANCELLED`然后`NON_TASK`的顺序对任务排序，以确保可操作的任务首先出现，这在没有像`not done`这样的过滤器的搜索中很重要。

然后按[[Urgency|紧急性]]排序，这是从几个任务属性派生的计算分数。

上述行*总是*附加到用户提供的任何`sort by`指令的末尾。没有办法禁用这个。

但是，查询中的任何`sort by`指令优先于这些默认指令。

> [!tip]
> 要以不同于默认的方式对查询结果排序，您必须在查询中添加至少一行`sort by`。您提供的排序指令将优先于附加的默认值。
>
> 将`sort by`行添加到[[Global Query|全局查询]]提供了一种覆盖**所有**搜索的默认排序顺序的方法（除了那些[[Global Query#Ignoring the global query|忽略全局查询]]的搜索）。
>
> 您可能还会发现`sort by function task.lineNumber`对覆盖默认排序顺序很有用。请参阅下面的[[#覆盖Tasks插件的默认排序顺序]]。

## 自定义排序

> [!released]
> `sort by function`在Tasks 6.0.0中引入。

Tasks提供了许多内置排序选项，但有时它们不能完全满足所有用户的需求。

现在Tasks有一个强大的机制，让您创建自己的**自定义排序顺序**，提供令人难以置信的灵活性。

在下面的文档中有许多自定义过滤指令`sort by function`的示例和解释，适用于Tasks内置指令不能满足您偏好的情况。

您可以在[[Custom Sorting|自定义排序]]中了解更多关于这个非常强大功能的信息。

## 按任务状态排序

更多信息，包括添加您自己的自定义状态，请参阅[[Statuses|状态]]。

### 状态

- `sort by status`（完成或待办）

> [!Tip]
> `sort by status.type`比`sort by status`提供了更有用的排序顺序。请参阅下面的[[#状态类型]]。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按状态自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.isDone_docs.approved.md -->

```javascript
sort by function !task.isDone
```

- `sort by function`将`true`排在`false`之前
- 因此，我们使用`!`来否定`task.isDone`，所以具有[[Status Types|状态类型]]`TODO`和`IN_PROGRESS`的任务排在`DONE`、`CANCELLED`和`NON_TASK`**之前**。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 状态名称

- `sort by status.name`（完成、待办、已取消、进行中、未知、我的非常重要的自定义状态等 - 按字母顺序排序）

> [!released]
`sort by status.name`在Tasks 1.23.0中引入。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按状态名称自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.statuses_task.status.name_docs.approved.md -->

```javascript
sort by function task.status.name
```

- 与"Sort by status.name"相同。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 状态类型

- `sort by status.type`（按`IN_PROGRESS`、`TODO`、`DONE`、`CANCELLED`然后`NON_TASK`的顺序排序）

> [!released]
`sort by status.type`在Tasks 1.23.0中引入。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按状态类型自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.statuses_task.status.type_docs.approved.md -->

```javascript
sort by function task.status.type
```

- 与"Sort by status.type"不同，这按字母顺序对状态类型排序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 状态符号

没有内置指令按状态符号排序。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按状态符号自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.statuses_task.status.symbol_docs.approved.md -->

```javascript
sort by function task.status.symbol
```

- 按状态符号排序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 下一个状态符号

没有内置指令按下一个状态符号排序。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按下一个状态符号自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.statuses_task.status.nextSymbol_docs.approved.md -->

```javascript
sort by function task.status.nextSymbol
```

- 按下一个状态符号排序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

## 按任务依赖排序

在高层次上，任务依赖定义了您希望处理一组任务的顺序。您可以在[[Task Dependencies|任务依赖]]中了解更多信息。

> [!released]
> 任务依赖在Tasks 6.1.0中引入。

### Id

- `sort by id`

更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - 任务Id在Tasks 6.1.0中引入。

自Tasks 6.1.0起，现在可以使用`task.id`**[[Custom Sorting|按Id自定义排序]]**。

### 依赖于

没有内置指令按"依赖于"排序。

更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - 任务Depends On在Tasks 6.1.0中引入。

自Tasks 6.1.0起，现在可以使用`task.dependsOn`**[[Custom Sorting|按Depends On自定义排序]]**。

## 按任务中的日期排序

### 日期如何排序

当按日期对任务排序时，例如使用`sort by due`，任务按以下顺序排序：

1. 具有**无效**`due`日期的任务排在最前面
2. 具有有效`due`日期的任务，从最早到最晚
3. 具有**没有due date**的任务排在最后。

> [!NOTE]
> 在Tasks 6.0.0之前，具有无效日期的任务排在具有有效日期的任务之后。

### 完成日期

- `sort by done`（任务完成的日期）

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按完成日期自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.dates_task.done_docs.approved.md -->

```javascript
sort by function task.done.format("dddd")
```

- 按完成日期的星期几排序，按字母顺序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 截止日期

- `sort by due`（任务截止的日期）

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按截止日期自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.dates_task.due_docs.approved.md -->

```javascript
sort by function task.due.format("dddd")
```

- 按截止日期的星期几排序，按字母顺序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.dates_task.due.advanced_docs.approved.md -->

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 计划日期

- `sort by scheduled`（任务计划的日期）

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按计划日期自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.dates_task.scheduled_docs.approved.md -->

```javascript
sort by function task.scheduled.format("dddd")
```

- 按计划日期的星期几排序，按字母顺序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 开始日期

- `sort by start`（任务开始的日期）

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按开始日期自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.dates_task.start_docs.approved.md -->

```javascript
sort by function task.start.format("dddd")
```

- 按开始日期的星期几排序，按字母顺序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 创建日期

- `sort by created`（任务创建的日期）

> [!released]
`sort by created`在Tasks 2.0.0中引入。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按创建日期自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.dates_task.created_docs.approved.md -->

```javascript
sort by function task.created.format("dddd")
```

- 按创建日期的星期几排序，按字母顺序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 取消日期

- `sort by cancelled`（任务取消的日期）

> [!released]
`sort by cancelled`在Tasks 5.5.0中引入。

自Tasks 6.0.0起，现在可以使用`task.cancelled`**[[Custom Sorting|按取消日期自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.dates_task.cancelled_docs.approved.md -->

```javascript
sort by function task.cancelled.format("dddd")
```

- 按取消日期的星期几排序，按字母顺序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Happens

- `sort by happens`（开始日期、计划日期和截止日期中的最早日期）

> [!released]
`sort by happens`在Tasks 1.21.0中引入。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按happens日期自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.dates_task.happens_docs.approved.md -->

```javascript
sort by function task.happens.format("dddd")
```

- 按happens日期的星期几排序，按字母顺序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

## Sort by Other Task Properties

### Description

- `sort by description`（任务的描述）

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按描述自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.description_docs.approved.md -->

```javascript
sort by function task.description.length
```

- 按描述长度排序，最短的在前。
- 这可能对查找需要更多信息的任务或可以减少冗长的任务有用。

```javascript
sort by function \
    const priorities = [...'🟥🟧🟨🟩🟦'];  \
    for (let i = 0; i < priorities.length; i++) {  \
        if (task.description.includes(priorities[i])) return i;  \
    }  \
    return 999;
```

- 用户为其任务描述定义了自定义系统，使用彩色方块作为自制的替代优先级系统。
- 这允许任务按其彩色方块的顺序排序。
- 如果在任务描述中找到第一个方块，函数返回0，如果找到第二个方块，返回1，依此类推。
- 如果没有找到任何方块，它返回`999`。
- 重要的是，我们对所有不包含任何方块的任务使用一致的值，以保持其原始顺序，以便任何后续的`sort by`指令仍然有效。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Description without tags

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按删除标签的描述自定义排序]]**。

值`task.descriptionWithoutTags`返回删除所有标签的描述副本，以便您可以将仅在标签上不同的任务描述排序在一起。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.descriptionWithoutTags_docs.approved.md -->

```javascript
sort by function task.descriptionWithoutTags
```

- 像`Sort by description`一样，但它从排序键中删除任何标签。
- 这可能对将同一任务的已完成重复排序在一起有用，即使某些重复中的标签不同。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Priority

- `sort by priority`（任务的优先级；"low"低于"none"：[[Priority|优先级]]）

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按优先级名称和编号自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.priorityName_docs.approved.md -->

```javascript
sort by function task.priorityName
```

- 按任务的优先级名称排序。
- 优先级名称按字母顺序显示。
- 注意默认优先级称为'Normal'，而不是`Sort by priority`中称为'None'的默认值。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.priorityNumber_docs.approved.md -->

```javascript
sort by function task.priorityNumber
```

- 按任务的优先级编号排序，最高为0，最低为5。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Urgency

- `sort by urgency`（[[Urgency|紧急性]]）

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按紧急性自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.urgency_docs.approved.md -->

```javascript
sort by function reverse task.urgency
```

- 按任务紧急性值排序。
- 我们使用`reverse`将最紧急的任务放在前面。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Recurrence

- `sort by recurring`（重复任务排在非重复任务之前：[[Recurring Tasks|重复任务]]）

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按重复自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.isRecurring_docs.approved.md -->

```javascript
sort by function task.isRecurring
```

- 按任务是否重复排序：重复任务将列在非重复任务之前。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Tags

请参阅[[Tags|标签]]，了解有关标签在Tasks插件中如何行为的重要信息。

- `sort by tag`（任务的描述）

如果您想按标签排序，默认情况下它将按描述中找到的第一个标签排序。如果您想按之后的标签排序，则可以在查询末尾指定索引。所有任务应该有相同数量的标签以获得最佳排序，并且标签顺序相同。索引从1开始，这也是默认值。

例如，此查询将按描述中找到的第二个标签排序。

    ```tasks
    sort by tag 2
    ```

> [!released]
标签排序在Tasks 1.6.0中引入。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按标签自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.tags_docs.approved.md -->

```javascript
sort by function task.tags.filter( (tag) => tag.includes("#context/")).sort().join(",")
```

- 按包含"#context/"的标签排序。
- 没有该标签的任何任务排在前面。

```javascript
sort by function reverse task.tags.length
```

- 按任务上的标签数量排序。
- `reverse`选项将标签最多的任务放在前面。

```javascript
sort by function -task.tags.length
```

- 按任务上的标签数量排序的另一种方式，仍然将标签最多的任务放在前面。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.tags.advanced_docs.approved.md -->

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Original Markdown

没有内置指令按原始markdown行排序。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按原始markdown行自定义排序]]**。

例如，这可以用于从`task.originalMarkdown`中提取Tasks不解析的信息，用于任务排序。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.originalMarkdown_docs.approved.md -->

```javascript
sort by function task.originalMarkdown
```

- 按任务在MarkDown文件中原始行的原始文本排序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Line Number

没有内置指令按任务的行号排序。

自Tasks 7.16.0起，现在可以使用`task.lineNumber`**[[Custom Sorting|按任务行号自定义排序]]**。

> [!tip]
> 使用`task.lineNumber`时，文件中的第一行是行号`0`（零），而不是`1`（一）。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.lineNumber_docs.approved.md -->

```javascript
sort by function task.lineNumber
```

- 按任务在MarkDown文件中原始行的行号排序。
- 如果您对[[Sorting#default sort order|默认排序顺序]]不满意，这很有用。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Random sorting

> [!released]
> 随机排序在Tasks 7.11.0中引入。

此指令以随机顺序对任务排序：

- `sort by random`

顺序是随机但确定性的，从任务描述计算得出，每天都会改变。

> [!example] 示例：随机选择一些任务进行审查
> 如果您有一个包含大量无日期任务的大型库，审查它们可能很繁琐：我们发现能够每天查看一小部分很有用。
>
> 每天审查您的积压任务：
>
> - 随机选择最多10个无日期任务，
> - 然后完成、更新或删除其中一些！
>
> ````text
> ```tasks
> not done
> no happens date
> limit 10
>
> sort by random
> ```
> ````

## Sort by File Properties

### File Path

- `sort by path`（包含任务的文件路径）

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按文件路径自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.file_properties_task.file.path_docs.approved.md -->

```javascript
sort by function task.file.path
```

- 像'Sort by path'一样，但包含文件扩展名。

```javascript
sort by function task.file.pathWithoutExtension
```

- 像'Sort by path'一样。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Root

没有内置指令按包含任务的顶级文件夹排序。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按根文件夹自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.file_properties_task.file.root_docs.approved.md -->

```javascript
sort by function task.file.root
```

- 启用按根文件夹排序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Folder

没有内置指令按包含任务的文件夹排序。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按文件夹自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.file_properties_task.file.folder_docs.approved.md -->

```javascript
sort by function task.file.folder
```

- 启用按包含任务的文件夹排序。

```javascript
sort by function task.file.path === query.file.path
```

- 将与查询相同文件中的任务排在其他文件中的任务之前。
- **注意**：`true`排序键排在`false`之前。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### File Name

- `sort by filename`（包含任务的文件的文件名，带有扩展名）
  - 注意来自具有相同文件名的不同笔记的任务将被排序。

> [!released]
`sort by filename`在Tasks 1.21.0中引入。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按文件名自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.file_properties_task.file.filename_docs.approved.md -->

```javascript
sort by function task.file.filename
```

- 像'sort by filename'一样，但包含文件扩展名。

```javascript
sort by function task.file.filenameWithoutExtension
```

- 像'sort by filename'一样。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Heading

- `sort by heading`（任务前面的标题；具有空标题的文件排在其他任务之前）

> [!released]
`sort by heading`在Tasks 1.21.0中引入。

自Tasks 6.0.0起，现在可以**[[Custom Sorting|按标题自定义排序]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.file_properties_task.heading_docs.approved.md -->

```javascript
sort by function task.heading
```

- 像'sort by heading'一样。
- 没有前面标题的任何任务的`task.heading`值为`null`，这些任务排在任何有标题的任务之前。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

## Multiple sort criteria

您可以添加多个`sort by`查询选项，每个都在额外的行上。
第一个排序具有最高优先级。
每个后续的`sort`将在现有排序内排序。

## Notes

> [!info]
> 如果您希望任务按引入紧急性之前的方式排序，
请将以下`sort`表达式添加到您的查询中：

    ```tasks
    sort by status
    sort by due
    sort by path
    ```

---

> [!info]
> 按描述排序应该考虑`[[Links]]`和`[Links with an|Alias]`（注意管道符）。
它还应该考虑`*italics*`和`==highlights==`。
它按预览模式中可见的文本排序。

## Reverse sorting

在您要排序的属性名称之后，您可以添加`reverse`关键字。
如果给出，该属性的排序顺序将被反转。

注意`reverse`将反转整个结果集。
例如，当您`sort by done reverse`并且您的查询结果包含没有完成日期的任务时，那些没有完成日期的任务将首先列出。

请参阅[[Grouping#Reversing groups|反转分组]]以在使用`GROUP BY`子句时指定分组的排序顺序。

## Examples

### 按截止日期排序任务，从最旧到最新

    ```tasks
    not done
    due today
    sort by due
    ```

### 按截止日期排序任务，从最新到最旧

    ```tasks
    done
    sort by done reverse
    ```

### 覆盖Tasks插件的默认排序顺序

如果您对[[#默认排序顺序]]不满意，这是覆盖它的一种方法：

1. 按Markdown文件的完整路径排序，
2. 然后按任务在该文件中的行号排序。

    ```tasks
    not done
    sort by path
    sort by function task.lineNumber
    ```

任何其他排序指令都可以在这两个之前添加，例如`sort by priority`或`sort by happens`

### 按多个属性排序

1. 任务的状态类型（按`IN_PROGRESS`、`TODO`、`DONE`、`CANCELLED`然后`NON_TASK`的顺序排序），
2. 然后任务的描述，按反向字母顺序
3. 然后按Markdown文件的路径。

    ```tasks
    not done
    due before next monday
    sort by status.type
    sort by description reverse
    sort by path
    ```
