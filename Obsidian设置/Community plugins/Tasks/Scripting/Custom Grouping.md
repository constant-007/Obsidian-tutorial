---
publish: true
---

# 自定义分组

<span class="related-pages">#feature/scripting #feature/grouping</span>

> [!released]
> 自定义分组在Tasks 4.0.0中引入。

## 总结

- 使用JavaScript表达式定义您自己的自定义任务分组，例如：
  - `group by function task.urgency.toFixed(3)`
  - 如果未指定精度（小数位数），请参阅下面的[[#数字属性示例]]了解浮点数的处理方式。
- 在[[Grouping|分组]]中有大量示例。
  - 在该文件中搜索`group by function`。
- 在[[Task Properties|任务属性]]和[[Quick Reference|快速参考]]中查找所有**支持的任务属性**。
  - 许多属性仅适用于自定义分组和过滤器，而不适用于内置分组指令。
- 在[[Query Properties|查询属性]]中查找所有**支持的查询属性**。
- 在[[Expressions|表达式]]中了解一些表达式的工作原理。

## 自定义分组简介

Tasks插件提供了许多内置方式来在Tasks查询结果中[[Grouping|分组]]相似的任务。

但有时内置功能并不能完全满足您的需求。

**自定义分组**允许您**发明自己的命名方案**来分组任务。

您使用指令`group by function`，然后添加一个用JavaScript编写的规则来计算任务的分组名称。请参阅下面的示例。

## 工作原理

### 可用的任务属性

参考章节[[Task Properties|任务属性]]显示了所有可用于自定义分组的任务属性。

可用的任务属性也在[[Quick Reference|快速参考]]表中显示。

### 可用的查询属性

参考章节[[Query Properties|查询属性]]显示了所有可用于自定义分组的查询属性。

> [!released]
>
> - 查询属性和占位符在Tasks 4.7.0中引入。
> - 在Tasks 5.1.0中引入了对查询属性的直接访问。

### 表达式

指令看起来像这样：

- `group by function <expression>`
- `group by function reverse <expression>`

表达式在匹配您查询的每个任务上求值（计算），表达式结果用作任务的分组标题。

| 期望的标题 | 您可以返回的值 |
| --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| 任务的单个分组名称 | 单个值，例如`'group name'`。<br>包含单个值的数组，例如`['group name']`。 |
| 可能多次显示任务（就像`group by tags`所做的那样） | 值数组，例如：<br>`['heading 1', 'heading 2']` |
| 无标题 | `null`<br>空字符串`''`<br>空数组`[]` |

`expression`可以：

- 使用每个任务的大量属性
- 使用任何有效的JavaScript语言功能

`expression`必须：

- 使用给定任务的属性，例如`task.description`、`task.status.name`
  - 请参阅参考页面[[Task Properties|任务属性]]了解所有可用属性
- 返回以下之一：
  - 要么是可以转换为字符串的任何类型的单个值
  - 要么是值数组（在这种情况下，任务将被多次显示，在数组生成的每个标题下各显示一次）

> [!warning]
> 返回的字符串按原样呈现。这意味着，例如，如果您返回的文本中有下划线（`_`）但不是为了表示斜体，您应该用反斜杠（'\_'）转义它们，如下所示：
>
> ```javascript
> group by function task.description.replaceAll('_', '\\_')
>```

## 自定义分组示例

下面是一些示例，让您了解自定义分组可以做什么。

您可以通过在[[Grouping|分组]]页面中搜索`group by function`来找到更多示例。

### 文本属性示例

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.description_docs.approved.md -->

```javascript
group by function task.description
```

- 按描述分组。
- 这可能对查找同一任务的已完成重复任务很有用。

```javascript
group by function task.description.toUpperCase()
```

- 将描述转换为大写。

```javascript
group by function task.description.slice(0, 25)
```

- 将描述截断为最多前25个字符，并按该字符串分组。

```javascript
group by function task.description.replace('short', '==short==')
```

- 在任何分组描述中突出显示单词"short"。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 日期属性示例

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.dates_task.due_docs.approved.md -->

```javascript
group by function task.due.category.groupText
```

- 将任务到期日期分为5个广泛类别：`Invalid date`、`Overdue`、`Today`、`Future`和`Undated`，按该顺序显示。
- 如果有很多到期日期标题，并且您希望将它们分解为某种结构，请在`group by due`之前的行中尝试此操作。
- 值`task.due.category.name`和`task.due.category.sortOrder`也可用。

```javascript
group by function task.due.fromNow.groupText
```

- 按[距离现在的时间](https://momentjs.com/docs/#/displaying/fromnow/)分组，例如`8 days ago`、`in 11 hours`。
- 如果没有到期日期，它使用空字符串（因此没有标题）。
- 值`task.due.fromNow.name`和`task.due.fromNow.sortOrder`也可用。

```javascript
group by function task.due.format("YYYY-MM-DD dddd")
```

- 类似于"group by due"，除了如果没有到期日期，它使用无标题，而不是标题"No due date"。

```javascript
group by function task.due.formatAsDate()
```

- 将日期格式化为YYYY-MM-DD，或者如果没有到期日期则为空字符串（因此没有标题）。

```javascript
group by function task.due.formatAsDateAndTime()
```

- 将日期格式化为YYYY-MM-DD HH:mm，或者如果没有到期日期则为空字符串。
- 注意：
  - 这是为了演示目的而显示的。
  - 目前Tasks插件不支持存储时间。
  - 不要向您的任务添加时间，因为这会破坏任务数据的读取。

```javascript
group by function task.due.format("YYYY[%%]-MM[%%] MMM", "no due date")
```

- 按月分组，例如`2023%%-05%% May`...
  - ...这被Obsidian呈现为`2023 May`。
- 或者如果没有日期，显示默认标题"no due date"。
- 添加隐藏的月份数字，在两个`%%`字符串之间注释掉，以控制标题的排序顺序。
- 要在格式字符串中转义字符，可以将字符包装在方括号中（这里是`[%%]`）。

```javascript
group by function task.due.format("YYYY[%%]-MM[%%] MMM [- Week] WW")
```

- 按月份和周数分组，例如`2023%%-05%% May - Week 22`...
  - ...这被Obsidian呈现为`2023 May - Week 22`。
- 如果没有嵌入月份数字，在某些年份中，年份的第一周或最后一周会以非逻辑顺序显示。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

在[[Grouping#Due Date|分组#到期日期]]中有更多日期示例。

### 数字属性示例

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.other_properties_task.urgency_docs.approved.md -->

```javascript
group by function task.urgency.toFixed(3)
```

- 将紧急度显示为3位小数，不像内置的"group by urgency"使用2位小数。

```javascript
group by function task.urgency
```

- 将非整数紧急度值显示为5位小数，整数值显示为0位小数。
- 发现按名称对分组进行排序时，不同小数位数的可靠性较差。
- 因此，为了确保一致的排序，Tasks将非整数四舍五入为固定的5位小数，将值作为字符串返回。
- 即使分组的某些值是整数，这仍然能一致地排序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 文件属性示例

<!-- placeholder to force blank line before included text --><!-- include: CustomGroupingExamples.test.file_properties_task.file.folder_docs.approved.md -->

```javascript
group by function task.file.folder
```

- 类似于'group by folder'，除了它不转义文件夹中的任何Markdown格式字符。

```javascript
group by function task.file.folder.slice(0, -1).split('/').pop() + '/'
```

- 按包含任务的文件的直接父文件夹分组。
- 工作原理如下：
  - '.slice(0, -1)'从原始文件夹中删除尾随斜杠（'/'）。
  - '.split('/')'将剩余路径分割为文件夹名称数组。
  - '.pop()'返回最后一个文件夹名称，即包含任务的文件的父级。
  - 然后添加回尾随斜杠，以确保对于库顶层的文件我们不会得到空字符串。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

## 分组排序

### 默认排序顺序：字母顺序

分组名称按字母顺序排序。

例如，以下指令按优先级名称对分组进行排序，从`High priority`到`Normal priority`：

```javascript
group by function task.priorityName +' priority'
```

### 控制分组的排序顺序

可以通过在分组名称中包含一些隐藏文本（在`%%....%%`注释内）来强制执行排序顺序。

或者，我们可以使用隐藏的`task.priorityNumber`值来强制排序顺序，现在将从`High priority`运行到`Lowest priority`：

```javascript
group by function '%%' + task.priorityNumber.toString() + '%%' + task.priorityName +' priority'
```

## 格式化分组

这是向分组添加格式的示例。

（确保您将长`group by function task.due.format`行作为单行粘贴，而不是意外分割行。）

<!-- the following example can be tested and screen-shotted with:
'/Users/clare/Documents/develop/Obsidian/schemar/obsidian-tasks/resources/sample_vaults/Tasks-Demo/How To/Use formatting in custom group headings.md'
-->

```javascript
group by function task.due.format("YYYY %%MM%% MMMM [<mark style='background: var(--color-base-00); color: var(--color-base-40)'>- Week</mark>] WW", "Undated")
group by function task.due.format("[%%]YYYY-MM-DD[%%]dddd [<mark style='background: var(--color-base-00); color: var(--color-base-40);'>](YYYY-MM-DD)[</mark>]")
```

注意：

- 格式化将封闭的文本以静音颜色绘制。
- 方括号（`[...]`）中的文本逐字包含在输出中。
- 命名颜色如`var(--color-base-00)`由当前Obsidian主题定义，以及显示模式是明亮还是暗色。
  - 请参阅[Obsidian文档颜色页面](https://docs.obsidian.md/Reference/CSS+variables/Foundations/Colors)了解可用颜色。

它可能看起来像这样：

![Tasks Grouped](../images/tasks_custom_groups_with_formatting.png)
带有自定义日期分组的任务，包括格式。

## 技巧

- 要创建复杂的自定义分组，从简单的开始，然后逐渐构建。
- 在实验时使用[[Limiting#Limit number of tasks in each group|限制每个分组中的任务数量]]功能 - `limit groups 1` - 以加快反馈速度。
- 您可以尝试硬编码表达式，以探索自定义分组的工作方式：
  - `group by function null`
  - `group by function ''`
  - `group by function []`
  - `group by function "hello world"`
  - `group by function ["hello world"]`
  - `group by function ["hello", "world"]`
  - `group by function 6 * 7`
  - `group by function undefined`
- 请参阅[[Expressions|表达式]]了解更多要尝试的示例。
- 您可以使用：
  - 任务，您可以通过所有[[Task Properties|任务属性]]访问其数据。
  - 有关包含查询的文件的一些信息，您可以通过所有[[Query Properties|查询属性]]访问。
- 生成的文本由Obsidian呈现，因此您可以插入markdown字符以向标题添加格式。

## 故障排除

> [!Warning]
> 目前，函数表达式中的大多数类型的错误仅在搜索运行时检测到。
>
> 这意味着在查看结果时，错误消息显示在分组标题中。
>
> 在将来的版本中，我们计划在读取查询块时显示公式中的错误。

### 语法错误

以下示例给出错误：

````text
```tasks
group by function hello
```
````

给出这个标题名称：

```text
##### Error: Failed calculating expression "hello". The error message was: hello is not defined
```

> [!todo]
> 在解析指令时进行语法错误检查
