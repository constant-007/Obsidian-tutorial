---
publish: true
---

# 分组

<span class="related-pages">#feature/grouping</span>

<!-- NEW_QUERY_INSTRUCTION_EDIT_REQUIRED -->

## 目录

本页面很长。以下是主要部分的链接：

- [[#基础知识]]
- [[#自定义分组]]
- [[#按任务状态分组]]
- [[#按任务依赖分组]]
- [[#按任务中的日期分组]]
- [[#按其他任务属性分组]]
- [[#按文件属性分组]]
- [[#多重分组]]
- [[#细化分组]]
- [[#注意事项]]
- [[#截图]]
- [[#示例]]

## 基础知识

> [!released]
在Tasks 1.6.0中引入。

默认情况下，Tasks在单个列表中显示任务。

要用标题将匹配的任务分开，您可以在查询中添加`group by`行。

## 自定义分组

> [!released]
> `group by function`在Tasks 4.0.0中引入。

Tasks提供了许多内置分组选项，但有时它们不能完全满足所有用户的需求。

现在Tasks有一个强大的机制，让您创建自己的**自定义分组**，提供令人难以置信的灵活性。

在下面的文档中有许多自定义分组指令`group by function`的示例和解释，适用于Tasks内置的`group by`指令不能满足您偏好的情况。

您可以在[[Custom Grouping|自定义分组]]中了解更多关于这个非常强大功能的信息。

## 按任务状态分组

更多信息，包括添加您自己的自定义状态，请参阅[[Statuses|状态]]。

### 状态

- `group by status`（完成或待办，为了在标题中的可见性而大写）
  - 注意完成组显示在待办组之前，
      这与此属性的排序顺序不同。
    - `Done`用于状态类型`DONE`、`CANCELLED`和`NON_TASK`的任务
    - `Todo`用于状态类型`TODO`和`IN_PROGRESS`的任务

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按状态自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.isDone_docs.approved.md -->

```javascript
group by function task.isDone ? "需要行动" : "无需行动"
```

- 使用JavaScript的三元运算符来选择对真值（?后面）和假值（:后面）的处理。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 状态名称

- `group by status.name`
  - 这按您给自定义状态的名称分组，按字母顺序排列。

> [!released]
`group by status.name`在Tasks 1.23.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按状态名称自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.statuses_task.status.name_docs.approved.md -->

```javascript
group by function task.status.name
```

- 与"group by status.name"相同。

```javascript
group by function task.status.name.toUpperCase()
```

- 将状态名称转换为大写。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 状态类型

- `group by status.type`
  - 这按您给自定义状态的类型分组。
  - 组将按此顺序出现，并使用这些组名：
    - `IN_PROGRESS`
    - `TODO`
    - `DONE`
    - `CANCELLED`
    - `NON_TASK`

> [!released]
`group by status.type`在Tasks 1.23.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按状态类型自定义分组]]**。

`task.status.typeGroupText`在Tasks 4.9.0中添加。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.statuses_task.status.type_docs.approved.md -->

```javascript
group by function task.status.type
```

- 与"group by status.type"不同，这按字母顺序对状态类型排序。

```javascript
group by function task.status.typeGroupText
```

- 这按与"group by status.type"相同的顺序对状态类型排序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 状态符号

没有内置指令按状态符号分组。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按状态符号自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.statuses_task.status.symbol_docs.approved.md -->

```javascript
group by function "状态符号: " + task.status.symbol.replace(" ", "space")
```

- 按状态符号分组，使空格字符可见。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 下一个状态符号

没有内置指令按下一个状态符号分组。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按下一个状态符号自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.statuses_task.status.nextSymbol_docs.approved.md -->

```javascript
group by function "下一个状态符号: " + task.status.nextSymbol.replace(" ", "space")
```

- 按下一个状态符号分组，使空格字符可见。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

## 按任务依赖分组

在高层次上，任务依赖定义了您希望处理一组任务的顺序。您可以在[[Task Dependencies|任务依赖]]中了解更多信息。

> [!released]
> 任务依赖在Tasks 6.1.0中引入。

### Id

- `group by id`

更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - 任务Id在Tasks 6.1.0中引入。

自Tasks 6.1.0起，现在可以使用`task.id`**[[Custom Grouping|按Id自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dependencies_task.id_docs.approved.md -->

```javascript
group by function task.id
```

- 按任务Id分组（如果有的话）。
- 注意目前没有办法访问被这些Id阻塞的任何任务。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 依赖于

没有内置指令按"依赖于"分组。

更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - 任务Depends On在Tasks 6.1.0中引入。

自Tasks 6.1.0起，现在可以使用`task.dependsOn`**[[Custom Grouping|按Depends On自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dependencies_task.dependsOn_docs.approved.md -->

```javascript
group by function task.dependsOn
```

- 按任务依赖的Ids分组（如果有的话）。
- 如果一个任务依赖于多个其他任务，它将多次列出。
- 注意目前没有办法访问被依赖的任务。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

## 按任务中的日期分组

### Due Date

- `group by due`
  - 任务的截止日期，包括星期几，或`Invalid due date`或`No due date`。

> [!released]
>
> - `due`分组选项在Tasks 1.7.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按截止日期自定义分组]]**。

这些示例都使用`task.due`属性，这是一个`TasksDate`对象。请参阅[[Task Properties#Values in TasksDate Properties|Values in TasksDate Properties]]以探索其功能。

一些示例使用[moment.js格式字符](https://momentjs.com/docs/#/displaying/format/)。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dates_task.due_docs.approved.md -->

```javascript
group by function task.due.category.groupText
```

- 将任务截止日期分组到5个粗略类别：`Invalid date`、`Overdue`、`Today`、`Future`和`Undated`，按此顺序显示。
- 尝试在此行之前添加`group by due`，如果有很多截止日期标题，并且您希望将其分解为某种结构。
- 值`task.due.category.name`和`task.due.category.sortOrder`也可用。

```javascript
group by function task.due.fromNow.groupText
```

- 按[从现在起的时间](https://momentjs.com/docs/#/displaying/fromnow/)分组，例如`8天前`、`11小时后`。
- 如果没有任何截止日期，它使用空字符串（因此没有标题）。
- 值`task.due.fromNow.name`和`task.due.fromNow.sortOrder`也可用。

```javascript
group by function task.due.format("YYYY-MM-DD dddd")
```

- 像`group by due`一样，除了没有标题，而是没有标题"No due date"，如果没有任何截止日期。

```javascript
group by function task.due.formatAsDate()
```

- 将日期格式化为YYYY-MM-DD或空字符串（因此没有标题），如果没有任何截止日期。

```javascript
group by function task.due.formatAsDateAndTime()
```

- 将日期格式化为YYYY-MM-DD HH:mm或空字符串，如果没有任何截止日期。
- 注意：
  - 此示例仅用于演示目的。
  - 目前Tasks插件不支持存储时间。
  - 不要将时间添加到任务中，因为它将破坏任务数据的读取。

```javascript
group by function task.due.format("YYYY[%%]-MM[%%] MMM", "no due date")
```

- 按月分组，例如`2023%%-05%% May` ...
  - ... 这由Obsidian渲染为`2023 May`。
- 或显示默认标题"no due date"，如果没有任何日期。
- 隐藏月份编号添加，在两个`%%`字符串之间评论，以控制标题的排序顺序。
- 要转义格式字符串中的字符，可以将字符放在方括号（这里，`[%%]`）中。

```javascript
group by function task.due.format("YYYY[%%]-MM[%%] MMM [- Week] WW")
```

- 按月和星期号分组，例如`2023%%-05%% May - Week 22` ...
  - ... 这由Obsidian渲染为`2023 May - Week 22`。
- 如果月份编号未嵌入，在某些年份，第一或最后一周可能以非逻辑顺序显示。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

DON'T PANIC！对于那些对JavaScript感到舒适的用户，这些更复杂的示例也可能有兴趣：

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dates_task.due.advanced_docs.approved.md -->

```javascript
group by function task.due.format("dddd")
```

- 按星期几（周一、周二等）分组。
- 星期名按字母顺序排序。

```javascript
group by function task.due.format("[%%]d[%%]dddd")
```

- 按星期几（周日、周一、周二等）分组。
- 星期名按日期顺序排序，从周日到周一。

```javascript
group by function                                   \
    const date = task.due;                          \
    if (!date.moment) {                             \
        return "Undated";                           \
    }                                               \
    if (date.moment.day() === 0) {                  \
        {{! Put the Sunday group last: }}           \
        return date.format("[%%][8][%%]dddd");      \
    }                                               \
    return date.format("[%%]d[%%]dddd");
```

- 按星期几（周一、周二等）分组。
- 星期名按日期顺序排序，从周一到周日。
- 没有截止日期的任务显示在结尾，标题为"Undated"。
- 关键技术是说，如果星期天（0），则强制显示为日期编号`8`，以便它出现在其他星期之后。
- 要添加注释，我们可以使用`{{! ... }}`
- 要使表达式更易于阅读，我们在几行末尾添加了`\`，以继续在下一行上表达。

```javascript
group by function \
    const date = task.due.moment; \
    return \
        (!date)                           ? '%%4%% Undated' :      \
        !date.isValid()                   ? '%%0%% Invalid date' : \
        date.isBefore(moment(), 'day')    ? '%%1%% Overdue' :      \
        date.isSame(moment(), 'day')      ? '%%2%% Today'   :      \
        '%%3%% Future';
```

- 这给出了与`group by function task.due.category.groupText`完全相同的输出，并且在这里显示，以防您想以某种方式自定义行为。
- 将任务截止日期分组到5个粗略类别：`Invalid date`、`Overdue`、`Today`、`Future`和`Undated`，按此顺序显示。
- 尝试在此行之前添加`group by due`，如果有很多截止日期标题，并且您希望将其分解为某种结构。
- 注意因为我们在避免重复值，所以我们需要添加`return`

```javascript
group by function \
    const date = task.due.moment; \
    return \
        (!date)                           ? '%%4%% ==Undated==' :      \
        !date.isValid()                   ? '%%0%% ==Invalid date==' : \
        date.isBefore(moment(), 'day')    ? '%%1%% ==Overdue==' :      \
        date.isSame(moment(), 'day')      ? '%%2%% ==Today=='   :      \
        '%%3%% ==Future==';
```

- 像上面一样，但标题`Invalid date`、`Overdue`、`Today`、`Future`和`Undated`被突出显示。
- 请参阅下面的示例屏幕截图。

```javascript
group by function \
    const date = task.due.moment; \
    const now = moment(); \
    const label = (order, name) => `%%${order}%% ==${name}==`; \
    if (!date)                      return label(4, 'Undated'); \
    if (!date.isValid())            return label(0, 'Invalid date'); \
    if (date.isBefore(now, 'day'))  return label(1, 'Overdue'); \
    if (date.isSame(now, 'day'))    return label(2, 'Today'); \
    return label(3, 'Future');
```

- 像上面一样，但使用本地函数和`if`语句。

```javascript
group by function \
    const date = task.due.moment; \
    const tomorrow  = moment().add(1,'days'); \
    const now = moment(); \
    const label = (order, name) => `%%${order}%% ==${name}==`; \
    if (!date)                           return label(5, 'Undated'); \
    if (!date.isValid())                 return label(0, 'Invalid date'); \
    if (date.isBefore(now, 'day'))       return label(1, 'Overdue'); \
    if (date.isSame(now, 'day'))         return label(2, 'Today'); \
    if (date.isSame(tomorrow, 'day'))    return label(3, 'Tomorrow'); \
    return label(4, 'Future');
```

- 像上面一样，但添加Tomorrow标题。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

![Tasks grouped by due date category, and then by due date|600](../images/tasks_custom_groups_categorise_dates.png)

示例屏幕截图显示了首先按突出显示的单词`Overdue`、`Today`、`Future`和`Undated`分组，然后按单个截止日期分组。

### Done Date

- `group by done`
  - 任务完成日期，包括星期几，或`Invalid done date`或`No done date`。

> [!released]
>
> - `done`分组选项在Tasks 1.7.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按完成日期自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dates_task.done_docs.approved.md -->

```javascript
group by function task.done.format("YYYY-MM-DD dddd")
```

- 像`group by done`一样，除了使用空字符串而不是"No done date"，如果没有任何完成日期。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

更多示例，请参阅[[#Due Date]]。

### Scheduled Date

- `group by scheduled`
  - 任务计划日期，包括星期几，或`Invalid scheduled date`或`No scheduled date`。

> [!released]
>
> - `scheduled`分组选项在Tasks 1.7.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按计划日期自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dates_task.scheduled_docs.approved.md -->

```javascript
group by function task.scheduled.format("YYYY-MM-DD dddd")
```

- 像`group by scheduled`一样，除了使用空字符串而不是"No scheduled date"，如果没有任何计划日期。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

更多示例，请参阅[[#Due Date]]。

### Start Date

- `group by start`
  - 任务开始日期，包括星期几，或`Invalid start date`或`No start date`。

> [!released]
>
> - `start`分组选项在Tasks 1.7.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按开始日期自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dates_task.start_docs.approved.md -->

```javascript
group by function task.start.format("YYYY-MM-DD dddd")
```

- 像`group by start`一样，除了使用空字符串而不是"No start date"，如果没有任何开始日期。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

更多示例，请参阅[[#Due Date]]。

### Created Date

- `group by created`
  - 任务创建日期，包括星期几，或`Invalid created date`或`No created date`。

> [!released]
`created`分组选项在Tasks 2.0.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按创建日期自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dates_task.created_docs.approved.md -->

```javascript
group by function task.created.format("YYYY-MM-DD dddd")
```

- 像`group by created`一样，除了使用空字符串而不是"No created date"，如果没有任何创建日期。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

更多示例，请参阅[[#Due Date]]。

### Cancelled Date

- `group by cancelled`
  - 任务取消日期，包括星期几，或`Invalid cancelled date`或`No cancelled date`。

> [!released]
`cancelled`分组选项在Tasks 5.5.0中引入。

自Tasks 5.5.0起，现在可以使用`task.cancelled`**[[Custom Grouping|按取消日期自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dates_task.cancelled_docs.approved.md -->

```javascript
group by function task.cancelled.format("YYYY-MM-DD dddd")
```

- 像`group by cancelled`一样，除了使用空字符串而不是"No cancelled date"，如果没有任何取消日期。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

更多示例，请参阅[[#Due Date]]。

### Happens

- `group by happens`
  - 开始日期、计划日期和截止日期的最早日期，包括星期几，或`No happens date`如果没有设置这些。

> [!released]
`happens`分组选项在Tasks 1.11.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按happens日期自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dates_task.happens_docs.approved.md -->

```javascript
group by function task.happens.format("YYYY-MM-DD dddd")
```

- 像`group by happens`一样，除了使用空字符串而不是"No happens date"，如果没有任何happens日期。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

更多示例，请参阅[[#Due Date]]。

## 按其他任务属性分组

除了上述日期相关分组外，还可以从单个任务的属性创建分组。

### Description

没有内置指令按描述分组。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按描述自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.description_docs.approved.md -->

```javascript
group by function task.description
```

- 按描述分组。
- 这可能对查找同一任务的重复完成有用。

```javascript
group by function task.description.toUpperCase()
```

- 将描述转换为大写。

```javascript
group by function task.description.slice(0, 25)
```

- 将描述截断为最多25个字符，并按该字符串分组。

```javascript
group by function task.description.replace('short', '==short==')
```

- 突出显示任何组描述中的单词"short"。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Description without tags

自Tasks 4.2.0起，可以在自定义分组中删除描述中的标签，用于**[[Custom Grouping|自定义分组]]**。

值`task.descriptionWithoutTags`返回一个描述副本，其中删除了所有标签，以便您可以将具有不同标签的描述分组在一起。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.descriptionWithoutTags_docs.approved.md -->

```javascript
group by function task.descriptionWithoutTags
```

- 像`group by description`一样，但它从组标题中删除了任何标签。
- 这可能对查找同一任务的重复完成有用，即使某些重复中的标签不同。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Priority

- `group by priority`
  - 任务优先级，即：
    - `Highest priority`
    - `High priority`
    - `Medium priority`
    - `Normal priority`
    - `Low priority`
    - `Lowest priority`

> [!released]
>
> - `priority`分组选项在Tasks 1.11.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按优先级名称和编号自定义分组]]**。

`task.priorityNameGroupText`在Tasks 4.9.0中添加。

使用优先级名称：

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.priorityName_docs.approved.md -->

```javascript
group by function task.priorityName
```

- 按任务优先级名称分组。
- 优先级名称按字母顺序显示。
- 注意默认优先级称为'Normal'，而不是与`group by priority`一起使用的'None'。

```javascript
group by function task.priorityNameGroupText
```

- 按任务优先级名称分组。
- 优先级名称从最高到最低优先级显示。
- 注意默认优先级称为'Normal'，而不是与`group by priority`一起使用的'None'。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

使用优先级编号：

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.priorityNumber_docs.approved.md -->

```javascript
group by function task.priorityNumber
```

- 按任务优先级编号，最高为0，最低为5。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Urgency

- `group by urgency` ([[Urgency|urgency]])
  - 组从最高紧急性到最低紧急性运行。
  - 您可以通过添加或删除`group by urgency reverse`来反转此顺序。

> [!released]
>
> - `urgency`分组选项在Tasks 3.6.0中引入。
> - 在Tasks 4.0.0中，`group by urgency`的顺序被反转，以首先显示最紧急的任务。添加或删除`reverse`一词以获取原始顺序。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按紧急性自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.urgency_docs.approved.md -->

```javascript
group by function task.urgency.toFixed(3)
```

- 将紧急性显示为3位小数，而不是内置的"group by urgency"，它使用2。

```javascript
group by function task.urgency
```

- 将非整数紧急值显示为5位小数，并将整数值显示为0位小数。
- 按名称排序的组排序已发现不可靠，因为不同的小数位数。
- 因此，为了确保一致排序，Tasks将非整数值四舍五入到固定5位小数，返回值作为字符串。
- 这仍然在某些组的值为整数时一致排序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Recurrence

- `group by recurring`
  - 任务是否重复：要么`Recurring`，要么`Not Recurring`。
- `group by recurrence`
  - 任务的重复规则，例如`every week on Sunday`，或`None`用于非重复任务。
  - 注意显示的文本是程序生成并标准化的，因此可能不完全匹配任何手动输入的任务。例如，带有`🔁 every Sunday`的任务被分组在`every week on Sunday`中。

> [!released]
>
> - `recurring`和`recurrence`分组选项在Tasks 1.11.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按重复自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.isRecurring_docs.approved.md -->

```javascript
group by function task.isRecurring ? "Recurring" : "Non-Recurring"
```

- 使用JavaScript的三元运算符来选择对真值（?后面）和假值（:后面）的处理。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.recurrenceRule_docs.approved.md -->

```javascript
group by function task.recurrenceRule.replace('when done', '==when done==')
```

- 按重复规则分组，突出显示任何出现的单词"when done"。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Tags

请参阅[[Tags|标签]]，了解有关标签在Tasks插件中如何行为的重要信息。

- `group by tags`
  - 任务的标签或`(No tags)`。如果任务有多个标签，它将显示在每个标签下。

> [!released]
>
> - `tags`分组选项在Tasks 1.10.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按标签自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.tags_docs.approved.md -->

```javascript
group by function task.tags
```

- 像"group by tags"一样，除了没有标签的任务没有标题，而不是"(No tags)"。

```javascript
group by function task.tags.join(", ")
```

- 任务有多个标签时，一次列出，标题结合所有标签。
- 用逗号分隔意味着可以在标题中点击标签。

```javascript
group by function task.tags.sort().join(", ")
```

- 像上面一样，但首先对标签进行排序，以确保最终标题独立于任务中标签的顺序。

```javascript
group by function task.tags.filter( (tag) => tag.includes("#context/") )
```

- 仅创建包含"#context/"的标签的标题。

```javascript
group by function task.tags.filter( (tag) => ! tag.includes("#tag") )
```

- 为所有不包含"#tag"的标签创建标题。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

这些是更复杂的示例，如果您使用具有[嵌套标签](https://help.obsidian.md/Editing+and+formatting/Tags#Nested+tags)的任务并希望在不同的标签嵌套级别对其进行分组，您可能会喜欢复制它们。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.tags.advanced_docs.approved.md -->

```javascript
group by function task.tags.map( (tag) => tag.split('/')[0].replace('#', '') )
```

- `#tag/subtag/sub-sub-tag`给出**`tag`**。

```javascript
group by function task.tags.map( (tag) => tag.split('/')[1] ? tag.split('/').slice(1, 2) : '')
```

- `#tag/subtag/sub-sub-tag`给出**`subtag`**。

```javascript
group by function task.tags.map( (tag) => tag.split('/')[2] ? tag.split('/').slice(2, 3) : '')
```

- `#tag/subtag/sub-sub-tag`给出**`sub-sub-tag`**。

```javascript
group by function task.tags.map( (tag) => tag.split('/')[3] ? tag.split('/').slice(3, 4) : '')
```

- `#tag/subtag/sub-sub-tag`给出没有标题，因为第4级没有值。

```javascript
group by function task.tags.map( (tag) => tag.split('/')[0] )
```

- `#tag/subtag/sub-sub-tag`给出**`#tag`**。

```javascript
group by function task.tags.map( (tag) => tag.split('/')[1] ? tag.split('/').slice(0, 2).join('/') : '')
```

- `#tag/subtag/sub-sub-tag`给出**`#tag/subtag`**。

```javascript
group by function task.tags.map( (tag) => tag.split('/')[2] ? tag.split('/').slice(0, 3).join('/') : '')
```

- `#tag/subtag/sub-sub-tag`给出**`#tag/subtag/sub-sub-tag`**。

```javascript
group by function task.tags.map( (tag) => tag.split('/')[3] ? tag.split('/').slice(0, 4).join('/') : '')
```

- `#tag/subtag/sub-sub-tag`给出没有标题，因为第4级没有值。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Original Markdown

没有内置指令按任务的原始markdown行分组。

自Tasks 4.0.0起，现在可以使用`task.originalMarkdown`从Tasks中提取信息，以用于任务分组。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.originalMarkdown_docs.approved.md -->

```javascript
group by function '``' + task.originalMarkdown + '``'
```

- 按任务原始行在MarkDown文件中的原始文本分组。
- 注意成对的反引号字符('`')，以保留任务行中的任何单个反引号字符。
- 重要的是防止任务复选框（例如，'[ ]'）在标题中渲染，因为如果标题和任务上都有复选框，会非常混乱。

```javascript
group by function task.originalMarkdown.replace(/^[^\[\]]+\[.\] */, '')
```

- 格式化markdown行为代码的另一种方法是删除复选框结尾之前的所有内容。
- 然后将任务行的其余部分渲染为正常的markdown。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 行号

没有内置指令按任务的行号分组。

自Tasks 7.16.0起，现在可以使用`task.lineNumber`**[[Custom Grouping|按任务行号自定义分组]]**。

> [!tip]
> 使用`task.lineNumber`时，文件中的第一行是行号`0`（零），而不是`1`（一）。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.lineNumber_docs.approved.md -->

<!-- placeholder to force blank line after included text --><!-- endInclude -->

## 按文件属性分组

### File Path

- `group by path`（包含任务的文件路径，即文件夹和文件名）

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按文件路径自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.file_properties_task.file.path_docs.approved.md -->

```javascript
group by function task.file.path
```

- 像'group by path'一样，但包含文件扩展名，并且不转义路径中的任何Markdown格式字符。

```javascript
group by function task.file.path.replace(query.file.folder, '')
```

- 按任务的文件路径分组，但从组中删除查询的文件夹。
- 对于查询文件夹或子文件夹中的任务，这是查看缩短路径的好方法。
- 这是为了提供想法：这是一个有点懒惰的实现，因为它不检查`query.file.folder`是否在行的开头。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

自Tasks 5.1.0起，查询的文件路径可以方便地在自定义分组中使用。

- `query.file.path`或
- `query.file.pathWithoutExtension`
- 有用的阅读：[[Query Properties|查询属性]]。

### Root

- `group by root`（包含任务的文件的顶级文件夹，即路径中的第一个目录，对于库根目录中的文件将是`/`）

> [!released]
`root`分组选项在Tasks 1.11.0中引入。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按根文件夹自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.file_properties_task.file.root_docs.approved.md -->

```javascript
group by function task.file.root
```

- 像'group by root'一样，除了它不转义根目录中的任何Markdown格式字符。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

自Tasks 5.1.0起，查询的文件根目录可以方便地在自定义分组中使用。

- `query.file.root`
- 有用的阅读：[[Query Properties|查询属性]]。

### Folder

- `group by folder`（包含任务的文件的文件夹，总是以`/`结尾，对于库根目录中的文件将恰好是`/`）

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按文件夹自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.file_properties_task.file.folder_docs.approved.md -->

```javascript
group by function task.file.folder
```

- 像'group by folder'一样，除了它不转义文件夹中的任何Markdown格式字符。

```javascript
group by function task.file.folder.slice(0, -1).split('/').pop() + '/'
```

- 按包含任务的文件的直接父文件夹分组。
- 工作原理如下：
  - '.slice(0, -1)'从原始文件夹中删除尾随斜杠（'/'）。
  - '.split('/')'将剩余路径分割成文件夹名称数组。
  - '.pop()'返回最后一个文件夹名称，即包含任务的文件的父文件夹。
  - 然后添加回尾随斜杠，以确保我们不会为库顶级的文件获得空字符串。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

自Tasks 5.1.0起，查询的文件夹可以方便地在自定义分组中使用。

- `query.file.folder`
- 有用的阅读：[[Query Properties|查询属性]]。

### File Name

- `group by filename`（包含任务的文件的链接，不包含`.md`扩展名）
  - 注意来自具有相同文件名的不同笔记的任务将在同一组中分组在一起。

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按文件名自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.file_properties_task.file.filename_docs.approved.md -->

```javascript
group by function task.file.filename
```

- 像'group by filename'一样，但不链接到文件。

```javascript
group by function task.file.filenameWithoutExtension + (task.hasHeading ? (' > ' + task.heading) : '')
```

- 像'group by backlink'一样，但不链接到文件中的标题。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

自Tasks 5.1.0起，查询的文件名可以方便地在自定义分组中使用。

- `query.file.filename`或
- `query.file.filenameWithoutExtension`
- 有用的阅读：[[Query Properties|查询属性]]。

### Backlink

- `group by backlink`（将在任务的[[Backlinks|反向链接]]中显示的文本，结合任务的文件名和标题，带有链接）

### Heading

- `group by heading`（任务前面的标题，如果文件中没有标题则为`(No heading)`）

自Tasks 4.0.0起，现在可以**[[Custom Grouping|按标题自定义分组]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.file_properties_task.heading_docs.approved.md -->

```javascript
group by function (task.heading + '.md' === task.file.filename) ? '' : task.heading
```

- 按标题分组，但仅当标题与文件名不同时。
- 这在'group by filename'行之后效果很好。
- 注意三个等号'==='：这些在JavaScript中对安全性很重要。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

## 多重分组

您可以添加多个`group by`查询选项，每个都在额外的行上。
这将创建嵌套分组。
第一个分组具有最高优先级。

每个后续的`group by`将在现有分组内生成新的标题级别：

- 第一个`group by`显示为`h4`标题
- 第二个`group by`显示为`h5`标题
- 第三个及后续的`group by`显示为`h6`标题

请参阅下面的[[#截图|截图]]了解实际效果。

> [!info]
> 标题按区分大小写的字母顺序显示，而不是原始顺序。

## 细化分组

### Reversing groups

> [!released]
> 分组标题的反转在Tasks 3.7.0中引入。

在您要分组的属性名称之后，您可以添加`reverse`关键字。
如果给出，该属性的分组标题将被反转。

例如：

- `group by due`将对分组标题排序：
  - 从**最旧**的截止日期开始...
  - 到**最新**的截止日期结束
- `group by due reverse`将对分组标题排序：
  - 从**最新**的截止日期开始...
  - 到**最旧**的截止日期结束

> [!tip]
> `reverse`关键字控制分组标题的显示顺序。
>
> 相比之下，[[Sorting|sort by]]功能控制任务在每个分组*内部*的显示顺序。

### Limiting group size

您可以限制每个分组中的任务数量，也许是为了首先处理最重要的事情。

请参阅[[Limiting#Limit number of tasks in each group|限制每个分组中的任务数量]]。

## Notes

> [!info]
> 操作顺序确保分组不会修改显示哪些任务，例如当使用`limit`选项时：
>
> 1. 运行所有过滤器指令
> 1. 然后运行任何排序指令
> 1. 然后运行任何`limit`指令
> 1. 然后运行任何分组指令
> 1. 然后运行任何`limit groups`指令

## 截图

### Before

这是一个没有任何`group by`命令的Tasks结果示例：

![Tasks Ungrouped](../images/tasks_ungrouped.png)
未分组的任务。

### After

这是按文件夹、文件名和标题分组时的效果：

![Tasks Grouped](../images/tasks_grouped.png)
已分组的任务。

## 示例

给我三个级别的分组，以指示我任务的位置：

    ```tasks
    not done
    group by folder
    group by filename
    group by heading
    ```

显示我今天需要做的任务 - 并将今天的任务放在首位，以提高可见性：

    ```tasks
    not done
    due before tomorrow
    group by due reverse
    ```
