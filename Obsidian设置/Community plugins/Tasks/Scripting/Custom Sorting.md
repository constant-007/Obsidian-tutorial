---
publish: true
---

# 自定义排序

<span class="related-pages">#feature/scripting #feature/sorting</span>

> [!released]
> 自定义排序在Tasks 6.0.0中引入。

## 总结

- 使用JavaScript表达式定义您自己的自定义任务排序顺序，例如：
  - `sort by function task.description.length`
  - 我们称此表达式的结果为**排序键**。
  - 排序键表达式的**较低值**的任务排在排序键表达式的**较高值**的任务**之前**。
- 在[[Sorting|排序]]中有示例。
  - 在该文件中搜索`sort by function`。
- 在[[Task Properties|任务属性]]和[[Quick Reference|快速参考]]中查找所有**支持的任务属性**。
  - 许多属性仅适用于自定义排序，而不适用于内置排序指令。
- 在[[Query Properties|查询属性]]中查找所有**支持的查询属性**。
- 在[[Expressions|表达式]]中了解一些表达式的工作原理。

## 自定义排序简介

Tasks插件提供了许多内置方式来在Tasks查询结果中[[Sorting|排序]]相似的任务。

但有时内置功能并不能完全满足您的需求。

**自定义排序**允许您**发明自己的排序方案**来排序任务。

您使用指令`sort by function`，然后添加一个用JavaScript编写的规则来计算任务的排序键。请参阅下面的示例。

## 工作原理

### 可用的任务属性

参考章节[[Task Properties|任务属性]]显示了所有可用于自定义排序的任务属性。

可用的任务属性也在[[Quick Reference|快速参考]]表中显示。

### 可用的查询属性

参考章节[[Query Properties|查询属性]]显示了所有可用于自定义排序的查询属性。

### 表达式

指令看起来像这样：

- `sort by function <expression>`
- `sort by function reverse <expression>`

表达式在匹配您查询的每个任务上求值（计算），表达式结果用作任务的**排序键**。

此表显示支持的排序键值类型的行为。

| 排序键表达式类型 | 您可以返回的值 |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 字符串 | 示例：`sort by function task.originalMarkdown`<br>任务按字符串键值按字母顺序排序。排序区分大小写。它能识别数字并逻辑地排序它们。 |
| 数字 | 示例：`sort by function task.description.length`<br>数字按升序排序。数字越小，任务排序越靠前。 |
| 布尔值：`true`和`false` | 示例：`sort by function task.status.name.includes('!!')` <br>排序键为`true`的任务排在`false`之前。 |
| `TasksDate`和`Moment`对象 | 示例：`sort by function task.created`<br>请参阅[[Sorting#How dates are sorted\|日期如何排序]]。 |
| `null` | `null`排在有效的`TasksDate`和`Moment`对象之后，在所有其他排序键值之前。 |

`expression`可以：

- 使用每个任务的大量属性
- 使用任何有效的JavaScript语言功能

`expression`必须：

- 使用给定任务的属性，例如`task.description`、`task.status.name`。
  - 请参阅参考页面[[Task Properties|任务属性]]了解所有可用属性。
- 返回上表中列出的值类型之一。

## 自定义排序示例

下面是一些示例，让您了解自定义排序可以做什么。

您可以通过在[[Sorting|排序]]页面中搜索`sort by function`来找到更多示例。

### 文本属性示例

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.description_docs.approved.md -->

```javascript
sort by function task.description.length
```

- 按描述长度排序，最短的优先。
- 这可能对查找需要更多信息或可以不那么冗长的任务很有用。

```javascript
sort by function \
    const priorities = [...'🟥🟧🟨🟩🟦'];  \
    for (let i = 0; i < priorities.length; i++) {  \
        if (task.description.includes(priorities[i])) return i;  \
    }  \
    return 999;
```

- 用户为其任务描述定义了自定义系统，用彩色方块作为自制的替代优先级系统。
- 这允许任务按其彩色方块的顺序排序。
- 如果在任务描述中找到第一个方块，函数返回0，如果找到第二个方块，返回1，依此类推。
- 如果没有找到任何方块，它返回`999`。
- 重要的是，我们对所有不包含任何方块的任务使用一致的值，以保持其原始顺序，这样任何后续的`sort by`指令仍然有效。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 日期属性示例

有用的章节：

- [[Task Properties#Values in TasksDate Properties|TasksDate属性中的值]]
- [[Sorting#How dates are sorted|日期如何排序]]

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.dates_task.due_docs.approved.md -->

```javascript
sort by function task.due.format("dddd")
```

- 按到期日期的星期几按字母顺序排序。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 数字属性示例

<!-- placeholder to force blank line before included text --><!-- include: CustomSortingExamples.test.other_properties_task.urgency_docs.approved.md -->

```javascript
sort by function reverse task.urgency
```

- 按任务紧急度值排序。
- 我们使用`reverse`将最紧急的任务排在前面。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 文件属性示例

有用的章节：

- [[Task Properties#Values for File Properties|文件属性的值]]

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

## 故障排除

> [!Tip]
> 要测试从排序键获得的值，请将`sort by`替换为`group by`。生成的分组标题提供了一种"调试器"来显示表达式值。
>
> 但是，请注意，虽然`group by`表达式可以返回值数组，但`sort by`尚不支持数组。

## 自定义排序的限制

- 数组尚不能用作排序键，因为我们还没有找出排序不同长度数组的适当方法。

