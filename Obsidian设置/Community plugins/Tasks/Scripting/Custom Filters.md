---
publish: true
---

# 自定义过滤器

<span class="related-pages">#feature/scripting #feature/filters</span>

> [!released]
> 自定义过滤器在Tasks 4.2.0中引入。

## 总结

- 使用JavaScript表达式定义您自己的自定义任务过滤器，例如：
  - `filter by function task.description.replace('#task ', '').length < 3`
- 表达式必须求值为`boolean`，即`true`或`false`。
- 在[[Filters|过滤器]]中有大量示例。
  - 在该文件中搜索`filter by function`。
- 在[[Task Properties|任务属性]]和[[Quick Reference|快速参考]]中查找所有**支持的任务属性**。
  - 许多属性仅适用于自定义过滤器和分组，而不适用于内置分组指令。
- 在[[Query Properties|查询属性]]中查找所有**支持的查询属性**。
- 在[[Expressions|表达式]]中了解一些表达式的工作原理。

## 自定义过滤器简介

Tasks插件提供了许多内置方式来在Tasks查询结果中[[Filters|过滤]]任务。

但有时内置功能并不能完全满足您的需求。

**自定义过滤**允许您**发明自己的搜索方案**来分组任务。

您使用指令`filter by function`，然后添加一个用JavaScript编写的规则来确定每个任务是否应该包含在搜索结果中。请参阅下面的示例。

## 工作原理

### 可用的任务属性

参考章节[[Task Properties|任务属性]]显示了所有可用于自定义过滤器的任务属性。

可用的任务属性也在[[Quick Reference|快速参考]]表中显示。

### 可用的查询属性

参考章节[[Query Properties|查询属性]]显示了所有可用于自定义过滤器的查询属性。

> [!released]
>
> - 查询属性和占位符在Tasks 4.7.0中引入，可通过占位符访问。
> - 在Tasks 5.1.0中引入了对查询属性的直接访问。

### 表达式

指令看起来像这样：

- `filter by function <expression>`

表达式在来自您库中的每个任务上逐个求值（计算）。

表达式必须求值为`boolean`，即`true`或`false`。

如果表达式结果对于某个任务是`true`，则意味着该任务匹配您的自定义过滤器。

当然，如果表达式结果是`false`，则该任务不匹配您的自定义过滤器。

## 自定义过滤器示例

下面是一些示例，让您了解自定义过滤器可以做什么。

您可以通过在[[Filters|过滤器]]页面中搜索`filter by function`来找到更多示例。

### 文本属性示例

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.description_docs.approved.md -->

```javascript
filter by function task.description.length > 100
```

- 查找具有长描述的任务。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 日期属性示例

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.dates_task.due_docs.approved.md -->

```javascript
filter by function task.due.format('dddd') === 'Tuesday'
```

- 查找在星期二到期的任务，即任何星期二。
- 在非英语系统上，您可能需要用本地语言提供星期几。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

对于熟悉JavaScript的用户，这些更复杂的示例可能也很有趣：

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.dates_task.due.advanced_docs.approved.md -->

```javascript
filter by function \
    const date = task.due.moment; \
    return date ? !date.isValid() : false;
```

- 类似于`due date is invalid`。
- 它匹配具有到期日期且到期日期无效的任务，例如`2022-13-32`

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

- 今天或之后到期。

```javascript
filter by function task.due.moment?.isSame(moment('2023-05-31'), 'day') || false
```

- 查找在2023年5月31日到期的所有任务。

```javascript
filter by function task.due.moment?.isSame(moment('2023-05-31'), 'week') || false
```

- 查找在2023年5月31日那一周到期的所有任务。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 数字属性示例

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.other_properties_task.urgency_docs.approved.md -->

```javascript
filter by function task.urgency > 8.9999
```

- 查找紧急度评分高于`9.0`的任务。
- 注意使用的限制值是`8.9999`。
- 比较两个紧急度值的"小于"或"大于"搜索（使用`>`、`>=`、`<`或`<=`中的一个）**必须略微调整其值以允许舍入**。

```javascript
filter by function task.urgency > 7.9999 && task.urgency < 11.0001
```

- 查找紧急度评分在`8.0`和`11.0`之间（包含）的任务。

```javascript
filter by function task.urgency.toFixed(2) === 1.95.toFixed(2)
```

- 查找具有[[Urgency#Why do all my tasks have urgency score 1.95?|默认紧急度]]`1.95`的任务。
- 这是对任何数值进行相等或不等搜索的正确方法。
- `===`两边的`.toFixed(2)`确保比较的两个数字都四舍五入到相同的小数位数（2位）。
- 这很重要，以防止在比较非整数时被`10.29`不完全相同而绊倒。

```javascript
filter by function task.urgency.toFixed(2) !== 1.95.toFixed(2)
```

- 查找紧急度不是默认评分`1.95`的任务。

```javascript
filter by function task.urgency === 10.29
```

- **这不会找到任何任务**。
- ==不要在搜索任何数字的相等或不等时使用原始数字==，无论是看似整数还是浮点数。
- 通过使用`group by urgency`并查看标题，我们可能会得出具有以下值的任务的紧急度为`10.19`：
  - 明天到期，
  - 没有优先级符号。
- 由此，假设我们可以搜索`task.urgency === 10.29`可能是自然的。
- 但是，我们的函数正在检查以下值的相等性：
  - `task.urgency`大约是：
    - `10.292857142857140928526860079728`
  - `10.29`大约是：
    - `10.289999999999999147348717087880`
- 这些值**不完全相等**，因此测试无法找到任何匹配的任务。

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 文件属性示例

<!-- placeholder to force blank line before included text --><!-- include: CustomFilteringExamples.test.file_properties_task.file.folder_docs.approved.md -->

```javascript
filter by function task.file.folder === "Work/Projects/"
```

- 查找**仅**在给定文件夹中任何文件中的任务，而不是任何子文件夹。
- 相等测试`===`要求包含尾随斜杠（`/`）。

```javascript
filter by function task.file.folder.includes("Work/Projects/")
```

- 查找特定文件夹**和任何子文件夹**中的文件中的任务。

```javascript
filter by function task.file.folder.includes( query.file.folder )
```

- 查找包含查询的文件夹**和任何子文件夹**中的文件中的任务。

```javascript
filter by function task.file.folder === query.file.folder
```

- 查找仅包含查询的文件夹中的文件中的任务（**不是任何子文件夹中的任务**）。

```javascript
filter by function task.file.folder.includes("Work/Projects")
```

- 通过省略尾随斜杠（`/`），这也会找到文件夹内任何文件中的任务，例如：
  - `Work/Projects 2023/`
  - `Work/Projects Top Secret/`

<!-- placeholder to force blank line after included text --><!-- endInclude -->
