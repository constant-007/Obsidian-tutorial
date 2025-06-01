---
publish: true
---

# 过滤器

<span class="related-pages">#feature/filters</span>

<!-- NEW_QUERY_INSTRUCTION_EDIT_REQUIRED -->

## 目录

本页面很长。以下是主要部分的链接：

- [[#自定义过滤器]]
- [[#搜索日期]]
- [[#文本过滤器]]
- [[#匹配多个过滤器]]
- [[#任务状态过滤器]]
- [[#任务依赖过滤器]]
- [[#任务中的日期过滤器]]
- [[#其他任务属性过滤器]]
- [[#文件属性过滤器]]
- [[#附录：Tasks 2.0.0对日期过滤器的改进]]

## 自定义过滤器

> [!released]
> `filter by function`在Tasks 4.2.0中引入。

Tasks提供了许多内置过滤选项，但有时它们不能完全满足所有用户的需求。

现在Tasks有一个强大的机制，让您创建自己的**自定义过滤器**，提供令人难以置信的灵活性。

在下面的文档中有许多自定义过滤指令`filter by function`的示例和解释，适用于Tasks内置指令不能满足您偏好的情况。

您可以在[[Custom Filters|自定义过滤器]]中了解更多关于这个非常强大功能的信息。

## 搜索日期

Tasks在查询块内的日期方面提供了很大的灵活性。

基本上有两种广泛的日期搜索类型：

- [[#搜索特定日期]]
- [[#搜索日期范围]]

### 搜索特定日期

本节描述使用单个日期的搜索，例如：

    ```tasks
    starts before 2023-04-20
    due on or before today
    ```

另请参阅[[#搜索日期范围]]。

#### 日期搜索选项

在使用特定日期搜索时有几个可用选项：

- `on <date>`或`<date>`
  - 将匹配该日期。
  - `on`是日期搜索的默认值，可以省略。
- `before <date>`
  - 将匹配该日期之前的所有日期。
- `after <date>`
  - 将匹配该日期之后的所有日期。
- `on or before <date>`
  - 将匹配该日期和所有更早的日期。
- `on or after <date>`
  - 将匹配该日期和所有更晚的日期。

此表可能有助于可视化这些选项：

| 选项           | 所有更早日期 | `搜索日期` | 所有更晚日期 |
|----------------| ----------- | ---------- | ----------- |
| `before`       | 匹配        |            |             |
| `on or before` | 匹配        | 匹配       |             |
| `on`           |             | 匹配       |             |
| `on or after`  |             | 匹配       | 匹配        |
| `after`        |             |            | 匹配        |

> [!released]
> `on or before`和`on or after`在Tasks 4.6.0中引入。

#### 绝对日期

`<date>`过滤器可以使用"绝对"日期，其首选格式为`YYYY-MM-DD`。

绝对日期指定**日历中的特定日期**。无论今天的日期如何，它们都代表同一天。

示例：

- `2021-05-25`
- `25th May 2023`
  - [chrono](https://github.com/wanasit/chrono)库非常灵活地读取日期，因此您可以在过滤器中使用自由文本表示绝对日期。
  - 不过，`YYYY-MM-DD`格式更安全一些，因为在读取您的文本时不会有歧义的机会。

#### 相对日期

`<date>`过滤器可以使用`相对`日期。

相对日期是**从今天的日期计算的**。

当日期改变时，像`due today`这样的相对日期会重新评估，以便列表保持最新（只要您的计算机在午夜时没有休眠 - 请参阅[#1289](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1289)）。

灵感示例：

- `yesterday`
- `today`
- `tomorrow`
- `next monday`
- `last friday`
- `14 days ago`
- `in two weeks`
- `14 October`（将使用当前年份）
- `May`（将使用当前年份的5月1日）

注意，如果今天是星期三，您写`tuesday`，Tasks假设您的意思是"昨天"，因为那是最近的星期二。
如果您的意思是"下星期二"，请使用`next tuesday`。

### Searching date ranges
### 搜索日期范围

> [!released]
日期范围搜索在Tasks 2.0.0中引入。

Tasks允许日期搜索指定一对日期，`<date range>`。

本节描述日期范围搜索，例如：

    ```tasks
    due 2023-11-25 2023-11-30
    happens this week
    ```

另请参阅[[#搜索特定日期]]。

#### Date range options
#### 日期范围选项

在使用日期范围搜索时有几个可用选项：

- `in <date range>`或`<date range>`
  - 将匹配**开始**日期、**结束**日期和之间的所有日期。
  - `in`是日期范围搜索的默认值，可以省略。
- `before <date range>`
  - 将匹配**开始**日期之前的所有日期。
- `after <date range>`
  - 将匹配**结束**日期之后的所有日期。
- `in or before <date range>`
  - 将匹配**结束**日期和所有更早的日期。
- `in or after <date range>`
  - 将匹配**开始**日期和所有更晚的日期。

此表可能有助于可视化这些选项：

| 选项           | 所有更早日期 | `开始日期` | 范围内的<br>所有日期 | `结束日期` | 所有更晚日期 |
| -------------- | ----------- | ---------- | -------------------- | ---------- | ----------- |
| `before`       | 匹配        |            |                      |            |             |
| `in or before` | 匹配        | 匹配       | 匹配                 | 匹配       |             |
| `in`           |             | 匹配       | 匹配                 | 匹配       |             |
| `in or after`  |             | 匹配       | 匹配                 | 匹配       | 匹配        |
| `after`        |             |            |                      |            | 匹配        |

> [!released]
> `in or before`和`in or after`在Tasks 4.6.0中引入。

#### Absolute date ranges
#### 绝对日期范围

`<date range>`可以指定为2个有效的`YYYY-MM-DD`格式日期。

注意：

- `in`和`on`可以省略。
- 如果其中一个`YYYY-MM-DD`日期无效，则会被忽略，过滤器将表现为`<date>`而不是`<date range>`。
- 日期范围不能由2个相对日期指定，例如`next monday three weeks`。
- 技术上可以用词语指定绝对日期，例如`25th May 2023`。
  - 但是，我们不建议在范围中使用词语来指定两个日期。
  - 这是因为我们发现使用两个相邻的非数字日期可能导致歧义和意外结果，当[chrono](https://github.com/wanasit/chrono)库解析您的`<date range>`过滤器中的日期时。

绝对日期范围示例：

- `2022-01-01 2023-02-01`

> [!warning]
在Tasks 2.0.0之前，绝对日期范围中的第二个日期被忽略。
请参阅[[Filters#附录：Tasks 2.0.0对日期过滤器的改进|下面的附录]]中的表格以了解结果的变化，以及您是否需要更新任何搜索。

#### Relative date ranges
#### 相对日期范围

Tasks支持一组非常特定的相对`<date range>`值：`last|this|next week|month|quarter|year`。管道（`|`）字符表示"或"。

Tasks将处理这些范围，基于今天的日期，并在内部将它们转换为绝对日期范围（`YYYY-MM-DD YYYY-MM-DD`）。

两端的日期都包括在内，即这是一个包含性搜索。

注意：

- 目前所有周都定义为[ISO 8601](https://en.wikipedia.org/wiki/ISO_week_date)周，**从星期一开始**，**到星期日结束**。
  - 我们将在未来版本中提供更多灵活性。
  - 我们在[issue #1751](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1751)中跟踪此问题
- 相对日期范围仅支持上面指定的确切关键字。
  - 因此，例如，不支持`previous half of year`和`next semester`。

相对日期范围示例：

- `in this week`（从本周的星期一到星期日，包括两端）
- `after this month`
- `next quarter`
- `on or before next year`

> [!warning]
在Tasks 2.0.0之前，相对日期范围的解释令人困惑，不是大多数用户自然期望的。
请参阅[[Filters#附录：Tasks 2.0.0对日期过滤器的改进|下面的附录]]中的表格以了解结果的变化，以及您是否需要更新任何搜索。

#### Numbered date ranges
#### 编号日期范围

还有使用独立于当前日期的编号日期范围的能力。支持这些编号日期范围类型：

- 周
  - 格式：`YYYY-Www`（`ww`是周数，始终为2位数）
  - 示例：`2022-W14`
- 月
  - 格式：`YYYY-mm`（`mm`是月数，始终为2位数）
  - 示例：`2023-10`
- 季度
  - 格式：`YYYY-Qq`（`q`是季度数，始终为1位数）
  - 示例：`2021-Q4`
- 年
  - 格式：`YYYY`
  - 示例：`2023`

> [!released]
> 编号日期范围在Tasks 3.1.0中引入。

## 文本过滤器

搜索文本字符串的过滤器有两种类型。

在以下示例中，我们描述`heading`过滤器，但这些注释适用于所有文本过滤器。

1. `heading (includes|does not include) <search text>`
    - 它匹配标题包含字符串`<search text>`至少一次的部分中的所有任务。
        - 即，这是一个子字符串搜索。
        - 因此`heading includes Day Planner`将匹配部分`## Monday Day Planner`和`## Day Planner for typical day`中的任务。
    - 它忽略大小写。搜索不区分大小写。
        - 因此`heading includes Day Planner`将匹配部分`## Day Planner`和`## DAY PLANNER`中的任务。
    - 任何引号字符（`'`和`"`）都包含在搜索文本中。
        - 因此`heading includes "Day Planner"`将匹配部分`## "Day Planner"`。
        - 但不会匹配标题如`## Day Planner`的任务。
1. `heading (regex matches|regex does not match) /<JavaScript-style Regex>/`
    - 进行正则表达式匹配（默认区分大小写）。
    - 正则表达式（或"regex"）搜索是一个强大但高级的功能。
    - 它需要深入的知识才能成功使用，并且不会错过预期的搜索结果。
    - 很容易编写一个看起来正确的正则表达式，但其中有一个具有不明显含义的特殊字符。
    - 必读：[[Regular Expressions|正则表达式搜索]]。

## 匹配多个过滤器

> [!released]
布尔组合在Tasks 1.9.0中引入

查询的每一行都必须匹配才能列出任务。
换句话说，行之间被认为有一个"AND"运算符。
在每行内，您可以使用布尔运算符`NOT`、`AND`、`OR`、`AND NOT`、`OR NOT`和`XOR`，只要单个过滤器用括号包装：

    ```tasks
    (no due date) OR (due after 2021-04-04)
    path includes GitHub
    ```

    ```tasks
    due after 2021-04-04
    (path includes GitHub) AND NOT (tags include #todo)
    ```

有关使用布尔运算符组合过滤器的完整详细信息，请参阅[[Combining Filters|组合过滤器]]。

## 任务状态过滤器

### 状态

- `done` - 匹配状态类型为`DONE`、`CANCELLED`和`NON_TASK`的任务
- `not done` - 匹配状态类型为`TODO`和`IN_PROGRESS`的任务

> [!info]
> 在Tasks 1.23.0之前，没有任务状态类型的概念，因此只使用状态符号：
>
> - 带有`[ ]`的任务过去算作`not done`
> - 除空格以外的任何其他字符过去算作`done`
>
> 新行为更灵活，是引入对进行中和已取消任务支持所必需的。如果首选原始行为，您可以将除`space`之外的每个符号的状态类型更改为`DONE`。请参阅[[Set up custom statuses|如何设置您的自定义状态]]。

自Tasks 4.2.0起，现在可以使用`task.isDone`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.isDone_docs.approved.md -->

```javascript
filter by function task.isDone
```

- 与`done`过滤器相同，但在与同一行上的其他表达式结合使用时可能有用。

```javascript
filter by function ! task.isDone
```

- 与`not done`过滤器相同，但在与同一行上的其他表达式结合使用时可能有用。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

> [!NOTE]
> `task.status.type`（请参阅[[#状态类型]]）在自定义过滤器中比`task.isDone`提供更高的精度。

### 状态名称

- 这搜索给予您的自定义状态的名称。
- 例如，也许您可能将`[!]`命名为`Important`，因此此字段将搜索所有具有该状态符号的任务的文本`Important`。
- `status.name (includes|does not include) <string>`
  - 匹配不区分大小写（忽略大小写）。
- `status.name (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - 进行正则表达式匹配（默认区分大小写）。
  - 必读：[[Regular Expressions|正则表达式搜索]]。

> [!released]
`status.name`文本搜索在Tasks 1.23.0中引入。

有关更多信息，包括添加您自己的自定义状态，请参阅[[Statuses|状态]]。

自Tasks 4.2.0起，现在可以使用`task.status.name`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.statuses_task.status.name_docs.approved.md -->

```javascript
filter by function task.status.name === 'Unknown'
```

- 查找所有尚未添加到Tasks设置中的自定义状态的任务。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 状态类型

- `status.type (is|is not) (TODO|DONE|IN_PROGRESS|CANCELLED|NON_TASK)`
  - 值`TODO`等不区分大小写：例如，您可以使用`in_progress`
- 这搜索您给予自定义状态的类型。
- 如果您希望查找所有`IN_PROGRESS`的任务，并且您已设置状态使`[/]`、`[d]`和可能其他几个都被视为`IN_PROGRESS`，则此搜索是高效的。
- 要搜索多个可能的状态类型：
  - 要排除多个值，您可以使用多个`status.type is not`行。
  - 要允许多个值，使用布尔组合，例如：`( status.type is TODO ) OR ( status.type is IN_PROGRESS )`。
  - 或参见下面的"自定义过滤"示例。

> [!released]
`status.type`文本搜索在Tasks 1.23.0中引入。

有关更多信息，包括添加您自己的自定义状态，请参阅[[Statuses|状态]]。

自Tasks 4.2.0起，现在可以使用`task.status.type`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.statuses_task.status.type_docs.approved.md -->

```javascript
filter by function task.status.type === 'NON_TASK'
```

- 查找类型为`NON_TASK`的任务。

```javascript
filter by function 'TODO,IN_PROGRESS'.includes(task.status.type)
```

- 查找类型为`TODO`或`IN_PROGRESS`的任务。
- 这比进行布尔`OR`搜索更方便。

```javascript
filter by function ! 'NON_TASK,CANCELLED'.includes(task.status.type)
```

- 查找不是类型`NON_TASK`且不是类型`CANCELLED`的任务。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 状态符号

没有内置指令来按状态符号过滤。

自Tasks 4.2.0起，现在可以使用`task.status.symbol`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.statuses_task.status.symbol_docs.approved.md -->

```javascript
filter by function task.status.symbol === '-'
```

- 查找带有复选框`[-]`的任务，这通常用于表示"已取消"。

```javascript
filter by function task.status.symbol !== ' '
```

- 查找状态符号不是空格字符的任务，即没有复选框`[ ]`的任务。

```javascript
filter by function \
    const symbol = task.status.symbol; \
    return symbol === 'P' || symbol === 'C' || symbol === 'Q' || symbol === 'A';
```

- 注意，因为我们使用变量来避免重复，我们需要添加`return`
- 查找状态符号为`P`、`C`、`Q`或`A`的任务。
- 您想要搜索的符号越多，这可能会变得相当冗长。

```javascript
filter by function 'PCQA'.includes(task.status.symbol)
```

- 查找状态符号为`P`、`C`、`Q`或`A`的任务。
- 这是一个方便的快捷方式，比独立测试每个允许值的较长语句更简洁。

```javascript
filter by function !' -x/'.includes(task.status.symbol)
```

- 查找在默认设置中Tasks不支持的任何状态符号的任务。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 下一个状态符号

没有内置指令来按下一个状态符号过滤。

自Tasks 4.2.0起，现在可以使用`task.status.nextSymbol`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.statuses_task.status.nextSymbol_docs.approved.md -->

```javascript
filter by function task.status.symbol === task.status.nextSymbol
```

- 查找切换到自身的任务，因为下一个符号与当前符号相同。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 状态示例

查找任何您尚未添加到Tasks设置中的状态符号的任务：

    ```tasks
    status.name includes unknown
    group by path
    ```

## Filters for Task Dependencies
## 任务依赖过滤器

At a high level, task dependencies define the order in which you want to work on a set of tasks. You can read more about them in [[Task Dependencies]].
在高层次上，任务依赖定义了您想要处理一组任务的顺序。您可以在[[Task Dependencies|任务依赖]]中了解更多信息。

> [!released]
> Task Dependencies were introduced in Tasks 6.1.0.
> 任务依赖在Tasks 6.1.0中引入。

### Blocking Tasks
### 阻塞任务

- `is blocking`
  - This shows tasks that you probably want to do first, as they are preventing other tasks from being done.
  - 这显示您可能想要首先完成的任务，因为它们阻止其他任务被完成。
- `is not blocking`
  - This shows tasks that are not preventing others from being done, so perhaps may be considered as lower priority.
  - 这显示不阻止其他任务被完成的任务，因此可能被认为是较低优先级。
  - This would typically be used with `not done`.
  - 这通常与`not done`一起使用。

A task is treated as `blocking` if:
如果满足以下条件，任务被视为`blocking`：

- it has an `id` value,
- 它有一个`id`值，
- at least one other task in the vault has that `id` value in its `dependsOn` list,
- 保险库中至少有一个其他任务在其`dependsOn`列表中有该`id`值，
- both tasks have status type `TODO` or `IN_PROGRESS`.
- 两个任务的状态类型都是`TODO`或`IN_PROGRESS`。

For example:
例如：

```text
- [ ] I am blocking 🆔 12345
- [ ] I am not blocking ⛔ 12345
```

Note also:
还要注意：

- Only direct dependencies are considered.
- 只考虑直接依赖。
- Tasks with status type `DONE`, `CANCELLED` or `NON_TASK` are never treated as `blocking`.
- 状态类型为`DONE`、`CANCELLED`或`NON_TASK`的任务永远不会被视为`blocking`。

For more information, see [[Task Dependencies]].
有关更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - `is blocking` and `is not blocking` were introduced in Tasks 6.1.0.
> - `is blocking`和`is not blocking`在Tasks 6.1.0中引入。

### Blocked Tasks
### 被阻塞任务

- `is blocked`
  - This shows tasks you cannot currently do, as they are waiting for another task to be completed.
  - 这显示您当前无法完成的任务，因为它们正在等待另一个任务完成。
- `is not blocked`
  - This shows tasks that are not waiting for any other tasks to be completed.
  - 这显示不等待任何其他任务完成的任务。
  - This would typically be used with `not done`.
  - 这通常与`not done`一起使用。

A task is treated as `blocked` if:
如果满足以下条件，任务被视为`blocked`：

- it has one or more `dependsOn` values,
- 它有一个或多个`dependsOn`值，
- its `dependsOn` list includes the id any tasks in the vault,
- 其`dependsOn`列表包括保险库中任何任务的id，
- both tasks have status type `TODO` or `IN_PROGRESS`.
- 两个任务的状态类型都是`TODO`或`IN_PROGRESS`。

For example:
例如：

```text
- [ ] I am not blocked 🆔 12345
- [ ] I am blocked ⛔ 12345
```

Note also:
还要注意：

- Only direct dependencies are considered.
- 只考虑直接依赖。
- Tasks with status type `DONE`, `CANCELLED` or `NON_TASK` are never treated as `blocked`.
- 状态类型为`DONE`、`CANCELLED`或`NON_TASK`的任务永远不会被视为`blocked`。

For more information, see [[Task Dependencies]].
有关更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - `is blocked` and `is not blocked` were introduced in Tasks 6.1.0.
> - `is blocked`和`is not blocked`在Tasks 6.1.0中引入。

### Id
### 标识符

The `id` field adds an identifier to a task, so that other tasks may be marked as `dependsOn` that task.
`id`字段为任务添加标识符，以便其他任务可以标记为`dependsOn`该任务。

- `has id`
- `no id`
- `id (includes|does not include) <string>`
  - Matches case-insensitive (disregards capitalization).
  - 匹配不区分大小写（忽略大小写）。
- `id (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - Does regular expression match (case-sensitive by default).
  - 进行正则表达式匹配（默认区分大小写）。
  - Essential reading: [[Regular Expressions|Regular Expression Searches]].
  - 必读：[[Regular Expressions|正则表达式搜索]]。

For more information, see [[Task Dependencies]].
有关更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - Task Id was introduced in Tasks 6.1.0.
> - 任务Id在Tasks 6.1.0中引入。

Since Tasks 6.1.0, **[[Custom Filters|custom filtering]] by Id** is now possible, using `task.id`.
自Tasks 6.1.0起，现在可以使用`task.id`进行**[[Custom Filters|自定义过滤]]**。

### Depends On
### 依赖于

The `dependsOn` field allows a task to be marked as depending on the `id` of one or more other tasks. Multiple `id` values are separated by commas (`,`) with no spaces.
`dependsOn`字段允许任务标记为依赖于一个或多个其他任务的`id`。多个`id`值用逗号（`,`）分隔，不带空格。

- `has depends on`
- `no depends on`

For more information, see [[Task Dependencies]].
有关更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - Task Depends On was introduced in Tasks 6.1.0.
> - 任务依赖于在Tasks 6.1.0中引入。

Since Tasks 6.1.0, **[[Custom Filters|custom filtering]] by Depends On** is now possible, using `task.dependsOn`.
自Tasks 6.1.0起，现在可以使用`task.dependsOn`进行**[[Custom Filters|自定义过滤]]**。

## 任务中的日期过滤器

### 到期日期

- `no due date`
- `has due date`
- `due (on|before|after|on or before|on or after) <date>`
- `due (in|before|after|in or before|in or after) <date range>`
  - `YYYY-MM-DD YYYY-MM-DD`
  - `(last|this|next) (week|month|quarter|year)`
  - `(YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`
- `due date is invalid`

有关更多信息，请参阅[[Dates#Due date|到期日期]]。

> [!released]
>
> - `has due date`在Tasks 1.6.0中引入。
> - `due date is invalid`在Tasks 1.16.0中引入。
> - `due (before|after|in) <date range>`搜索在Tasks 2.0.0中引入。
> - `due (before|after|in) (YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`搜索在Tasks 3.1.0中引入。
> - `due (on or before|on or after) <date>`和`due (in or before|in or after) <date range>`搜索在Tasks 4.6.0中引入

自Tasks 4.2.0起，现在可以使用`task.due`进行**[[Custom Filters|自定义过滤]]**。

这些示例都使用`task.due`属性，它是一个`TasksDate`对象。请参阅[[Task Properties#Values in TasksDate Properties|TasksDate属性中的值]]以探索其功能。

其中一些示例使用[moment.js格式字符](https://momentjs.com/docs/#/displaying/format/)。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.dates_task.due_docs.approved.md -->

```javascript
filter by function task.due.format('dddd') === 'Tuesday'
```

- 查找在星期二到期的任务，即任何星期二。
- 在非英语系统上，您可能需要提供本地语言的星期几。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

对于熟悉JavaScript的用户，这些更复杂的示例也可能有用：

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.dates_task.due.advanced_docs.approved.md -->

```javascript
filter by function \
    const date = task.due.moment; \
    return date ? !date.isValid() : false;
```

- 类似于`due date is invalid`。
- 它匹配有到期日期且到期日期无效的任务，例如`2022-13-32`

```javascript
filter by function task.due.moment?.isSameOrBefore(moment(), 'day') || false
```

- 查找今天或更早到期的所有任务。
- `moment()`返回当前日期和时间，我们需要将其转换为一天的开始。
- 由于第二个参数确定精度，而不仅仅是要检查的单个值，使用'day'将检查年、月和日。
- 请参阅[isSameOrBefore](https://momentjscom.readthedocs.io/en/latest/moment/05-query/04-is-same-or-before/)的文档。

```javascript
filter by function task.due.moment?.isSameOrAfter(moment(), 'day') || false
```

- 今天或更晚到期。

```javascript
filter by function task.due.moment?.isSame(moment('2023-05-31'), 'day') || false
```

- 查找在2023年5月31日到期的所有任务。

```javascript
filter by function task.due.moment?.isSame(moment('2023-05-31'), 'week') || false
```

- 查找在2023年5月31日这一周到期的所有任务。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 完成日期

- `no done date`
- `has done date`
- `done (on|before|after|on or before|on or after) <date>`
- `done (in|before|after|in or before|in or after) <date range>`
  - `YYYY-MM-DD YYYY-MM-DD`
  - `(last|this|next) (week|month|quarter|year)`
  - `(YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`
- `done date is invalid`

有关更多信息，请参阅[[Dates#Done date|完成日期]]。

> [!released]
>
> - `no done date`和`has done date`在Tasks 1.7.0中引入。
> - `done date is invalid`在Tasks 1.16.0中引入。
> - `done (before|after|in) <date range>`搜索在Tasks 2.0.0中引入。
> - `done (before|after|in) (YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`搜索在Tasks 3.1.0中引入。
> - `done (on or before|on or after) <date>`和`done (in or before|in or after) <date range>`搜索在Tasks 4.6.0中引入

自Tasks 4.2.0起，现在可以使用`task.done`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.dates_task.done_docs.approved.md -->

```javascript
filter by function task.done.format('dddd') === 'Thursday'
```

- 查找在星期四完成的任务，即任何星期四。
- 在非英语系统上，您可能需要提供本地语言的星期几。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

有关更多示例，请参阅[[#到期日期]]。

### 计划日期

- `no scheduled date`
- `has scheduled date`
- `scheduled (on|before|after|on or before|on or after) <date>`
- `scheduled (in|before|after|in or before|in or after) <date range>`
  - `YYYY-MM-DD YYYY-MM-DD`
  - `(last|this|next) (week|month|quarter|year)`
  - `(YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`
- `scheduled date is invalid`

有关更多信息，请参阅[[Dates#Scheduled date|计划日期]]。

> [!released]
>
> - `has scheduled date`在Tasks 1.6.0中引入。
> - `scheduled date is invalid`在Tasks 1.16.0中引入。
> - `scheduled (before|after|in) <date range>`搜索在Tasks 2.0.0中引入。
> - `scheduled (before|after|in) (YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`搜索在Tasks 3.1.0中引入。
> - `scheduled (on or before|on or after) <date>`和`scheduled (in or before|in or after) <date range>`搜索在Tasks 4.6.0中引入

自Tasks 4.2.0起，现在可以使用`task.scheduled`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.dates_task.scheduled_docs.approved.md -->

```javascript
filter by function task.scheduled.format('dddd') === 'Wednesday'
```

- 查找在星期三计划的任务，即任何星期三。
- 在非英语系统上，您可能需要提供本地语言的星期几。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

有关更多示例，请参阅[[#到期日期]]。

### 开始日期

- `no start date`
- `has start date`
- `starts (on|before|after|on or before|on or after) <date>`
- `starts (in|before|after|in or before|in or after) <date range>`
  - `YYYY-MM-DD YYYY-MM-DD`
  - `(last|this|next) (week|month|quarter|year)`
  - `(YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`
- `start date is invalid`

有关更多信息，请参阅[[Dates#Start date|开始日期]]。

> [!released]
>
> - `has start date`在Tasks 1.6.0中引入。
> - `start date is invalid`在Tasks 1.16.0中引入。
> - `starts (before|after|in) <date range>`搜索在Tasks 2.0.0中引入。
> - `starts (before|after|in) (YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`搜索在Tasks 3.1.0中引入。
> - `starts (on or before|on or after) <date>`和`starts (in or before|in or after) <date range>`搜索在Tasks 4.6.0中引入

自Tasks 4.2.0起，现在可以使用`task.start`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.dates_task.start_docs.approved.md -->

```javascript
filter by function task.start.format('dddd') === 'Sunday'
```

- 查找在星期日开始的任务，即任何星期日。
- 在非英语系统上，您可能需要提供本地语言的星期几。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

有关更多示例，请参阅[[#到期日期]]。

#### 使开始日期仅查找有开始日期的任务

> [!Warning]
> 当通过[[Dates#Start date|开始日期]]过滤查询时，
> 结果将包括没有开始日期的任务。
> 这样，您可以使用开始日期作为过滤器来过滤掉任何您还不能处理的任务。

这样的过滤器可能是：

    ```tasks
    # 查找任务：
    #    要么在今天之前或更早开始
    #    或者没有开始日期：
    starts before tomorrow
    ```

> [!Tip]
> 要查找真正在明天之前开始的任务：
>
> ````text
> ```tasks
> # 查找今天或更早开始的任务：
> ( (starts before tomorrow) AND (has start date) )
> ```
> ````

### 创建日期

请参阅[[Dates#Created date|创建日期]]了解如何让Tasks在其创建的任何任务行上记录创建日期。

- `no created date`
- `has created date`
- `created (on|before|after|on or before|on or after) <date>`
- `created (in|before|after|in or before|in or after) <date range>`
  - `YYYY-MM-DD YYYY-MM-DD`
  - `(last|this|next) (week|month|quarter|year)`
  - `(YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`
- `created date is invalid`

这样的过滤器可能是：

    ```tasks
    created before tomorrow
    ```

> [!released]
>
> - 创建日期在Tasks 2.0.0中引入。
> - `created (before|after|in) (YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`搜索在Tasks 3.1.0中引入。
> - `created (on or before|on or after) <date>`和`created (in or before|in or after) <date range>`搜索在Tasks 4.6.0中引入

自Tasks 4.2.0起，现在可以使用`task.created`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.dates_task.created_docs.approved.md -->

```javascript
filter by function task.created.format('dddd') === 'Monday'
```

- 查找在星期一创建的任务，即任何星期一。
- 在非英语系统上，您可能需要提供本地语言的星期几。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

有关更多示例，请参阅[[#到期日期]]。

### 取消日期

- `no cancelled date`
- `has cancelled date`
- `cancelled (on|before|after|on or before|on or after) <date>`
- `cancelled (in|before|after|in or before|in or after) <date range>`
  - `YYYY-MM-DD YYYY-MM-DD`
  - `(last|this|next) (week|month|quarter|year)`
  - `(YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`
- `cancelled date is invalid`

For more information, see [[Dates#Cancelled date|取消日期]].

Such a filter could be:

    ```tasks
    cancelled yesterday
    ```

> [!released]
>
> - 取消日期在Tasks 5.5.0中引入。

自Tasks 5.5.0起，现在可以使用`task.cancelled`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.dates_task.cancelled_docs.approved.md -->

```javascript
filter by function task.cancelled.format('dddd') === 'Wednesday'
```

- 查找在星期三取消的任务，即任何星期三。
- 在非英语系统上，您可能需要提供本地语言的星期几。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

For more examples, see [[#Due Date]].

### Happens
### 发生

- `happens (on|before|after|on or before|on or after) <date>`
- `happens (in|before|after|in or before|in or after) <date range>`
  - `YYYY-MM-DD YYYY-MM-DD`
  - `(last|this|next) (week|month|quarter|year)`
  - `(YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`

`happens` returns any task for a matching start date, scheduled date, _or_ due date.
For example, `happens before tomorrow` will return all tasks that are starting, scheduled, or due earlier than tomorrow.
If a task starts today and is due in a week from today, `happens before tomorrow` will match,
because the tasks starts before tomorrow. Only one of the dates needs to match.
`happens`返回任何匹配开始日期、计划日期_或_到期日期的任务。
例如，`happens before tomorrow`将返回所有在明天之前开始、计划或到期的任务。
如果一个任务今天开始并在一周后到期，`happens before tomorrow`将匹配，
因为该任务在明天之前开始。只需要一个日期匹配即可。

Invalid start, scheduled or due dates are ignored by `happens`.
`happens`忽略无效的开始日期、计划日期或到期日期。

- `no happens date`
  - Return tasks where _none_ of start date, scheduled date, and due date are set.
  - 返回_没有_设置开始日期、计划日期和到期日期的任务。
- `has happens date`
  - Return tasks where _any_ of start date, scheduled date, _or_ due date are set.
  - 返回设置了开始日期、计划日期_或_到期日期中_任意一个_的任务。

> [!released]
>
> - `no happens date`和`has happens date`在Tasks 1.7.0中引入。
> - `no happens date`和`has happens date`在Tasks 1.7.0中引入。
> - `happens (before|after|in) <date range>` searches were introduced in Tasks 2.0.0.
> - `happens (before|after|in) <date range>`搜索在Tasks 2.0.0中引入。
> - `happens (before|after|in) (YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)` searches were introduced in Tasks 3.1.0.
> - `happens (before|after|in) (YYYY-Www|YYYY-mm|YYYY-Qq|YYYY)`搜索在Tasks 3.1.0中引入。
> - `happens (on or before|on or after) <date>` and `happens (in or before|in or after) <date range>` searches were introduced in Tasks 4.6.0
> - `happens (on or before|on or after) <date>`和`happens (in or before|in or after) <date range>`搜索在Tasks 4.6.0中引入

自Tasks 4.2.0起，现在可以使用`task.happens`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.dates_task.happens_docs.approved.md -->

```javascript
filter by function task.happens.format('dddd') === 'Friday'
```

- 查找在星期五发生的任务，即任何星期五。
- 在非英语系统上，您可能需要提供本地语言的星期几。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

For more examples, see [[#Due Date]].
有关更多示例，请参阅[[#到期日期]]。

### Troubleshooting date searches
### 日期搜索故障排除

If your date searches are giving unexpected results, add an [[Explaining Queries|explain]] line to your query.
如果您的日期搜索给出意外结果，请在查询中添加[[Explaining Queries|解释]]行。

This will help you identify common mistakes such as:
这将帮助您识别常见错误，例如：

- Accidentally using an invalid absolute date in a filter.
- 在过滤器中意外使用无效的绝对日期。
- Using unsupported keywords in relative date ranges.
- 在相对日期范围中使用不支持的关键字。

If relative dates in queries do not update from the previous day, and your computer was sleeping at midnight, this is likely caused by a known Chrome bug and you will need to re-open the note. See [#1289](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1289).
如果查询中的相对日期没有从前一天更新，而您的计算机在午夜时处于休眠状态，这可能是由已知的Chrome错误引起的，您需要重新打开笔记。请参阅[#1289](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1289)。

### Finding Tasks with Invalid Dates
### 查找带有无效日期的任务

> [!released]
>
> - Validation of dates was introduced in Tasks 1.16.0.
> - 日期验证在Tasks 1.16.0中引入。
> - `created date is invalid` was introduced in Tasks 2.0.0.
> - `created date is invalid`在Tasks 2.0.0中引入。

It is possible to accidentally use a non-existent date on a task signifier, such as `📅 2022-02-30`. February has at most 29 days.
可能会意外在任务标识符上使用不存在的日期，例如`📅 2022-02-30`。二月最多有29天。

Such tasks look like they have a date, but that date will never be found. When viewed in Reading mode, the date will be shown as `Invalid date`.
此类任务看起来有日期，但永远不会找到该日期。在阅读模式下查看时，日期将显示为`Invalid date`。

Any such mistakes can be found systematically with this search:
任何此类错误都可以通过此搜索系统地找到：

<!-- include: ValidateTasks.test.validate-tasks_find_problem_dates.approved.text -->
````text
```tasks
# These instructions need to be all on one line:
(cancelled date is invalid) OR (created date is invalid) OR (done date is invalid) OR (due date is invalid) OR (scheduled date is invalid) OR (start date is invalid)

# Optionally, uncomment this line and exclude your templates location
# path does not include _templates

group by path
```
````
<!-- endInclude -->

> [!warning]
> If the above search finds any tasks with invalid dates, they are best fixed by clicking on the [[Backlinks|backlink]] to navigate
to the incorrect line, and fixing it by directly typing in the new date.
> 如果上述搜索找到任何带有无效日期的任务，最好通过点击[[Backlinks|反向链接]]导航
到错误的行，并通过直接输入新日期来修复它。

If you use the 'Create or edit Task' Modal, it will discard the broken date, and there will be no information about
the original, incorrect value.
如果您使用"创建或编辑任务"模态框，它将丢弃损坏的日期，并且不会有关于
原始错误值的信息。

## Filters for Other Task Properties
## 其他任务属性过滤器

As well as the date-related searches above, these filters search other properties in individual tasks.
除了上述与日期相关的搜索外，这些过滤器还搜索个别任务中的其他属性。

### Description
### 描述

- `description (includes|does not include) <string>`
  - Matches case-insensitive (disregards capitalization).
  - 匹配不区分大小写（忽略大小写）。
  - Disregards the global filter when matching.
  - 匹配时忽略全局过滤器。
- `description (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - Does regular expression match (case-sensitive by default).
  - 进行正则表达式匹配（默认区分大小写）。
  - Essential reading: [[Regular Expressions|Regular Expression Searches]].
  - 必读：[[Regular Expressions|正则表达式搜索]]。

> [!released]
`regex matches`和`regex does not match`在Tasks 1.12.0中引入。

For precise searches, it may help to know that `description`:
对于精确搜索，了解`description`的处理方式可能有帮助：

- first removes all each task's signifier emojis and their values,
- 首先删除每个任务的标识符表情符号及其值，
- then removes any global filter,
- 然后删除任何全局过滤器，
- then removes an trailing spaces
- 然后删除尾随空格
- and then searches the remaining text
- 然后搜索剩余的文本

For example:
例如：

| Global Filter    | Task line                                                                | Text searched by `description`   |
| ---------------- | ------------------------------------------------------------------------ | -------------------------------- |
| No global filter | `'- [ ] Do stuff  ⏫  #tag1 ✅ 2022-08-12 #tag2/sub-tag '`               | `'Do stuff #tag1 #tag2/sub-tag'` |
| `#task`          | `'- [ ] #task Do stuff  ⏫  #tag1 ✅ 2022-08-12 #tag2/sub-tag '`         | `'Do stuff #tag1 #tag2/sub-tag'` |
| `global-filter`  | `'- [ ] global-filter Do stuff  ⏫  #tag1 ✅ 2022-08-12 #tag2/sub-tag '` | `'Do stuff #tag1 #tag2/sub-tag'` |

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by description** is now possible, using `task.description`.
自Tasks 4.2.0起，现在可以使用`task.description`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.description_docs.approved.md -->

```javascript
filter by function task.description.length > 100
```

- Find tasks with long descriptions.
- 查找描述较长的任务。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Description without tags
### 不含标签的描述

Since Tasks 4.2.0, it is possible to remove tags from the descriptions in custom filters, for use in **[[Custom Filters|custom filtering]]**, using `task.descriptionWithoutTags`.
自Tasks 4.2.0起，可以在自定义过滤器中从描述中删除标签，用于**[[Custom Filters|自定义过滤]]**，使用`task.descriptionWithoutTags`。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.descriptionWithoutTags_docs.approved.md -->

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Priority
### 优先级

- `priority is (above|below|not)? (lowest|low|none|medium|high|highest)`

The available priorities are (from high to low):
可用的优先级（从高到低）：

1. 🔺 for highest priority
1. 🔺 表示最高优先级
2. ⏫ for high priority
2. ⏫ 表示高优先级
3. 🔼 for medium priority
3. 🔼 表示中等优先级
4. use no signifier to indicate no priority (searched for with 'none')
4. 不使用标识符表示无优先级（用'none'搜索）
5. 🔽 for low priority
5. 🔽 表示低优先级
6. ⏬️ for lowest priority
6. ⏬️ 表示最低优先级

For more information, see [[Priority|Priorities]].
有关更多信息，请参阅[[Priority|优先级]]。

> [!released]
> Priorities 'lowest' and 'highest' were introduced in Tasks 3.9.0.
> 优先级'lowest'和'highest'在Tasks 3.9.0中引入。

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by priority name and number** is now possible, using `task.priorityName` and `task.priorityNumber`.
自Tasks 4.2.0起，现在可以使用`task.priorityName`和`task.priorityNumber`进行**[[Custom Filters|自定义过滤]]**。

Using the priority name:
使用优先级名称：

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.priorityName_docs.approved.md -->

```javascript
filter by function task.priorityName !== 'Normal'
```

- The same as `priority is not none`.
- 与`priority is not none`相同。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

Using the priority number:
使用优先级编号：

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.priorityNumber_docs.approved.md -->

```javascript
filter by function task.priorityNumber % 2 === 0
```

- Filter using the task's priority number, where Highest is 0 and Lowest is 5.
- 使用任务的优先级编号进行过滤，其中最高优先级为0，最低优先级为5。
- This artificial example finds all the tasks with even priority numbers, so Highest, Medium and Low priorities.
- 这个人为的示例查找所有优先级编号为偶数的任务，即最高、中等和低优先级。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

#### Examples
#### 示例

    ```tasks
    not done
    priority is above none
    ```

    ```tasks
    priority is high
    ```

    ```tasks
    not done
    priority is not none
    ```

### Urgency
### 紧急度

There is no built-in instruction to filter by urgency.
没有内置指令来按紧急度过滤。

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by urgency** is now possible, using `task.urgency`.
自Tasks 4.2.0起，现在可以使用`task.urgency`进行**[[Custom Filters|自定义过滤]]**。

> [!Warning]
> Please read the following examples carefully. To use `task.urgency`  with `filter by function` successfully, it is important to understand how to handle searches for non-integer numbers.
> 请仔细阅读以下示例。要成功使用`task.urgency`与`filter by function`，重要的是要了解如何处理非整数的搜索。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.urgency_docs.approved.md -->

```javascript
filter by function task.urgency > 8.9999
```

- Find tasks with an urgency score above `9.0`.
- 查找紧急度分数高于`9.0`的任务。
- Note that limiting value used is `8.9999`.
- 注意使用的限制值是`8.9999`。
- Searches that compare two urgency values for 'less than' or 'more than' (using one of `>`, `>=`, `<` or `<=`) **must adjust their values slightly to allow for rounding**.
- 比较两个紧急度值的"小于"或"大于"搜索（使用`>`、`>=`、`<`或`<=`之一）**必须稍微调整其值以允许舍入**。

```javascript
filter by function task.urgency > 7.9999 && task.urgency < 11.0001
```

- Find tasks with an urgency score between `8.0` and `11.0`, inclusive.
- 查找紧急度分数在`8.0`和`11.0`之间（包含）的任务。

```javascript
filter by function task.urgency.toFixed(2) === 1.95.toFixed(2)
```

- Find tasks with the [[Urgency#Why do all my tasks have urgency score 1.95?|default urgency]] of `1.95`.
- 查找具有[[Urgency#Why do all my tasks have urgency score 1.95?|默认紧急度]]`1.95`的任务。
- This is the correct way to do an equality or inequality search for any numeric values.
- 这是对任何数值进行相等或不等搜索的正确方法。
- The `.toFixed(2)` on both sides of the `===` ensures that two numbers being compared are both rounded to the same number of decimal places (2).
- `===`两边的`.toFixed(2)`确保比较的两个数字都舍入到相同的小数位数（2位）。
- This is important, to prevent being tripped up `10.29` being not exactly the same when comparing non-integer numbers.
- 这很重要，可以防止在比较非整数时被`10.29`不完全相同的情况绊倒。

```javascript
filter by function task.urgency.toFixed(2) !== 1.95.toFixed(2)
```

- Find tasks with any urgency other than the default score of `1.95`.
- 查找紧急度不是默认分数`1.95`的任务。

```javascript
filter by function task.urgency === 10.29
```

- **This will not find any tasks**.
- **这不会找到任何任务**。
- ==Do not use raw numbers in searches for equality or inequality of any numbers==, either seemingly integer or floating point ones.
- ==不要在任何数字的相等或不等搜索中使用原始数字==，无论是看似整数还是浮点数。
- From using `group by urgency` and reviewing the headings, we might conclude that tasks with the following values have urgency `10.19`:
- 通过使用`group by urgency`并查看标题，我们可能会得出以下值的任务具有紧急度`10.19`：
  - due tomorrow,
  - 明天到期，
  - have no priority symbol.
  - 没有优先级符号。
- From this, it might be natural to presume that we can search for `task.urgency === 10.29`.
- 由此，可能自然地假设我们可以搜索`task.urgency === 10.29`。
- However, our function is checking the following values for equality:
- 但是，我们的函数正在检查以下值的相等性：
  - `task.urgency` is approximately:
  - `task.urgency`大约是：
    - `10.292857142857140928526860079728`
  - `10.29` is approximately:
  - `10.29`大约是：
    - `10.289999999999999147348717087880`
- These values are **not exactly equal**, so the test fails to find any matching tasks.
- 这些值**不完全相等**，因此测试无法找到任何匹配的任务。

### Recurrence
### 重复

- `is recurring`
- `is not recurring`
- `recurrence (includes|does not include) <part of recurrence rule>`
  - Matches case-insensitive (disregards capitalization).
  - 匹配不区分大小写（忽略大小写）。
  - Note that the text searched is generated programmatically and standardised, and so may not exactly match the text in any manually typed tasks. For example, a task with `🔁 every Sunday` will be searched as `every week on Sunday`.
  - 请注意，搜索的文本是以编程方式生成并标准化的，因此可能与任何手动输入任务中的文本不完全匹配。例如，带有`🔁 every Sunday`的任务将被搜索为`every week on Sunday`。
  - The easiest way to see the standardised recurrence rule of your tasks is to use `group by recurrence`, and review the resulting group headings.
  - 查看任务标准化重复规则的最简单方法是使用`group by recurrence`，并查看结果的组标题。
- `recurrence (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - Does regular expression match (case-sensitive by default).
  - 进行正则表达式匹配（默认区分大小写）。
  - Essential reading: [[Regular Expressions|Regular Expression Searches]].
  - 必读：[[Regular Expressions|正则表达式搜索]]。

For more information, see [[Recurring Tasks]].
有关更多信息，请参阅[[Recurring Tasks|重复任务]]。

> [!released]
`recurrence` text searching was introduced in Tasks 1.22.0.
`recurrence`文本搜索在Tasks 1.22.0中引入。

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by recurrence** is now possible, using `task.isRecurring` and `task.recurrenceRule`.
自Tasks 4.2.0起，现在可以使用`task.isRecurring`和`task.recurrenceRule`进行**[[Custom Filters|自定义过滤]]**。

Using `task.isRecurring`:
使用`task.isRecurring`：

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.isRecurring_docs.approved.md -->

```javascript
filter by function task.isRecurring
```

- This is identical to `is recurring`.
- 这与`is recurring`相同。
- It can be used with `&&` (Boolean AND) or `||` (Boolean OR) in conjunction with other conditions.
- 它可以与`&&`（布尔AND）或`||`（布尔OR）结合其他条件使用。

```javascript
filter by function !task.isRecurring
```

- This is identical to `is not recurring`.
- 这与`is not recurring`相同。
- It can be used with `&&` (Boolean AND) or `||` (Boolean OR) in conjunction with other conditions.
- 它可以与`&&`（布尔AND）或`||`（布尔OR）结合其他条件使用。

```javascript
filter by function (!task.isRecurring) && task.originalMarkdown.includes('🔁')
```

- Find tasks that have a **broken/invalid recurrence rule**.
- 查找具有**损坏/无效重复规则**的任务。
- This assumes use of the Tasks emoji format, and should of course be updated if using another format.
- 这假设使用任务表情符号格式，当然如果使用其他格式则需要更新。
- This uses knowledge of an implementation detail of Tasks, which is that recurrence rules are read and removed from the description even if they are invalid.
- 这使用了任务的实现细节，即即使重复规则无效，也会从描述中读取和删除重复规则。
- So we have to search for the recurrence marker in `task.originalMarkdown` to see whether the original task contained the recurrence signifier when `task.isRecurring` even though false.
- 因此，我们需要在`task.originalMarkdown`中搜索重复标记，以查看当`task.isRecurring`为false时，原始任务是否包含重复标识符。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

Using `task.recurrenceRule` - please read [[Task Properties#Values for Other Task Properties]] notes on `task.recurrenceRule` before use:
使用`task.recurrenceRule` - 请在使用前阅读[[Task Properties#Values for Other Task Properties|任务属性#其他任务属性的值]]中关于`task.recurrenceRule`的说明：

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.recurrenceRule_docs.approved.md -->

```javascript
filter by function task.recurrenceRule.includes("every week")
```

- Similar to `recurrence includes every week`, but case-sensitive.
- 类似于`recurrence includes every week`，但区分大小写。

```javascript
filter by function !task.recurrenceRule.includes("every week")
```

- Similar to `recurrence does not include every week`, but case-sensitive.
- 类似于`recurrence does not include every week`，但区分大小写。

```javascript
filter by function task.recurrenceRule.includes("every week") && task.recurrenceRule.includes("when done")
```

- Find tasks that are due every week, and **do** contain `when done` in their recurrence rule.
- 查找每周到期的任务，并且在其重复规则中**包含**`when done`。

```javascript
filter by function task.recurrenceRule.includes("every week") && !task.recurrenceRule.includes("when done")
```

- Find tasks that are due every week, and do **not** contain `when done` in their recurrence rule.
- 查找每周到期的任务，并且在其重复规则中**不包含**`when done`。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### Sub-Items
### 子项目

- `exclude sub-items`
  - When this is set, the result list will only include tasks that are not indented in their file. It will only show tasks that are top level list items in their list.
  - 设置此项时，结果列表将只包括在文件中未缩进的任务。它只会显示列表中的顶级列表项任务。

### Tags
### 标签

> [!released]
Introduced in Tasks 1.6.0.
在Tasks 1.6.0中引入。

See [[Tags]] for important information about how tags behave in the Tasks plugin.
有关标签在Tasks插件中如何表现的重要信息，请参阅[[Tags|标签]]。

- `no tags`
- `has tags`
- `tags (include|do not include) <tag>` _or_
- `tag (includes|does not include) <tag>`
  - Matches case-insensitive (disregards capitalization).
  - 匹配不区分大小写（忽略大小写）。
  - Disregards the global filter when matching.
  - 匹配时忽略全局过滤器。
  - The `#` is optional on the tag so `#home` and `home` will work to match `#home`.
  - 标签上的`#`是可选的，因此`#home`和`home`都可以匹配`#home`。
  - If the `#` is given, it must be present, so searching for `#home` will match `#home` but not `#location/home`.
  - 如果给出了`#`，则必须存在，因此搜索`#home`将匹配`#home`但不匹配`#location/home`。
  - The match is partial so `tags include foo` will match `#foo/bar` and `#foo-bar`.
  - 匹配是部分的，因此`tags include foo`将匹配`#foo/bar`和`#foo-bar`。
- `tags (regex matches|regex does not match) /<JavaScript-style Regex>/` _or_
- `tag (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - Does regular expression match (case-sensitive by default).
  - 进行正则表达式匹配（默认区分大小写）。
  - Essential reading: [[Regular Expressions|Regular Expression Searches]].
  - 必读：[[Regular Expressions|正则表达式搜索]]。
  - This enables tag searches that avoid sub-tags, by putting a `$` character at the end of the regular expression. See examples below.
  - 通过在正则表达式末尾放置`$`字符，这使得标签搜索可以避免子标签。请参阅下面的示例。
  - If searching for sub-tags, remember to escape the slashes in regular expressions: `\/`
  - 如果搜索子标签，请记住在正则表达式中转义斜杠：`\/`

> [!released]
>
> - `regex matches` and `regex does not match` were introduced in Tasks 1.13.0.
> - `regex matches`和`regex does not match`在Tasks 1.13.0中引入。
> - `no tags`和`has tags`在Tasks 2.0.0中引入。

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by tags** is now possible, using `task.tags`.
自Tasks 4.2.0起，现在可以使用`task.tags`进行**[[Custom Filters|自定义过滤]]**。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.tags_docs.approved.md -->

```javascript
filter by function task.tags.length === 1
```

- Find tasks with exactly 1 tag (other than any global filter).
- 查找恰好有1个标签的任务（除了任何全局过滤器）。

```javascript
filter by function task.tags.length > 1
```

- Find tasks with more than one tag (other than any global filter).
- 查找有多个标签的任务（除了任何全局过滤器）。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

These are more complicated examples, which you might like to copy if you use tasks with [nested tags](https://help.obsidian.md/Editing+and+formatting/Tags#Nested+tags).
这些是更复杂的示例，如果您使用带有[嵌套标签](https://help.obsidian.md/Editing+and+formatting/Tags#Nested+tags)的任务，您可能想要复制它们。

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.tags.advanced_docs.approved.md -->

```javascript
filter by function task.tags.find( (tag) => tag.includes('/') ) && true || false
```

- Find all tasks that have at least one nested tag.
- 查找至少有一个嵌套标签的所有任务。

```javascript
filter by function task.tags.find( (tag) => tag.split('/').length >= 3 ) && true || false
```

- Find all tasks that have at least one doubly-nested tag, such as `#context/home/ground-floor`.
- 查找至少有一个双重嵌套标签的所有任务，例如`#context/home/ground-floor`。
- This splits each tag at the `/` character, and counts as a match if there are at least 3 words.
- 这在`/`字符处分割每个标签，如果至少有3个单词则计为匹配。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

#### Tag Query Examples
#### 标签查询示例

- `tags include #todo`
- `tags do not include #todo`
- `tag regex matches /#t$/`
  - Searches for a single-character tag `#t`, with no sub-tags, because `$` matches the end of the tag text.
  - 搜索单字符标签`#t`，没有子标签，因为`$`匹配标签文本的末尾。
- `tag regex matches /#book$/i`
  - The trailing `i` means case-insensitive.
  - 尾随的`i`表示不区分大小写。
  - Searches for tags such as `#book`,  `#Book`, `#BOOK` and the `$` prevents matching of `#books`,  `#book/literature`, etc.
  - 搜索`#book`、`#Book`、`#BOOK`等标签，`$`防止匹配`#books`、`#book/literature`等。

### Original Markdown
### 原始Markdown

There is no built-in instruction to filter by the original markdown line.
没有内置指令来按原始markdown行过滤。

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by original markdown line** is now possible, using `task.originalMarkdown`.
自Tasks 4.2.0起，现在可以使用`task.originalMarkdown`进行**[[Custom Filters|自定义过滤]]**。

For example, this could be used to extract information from `task.originalMarkdown` that Tasks does not parse, to use for filtering tasks.
例如，这可以用于从`task.originalMarkdown`中提取Tasks不解析的信息，用于过滤任务。

### Line Number
### 行号

There is no built-in instruction to filter by the task's line number.
没有内置指令来按任务的行号过滤。

Since Tasks 7.16.0, **[[Custom Filters|custom filtering]] by the task's line number** is now possible, using `task.lineNumber`.
自Tasks 7.16.0起，现在可以使用`task.lineNumber`进行**[[Custom Filters|自定义过滤]]**。

> [!tip]
> With `task.lineNumber`, the first line in the file is on line number `0` (zero), not `1` (one).
> 使用`task.lineNumber`时，文件中的第一行是行号`0`（零），而不是`1`（一）。

## Filters for File Properties
## 文件属性过滤器

These filters allow searching for tasks in particular files and sections of files.
这些过滤器允许在特定文件和文件的部分中搜索任务。

### File Path
### 文件路径

Note that the path includes the `.md` extension.
请注意，路径包括`.md`扩展名。

- `path (includes|does not include) <path>`
  - Matches case-insensitive (disregards capitalization).
  - 匹配不区分大小写（忽略大小写）。
  - Use `{{query.file.path}}` or `{{query.file.pathWithoutExtension}}` as a placeholder for the path of the file containing the current query.
  - 使用`{{query.file.path}}`或`{{query.file.pathWithoutExtension}}`作为包含当前查询的文件路径的占位符。
    - For example, `path includes {{query.file.path}}`
    - 例如，`path includes {{query.file.path}}`
    - Useful reading: [[Query Properties]] and [[Placeholders]]
    - 有用的阅读：[[Query Properties|查询属性]]和[[Placeholders|占位符]]
- `path (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - Does regular expression match (case-sensitive by default).
  - 进行正则表达式匹配（默认区分大小写）。
  - Essential reading: [[Regular Expressions|Regular Expression Searches]].
  - 必读：[[Regular Expressions|正则表达式搜索]]。

> [!released]
>
> - `regex matches` and `regex does not match` were introduced in Tasks 1.12.0.
> - `regex matches`和`regex does not match`在Tasks 1.12.0中引入。
> - Placeholders were released in Tasks 4.7.0.
> - 占位符在Tasks 4.7.0中发布。

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by file path** is now possible, using `task.file.path`.
自Tasks 4.2.0起，现在可以使用`task.file.path`进行**[[Custom Filters|自定义过滤]]**。

In Tasks 4.8.0 `task.file.pathWithoutExtension` was added.
在Tasks 4.8.0中添加了`task.file.pathWithoutExtension`。

Since Tasks 5.1.0, the query's file path can be used conveniently in custom filters:
自Tasks 5.1.0起，查询的文件路径可以在自定义过滤器中方便地使用：

- `query.file.path` or
- `query.file.pathWithoutExtension`
- Useful reading: [[Query Properties]].

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.file_properties_task.file.path_docs.approved.md -->

```javascript
filter by function task.file.path.includes('tasks releases/4.1.0 Release.md')
```

- Like 'path includes', except that it is **case-sensitive**: capitalisation matters.

```javascript
filter by function task.file.path === 'tasks releases/4.1.0 Release.md'
```

- An exact, **case-sensitive**, equality search.
- Note that the file extension needs to be included too.
- With built-in searches, this could only be done using a regular expression, with special characters `^` and `$`, and escaping any characters with special meaning such as `/`.

```javascript
filter by function task.file.path.toLocaleLowerCase() === 'TASKS RELEASES/4.1.0 RELEASE.MD'.toLocaleLowerCase()
```

- An exact, **non**-case-sensitive, equality search.
- By lower-casing both values, we do not have to worry about manually lower-casing them in our query.

<!-- placeholder to force blank line after included text --><!-- endInclude -->
### Root

> [!released]
>
> - Introduced in Tasks 3.4.0.
> - 在Tasks 3.4.0中引入。
> - Placeholders were released in Tasks 4.7.0.
> - 占位符在Tasks 4.7.0中发布。

The `root` is the top-level folder of the file that contains the task, that is, the first directory in the path, which will be `/` for files in the root of the vault.
`root`是包含任务的文件的顶级文件夹，即路径中的第一个目录，对于保险库根目录中的文件，它将是`/`。

- `root (includes|does not include) <root>`
  - Matches case-insensitive (disregards capitalization).
  - 匹配不区分大小写（忽略大小写）。
  - Use `{{query.file.root}}` as a placeholder for the root of the file containing the current query.
  - 使用`{{query.file.root}}`作为包含当前查询的文件根目录的占位符。
    - For example, `root includes {{query.file.root}}`
    - 例如，`root includes {{query.file.root}}`
    - Useful reading: [[Query Properties]] and [[Placeholders]]
    - 有用的阅读：[[Query Properties|查询属性]]和[[Placeholders|占位符]]
- `root (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - Does regular expression match (case-sensitive by default).
  - 进行正则表达式匹配（默认区分大小写）。
  - Essential reading: [[Regular Expressions|Regular Expression Searches]].
  - 必读：[[Regular Expressions|正则表达式搜索]]。

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by root folder** is now possible, using `task.file.root`.
自Tasks 4.2.0起，现在可以使用`task.file.root`进行**[[Custom Filters|自定义过滤]]**。

Since Tasks 5.1.0, the query's file root can be used conveniently in custom filters:
自Tasks 5.1.0起，查询的文件根目录可以在自定义过滤器中方便地使用：

- `query.file.root`
- Useful reading: [[Query Properties]].
- 有用的阅读：[[Query Properties|查询属性]]。

- Find tasks in files in the root of the vault.
- 查找保险库根目录中文件的任务。
- Note that this is **case-sensitive**: capitalisation matters.
- 注意这是**区分大小写**的：大小写很重要。

### Folder

> [!released]
>
> - Introduced in Tasks 3.4.0.
> - 在Tasks 3.4.0中引入。
> - Placeholders were released in Tasks 4.7.0.
> - 占位符在Tasks 4.7.0中发布。

This is the `folder` to the file that contains the task, which will be `/` for files in root of the vault.
这是包含任务的文件的`folder`，对于保险库根目录中的文件，它将是`/`。

- `folder (includes|does not include) <folder>`
  - Matches case-insensitive (disregards capitalization).
  - 匹配不区分大小写（忽略大小写）。
  - Use `{{query.file.folder}}` as a placeholder for the folder of the file containing the current query.
  - 使用`{{query.file.folder}}`作为包含当前查询的文件文件夹的占位符。
    - For example, `folder includes {{query.file.folder}}`, which will match tasks in the folder containing the query **and all sub-folders**.
    - 例如，`folder includes {{query.file.folder}}`，这将匹配包含查询的文件夹**和所有子文件夹**中的任务。
    - Useful reading: [[Query Properties]] and [[Placeholders]]
    - 有用的阅读：[[Query Properties|查询属性]]和[[Placeholders|占位符]]
- `folder (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - Does regular expression match (case-sensitive by default).
  - 进行正则表达式匹配（默认区分大小写）。
  - Essential reading: [[Regular Expressions|Regular Expression Searches]].
  - 必读：[[Regular Expressions|正则表达式搜索]]。

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by folder** is now possible, using `task.file.folder`.
自Tasks 4.2.0起，现在可以使用`task.file.folder`进行**[[Custom Filters|自定义过滤]]**。

Since Tasks 5.1.0, the query's file root can be used conveniently in custom filters:
自Tasks 5.1.0起，查询的文件根目录可以在自定义过滤器中方便地使用：

- `query.file.root`
- Useful reading: [[Query Properties]].
- 有用的阅读：[[Query Properties|查询属性]]。

- Find tasks in files in any file in the given folder **only**, and not any sub-folders.
- 查找给定文件夹中任何文件的任务**仅**，而不是任何子文件夹。
- The equality test, `===`, requires that the trailing slash (`/`) be included.
- 相等测试`===`要求包含尾随斜杠（`/`）。

- Find tasks in files in a specific folder **and any sub-folders**.
- 查找特定文件夹**和任何子文件夹**中文件的任务。

- Find tasks in files in the folder that contains the query **and any sub-folders**.
- 查找包含查询的文件夹**和任何子文件夹**中文件的任务。

- Find tasks in files in the folder that contains the query only (**not tasks in any sub-folders**).
- 仅查找包含查询的文件夹中文件的任务（**不包括任何子文件夹中的任务**）。

- By leaving off the trailing slash (`/`) this would also find tasks in any file inside folders such as:
- 通过省略尾随斜杠（`/`），这也会找到文件夹内任何文件中的任务，例如：
  - `Work/Projects 2023/`
  - `Work/Projects Top Secret/`

### File Name
### 文件名

> [!released]
>
> - Introduced in Tasks 3.4.0.
> - 在Tasks 3.4.0中引入。
> - Placeholders were released in Tasks 4.7.0.
> - 占位符在Tasks 4.7.0中发布。

Note that the file name includes the `.md` extension.
请注意，文件名包括`.md`扩展名。

- `filename (includes|does not include) <filename>`
  - Matches case-insensitive (disregards capitalization).
  - 匹配不区分大小写（忽略大小写）。
  - Use `{{query.file.filename}}`  or `{{query.file.filenameWithoutExtension}}` as a placeholder for the file name of the file containing the current query.
  - 使用`{{query.file.filename}}`或`{{query.file.filenameWithoutExtension}}`作为包含当前查询的文件的文件名占位符。
    - For example, `filename includes {{query.file.filename}}`
    - 例如，`filename includes {{query.file.filename}}`
    - Useful reading: [[Query Properties]] and [[Placeholders]]
    - 有用的阅读：[[Query Properties|查询属性]]和[[Placeholders|占位符]]
- `filename (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - Does regular expression match (case-sensitive by default).
  - 进行正则表达式匹配（默认区分大小写）。
  - Essential reading: [[Regular Expressions|Regular Expression Searches]].
  - 必读：[[Regular Expressions|正则表达式搜索]]。

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by file name** is now possible, using `task.file.filename`.
自Tasks 4.2.0起，现在可以使用`task.file.filename`进行**[[Custom Filters|自定义过滤]]**。

In Tasks 4.8.0 `task.file.filenameWithoutExtension` was added.
在Tasks 4.8.0中添加了`task.file.filenameWithoutExtension`。

Since Tasks 5.1.0, the query's file name can be used conveniently in custom filters:
自Tasks 5.1.0起，查询的文件名可以在自定义过滤器中方便地使用：

- `query.file.filename` or
- `query.file.filenameWithoutExtension`
- Useful reading: [[Query Properties]].
- 有用的阅读：[[Query Properties|查询属性]]。

- Find tasks in files with the exact file name, but in any folder.
- 查找具有确切文件名但在任何文件夹中的文件的任务。

- Find tasks in files whose name contains the given text.
- 查找文件名包含给定文本的文件中的任务。

### Heading
### 标题

- `heading (includes|does not include) <string>`
  - Whether or not the heading preceding the task includes the given string.
  - 任务前面的标题是否包含给定字符串。
  - Always tries to match the closest heading above the task, regardless of heading level.
  - 始终尝试匹配任务上方最近的标题，无论标题级别如何。
  - `does not include` will match a task that does not have a preceding heading in its file.
  - `does not include`将匹配在其文件中没有前置标题的任务。
  - Matches case-insensitive (disregards capitalization).
  - 匹配不区分大小写（忽略大小写）。
- `heading (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - Whether or not the heading preceding the task includes the given regular expression (case-sensitive by default).
  - 任务前面的标题是否包含给定的正则表达式（默认区分大小写）。
  - Always tries to match the closest heading above the task, regardless of heading level.
  - 始终尝试匹配任务上方最近的标题，无论标题级别如何。
  - `regex does not match` will match a task that does not have a preceding heading in its file.
  - `regex does not match`将匹配在其文件中没有前置标题的任务。
  - Essential reading: [[Regular Expressions|Regular Expression Searches]].
  - 必读：[[Regular Expressions|正则表达式搜索]]。

> [!released]
`regex matches`和`regex does not match`在Tasks 1.12.0中引入。

Since Tasks 4.2.0, **[[Custom Filters|custom filtering]] by heading** is now possible, using `task.heading`.
自Tasks 4.2.0起，现在可以使用`task.heading`进行**[[Custom Filters|自定义过滤]]**。

> [!Tip]
> Heading searches can be very powerful: you can put information in headings and then write your searches to look for the information:
> 标题搜索可以非常强大：您可以在标题中放置信息，然后编写搜索来查找信息：
>
> - either on the task,
> - 要么在任务上，
> - or if it's missing from the task, then look for it in the preceding heading.
> - 或者如果任务中缺少它，则在前面的标题中查找它。
>
> It is like a more generalisable version of the built-in mechanism to infer [[Use Filename as Default Date|a scheduled date from a filename]], under your own control.
> 这就像是内置机制的更通用版本，可以推断[[Use Filename as Default Date|从文件名推断计划日期]]，在您自己的控制下。

- Find tasks that:
- 查找任务：
  - **either** due on the date `2023-06-11`,
  - **要么**在日期`2023-06-11`到期，
  - **or** do not have a due date, and their preceding heading contains the same date as a string: `2023-06-11`.
  - **或者**没有到期日期，其前面的标题包含作为字符串的相同日期：`2023-06-11`。
- Note that because we use variables to avoid repetition of values, we need to add `return`.
- 注意，因为我们使用变量来避免重复值，我们需要添加`return`。

- Find tasks that:
- 查找任务：
  - **either** due on today's date,
  - **要么**在今天的日期到期，
  - **or** do not have a due date, and their preceding heading contains today's date as a string, formatted as `YYYY-MM-DD`.
  - **或者**没有到期日期，其前面的标题包含格式为`YYYY-MM-DD`的今天日期字符串。

- Find tasks that:
- 查找任务：
  - **either** have a tag exactly matching `#context/home` on the task line,
  - **要么**在任务行上有完全匹配`#context/home`的标签，
  - **or** their preceding heading contains the text `#context/home` anywhere.
  - **或者**其前面的标题在任何地方包含文本`#context/home`。
    - For demonstration purposes, this is slightly imprecise, in that it would also match nested tasks, such as `#context/home/ground-floor`.
    - 出于演示目的，这稍微不精确，因为它也会匹配嵌套任务，例如`#context/home/ground-floor`。

![Custom filters can extract dates and tags from headings](images/search-headings-for-date-and-tag.png)
Custom filters can extract dates and tags from headings.
自定义过滤器可以从标题中提取日期和标签。

## Appendix: Tasks 2.0.0 improvements to date filters
## 附录：Tasks 2.0.0对日期过滤器的改进

Tasks 2.0.0 introduced the concept of filtering for date ranges.
Tasks 2.0.0引入了日期范围过滤的概念。

In all cases, this new feature improves the results of Tasks date filters.
在所有情况下，这个新功能都改进了Tasks日期过滤器的结果。

This Appendix shows how the results of various searches have changes, to enable you to decide whether any existing searches need to be updated.
本附录显示了各种搜索结果的变化，以便您决定是否需要更新任何现有搜索。

### due (before|on|in||after) absolute date: results unchanged
### due (before|on|in||after) 绝对日期：结果未改变

Unchanged interpretation of various **[[Filters#Absolute dates|absolute due date]]** filters:
各种**[[Filters#绝对日期|绝对到期日期]]**过滤器的解释未改变：

| keyword     | Tasks 1.25.0 and earlier                                                                          | Tasks 2.0.0 onwards                                                                              |
| 关键字     | Tasks 1.25.0及更早版本                                                                          | Tasks 2.0.0及以后版本                                                                              |
| ----------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| **Summary** | All searches behave logically, using the correct date.                                            | Identical behaviour to previous releases.                                                         |
| **摘要** | 所有搜索行为逻辑，使用正确的日期。                                            | 与以前的版本行为相同。                                                         |

### due (before|on|in||after) absolute date range: results improved
### due (before|on|in||after) 绝对日期范围：结果改进

Differences in interpretation of various **[[Filters#Absolute date ranges|absolute due date range]]** filters:
各种**[[Filters#绝对日期范围|绝对到期日期范围]]**过滤器解释的差异：

| keyword     | Tasks 1.25.0 and earlier                                                                                    | Tasks 2.0.0 onwards                                                                                                                                               |
| 关键字     | Tasks 1.25.0及更早版本                                                                                    | Tasks 2.0.0及以后版本                                                                                                                                               |
| ----------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Summary** | The second date is ignored: only the first date is used.                                                    | The values are interpreted as a date range.<br>`after` takes the end date in to account.                                                                                                                                                                   |
| **摘要** | 第二个日期被忽略：只使用第一个日期。                                                    | 这些值被解释为日期范围。<br>`after`考虑结束日期。                                                                                                                                                                   |

### due (before|on|in||after) last week: results improved
### due (before|on|in||after) last week：结果改进

Differences in interpretation of various **[[Filters#Relative date ranges|relative due date range]]** filters, when run on `2023-02-10` (Friday 10th February 2023):
各种**[[Filters#相对日期范围|相对到期日期范围]]**过滤器在`2023-02-10`（2023年2月10日星期五）运行时的解释差异：

| keyword     | Tasks 1.25.0 and earlier                                                                       | Tasks 2.0.0 onwards                                                                                                                               |
| 关键字     | Tasks 1.25.0及更早版本                                                                       | Tasks 2.0.0及以后版本                                                                                                                               |
| ----------- | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Summary** | `last week` is interpreted as a single date:<br> `7 days before the current date`.             | `last week` is interpreted as a date range:<br>the previous `Monday to Sunday`.<br>`after` takes the end date in to account.                       |
| **摘要** | `last week`被解释为单个日期：<br>`当前日期前7天`。             | `last week`被解释为日期范围：<br>上一个`星期一到星期日`。<br>`after`考虑结束日期。                       |

### due (before|on|in||after) this week: results improved
### due (before|on|in||after) this week：结果改进

Differences in interpretation of various **[[Filters#Relative date ranges|relative due date range]]** filters, when run on `2023-02-10` (Friday 10th February 2023):
各种**[[Filters#相对日期范围|相对到期日期范围]]**过滤器在`2023-02-10`（2023年2月10日星期五）运行时的解释差异：

| keyword     | Tasks 1.25.0 and earlier                                                                       | Tasks 2.0.0 onwards                                                                                                                                |
| 关键字     | Tasks 1.25.0及更早版本                                                                       | Tasks 2.0.0及以后版本                                                                                                                                |
| ----------- | ---------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Summary** | `this week` is interpreted as a single date:<br>`the sunday before the current date`           | `this week` is interpreted as a date range:<br>the `Monday to Sunday containing the current day`.<br>`after` takes the end date in to account.      |
| **摘要** | `this week`被解释为单个日期：<br>`当前日期前的星期日`           | `this week`被解释为日期范围：<br>包含当前日期的`星期一到星期日`。<br>`after`考虑结束日期。      |

### due (before|on|in||after) next week: results improved
### due (before|on|in||after) next week：结果改进

Differences in interpretation of various **[[Filters#Relative date ranges|relative due date range]]** filters, when run on `2023-02-10` (Friday 10th February 2023):
各种**[[Filters#相对日期范围|相对到期日期范围]]**过滤器在`2023-02-10`（2023年2月10日星期五）运行时的解释差异：

| keyword     | Tasks 1.25.0 and earlier                                                                        | Tasks 2.0.0 onwards                                                                                                                                 |
| 关键字     | Tasks 1.25.0及更早版本                                                                        | Tasks 2.0.0及以后版本                                                                                                                                 |
| ----------- | ----------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Summary** | `next week` is interpreted as a single date:<br> `7 days after the current date`.               | `next week` is interpreted as a date range:<br>the next `Monday to Sunday`.<br>`after` takes the end date in to account.                             |
| **摘要** | `next week`被解释为单个日期：<br>`当前日期后7天`。               | `next week`被解释为日期范围：<br>下一个`星期一到星期日`。<br>`after`考虑结束日期。                             |

## 任务依赖过滤器

在高层次上，任务依赖定义了您想要处理一组任务的顺序。您可以在[[Task Dependencies|任务依赖]]中了解更多信息。

> [!released]
> 任务依赖在Tasks 6.1.0中引入。

### 阻塞任务

- `is blocking`
  - 这显示您可能想要首先完成的任务，因为它们阻止其他任务被完成。
- `is not blocking`
  - 这显示不阻止其他任务被完成的任务，因此可能被认为是较低优先级。
  - 这通常与`not done`一起使用。

如果满足以下条件，任务被视为`blocking`：

- 它有一个`id`值，
- 保险库中至少有一个其他任务在其`dependsOn`列表中有该`id`值，
- 两个任务的状态类型都是`TODO`或`IN_PROGRESS`。

例如：

```text
- [ ] I am blocking 🆔 12345
- [ ] I am not blocking ⛔ 12345
```

还要注意：

- 只考虑直接依赖。
- 状态类型为`DONE`、`CANCELLED`或`NON_TASK`的任务永远不会被视为`blocking`。

有关更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - `is blocking`和`is not blocking`在Tasks 6.1.0中引入。

### 被阻塞任务

- `is blocked`
  - 这显示您当前无法完成的任务，因为它们正在等待另一个任务完成。
- `is not blocked`
  - 这显示不等待任何其他任务完成的任务。
  - 这通常与`not done`一起使用。

如果满足以下条件，任务被视为`blocked`：

- 它有一个或多个`dependsOn`值，
- 其`dependsOn`列表包括保险库中任何任务的id，
- 两个任务的状态类型都是`TODO`或`IN_PROGRESS`。

例如：

```text
- [ ] I am not blocked 🆔 12345
- [ ] I am blocked ⛔ 12345
```

还要注意：

- 只考虑直接依赖。
- 状态类型为`DONE`、`CANCELLED`或`NON_TASK`的任务永远不会被视为`blocked`。

有关更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - `is blocked`和`is not blocked`在Tasks 6.1.0中引入。

### Id

`id`字段为任务添加标识符，以便其他任务可以标记为`dependsOn`该任务。

- `has id`
- `no id`
- `id (includes|does not include) <string>`
  - 匹配不区分大小写（忽略大小写）。
- `id (regex matches|regex does not match) /<JavaScript-style Regex>/`
  - 进行正则表达式匹配（默认区分大小写）。
  - 必读：[[Regular Expressions|正则表达式搜索]]。

有关更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - 任务Id在Tasks 6.1.0中引入。

自Tasks 6.1.0起，现在可以使用`task.id`进行**[[Custom Filters|自定义过滤]]**。

### 依赖于

`dependsOn`字段允许任务标记为依赖于一个或多个其他任务的`id`。多个`id`值用逗号（`,`）分隔，不带空格。

- `has depends on`
- `no depends on`

有关更多信息，请参阅[[Task Dependencies|任务依赖]]。

> [!released]
>
> - 任务依赖于在Tasks 6.1.0中引入。

自Tasks 6.1.0起，现在可以使用`task.dependsOn`进行**[[Custom Filters|自定义过滤]]**。

