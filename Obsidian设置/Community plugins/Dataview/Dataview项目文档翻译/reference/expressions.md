# 表达式

Dataview查询语言**表达式**是任何产生值的东西：

- 所有[字段](../annotation/add-metadata.md)
- 所有[字面量](./literals.md) 
- 以及计算值，如`field - 9`或[函数调用](./functions.md)。 

基本上，除了[查询类型](../queries/query-types.md)和[数据命令](../queries/data-commands.md)之外的所有内容都是表达式。

对于一个非常高级的摘要，以下在DQL中被认为是**表达式**：

```
# 字面量
1                   (数字)
true/false          (布尔值)
"text"              (文本)
date(2021-04-18)    (日期)
dur(1 day)          (持续时间)
[[Link]]            (链接)
[1, 2, 3]           (列表)
{ a: 1, b: 2 }      (对象)

# Lambda表达式
(x1, x2) => ...     (lambda)

# 引用
field               (直接引用字段)
simple-field        (引用有空格/标点符号的字段，如"Simple Field!")
a.b                 (如果a是对象，检索名为'b'的字段)
a[expr]             (如果a是对象或数组，检索由表达式'expr'指定名称的字段)
f(a, b, ...)        (在参数a, b, ...上调用名为`f`的函数)

# 算术运算
a + b               (加法)
a - b               (减法)
a * b               (乘法)
a / b               (除法)
a % b               (取模/除法余数)

# 比较
a > b               (检查a是否大于b)
a < b               (检查a是否小于b)
a = b               (检查a是否等于b)
a != b              (检查a是否不等于b)
a <= b              (检查a是否小于或等于b)
a >= b              (检查a是否大于或等于b)

# 字符串

a + b               (字符串连接)
a * num             (重复字符串<num>次)

# 特殊操作
[[Link]].value      (从页面`Link`获取`value`)
```

以下是对每个的更详细解释。

## 表达式类型

### 字段作为表达式

最简单的表达式是直接引用字段的表达式。如果您有一个名为"duedate"的字段，那么您可以直接通过名称引用它 - `duedate`。 

~~~
```dataview
TABLE duedate, class, field-with-space
```
~~~

> [!info] 带空格和标点符号的字段名称
> 如果字段名称有空格、标点符号或其他非字母/数字字符，那么您可以使用Dataview的简化名称来引用它，简化名称全部为小写，空格用"-"替换。例如，`this is a field`变为`this-is-a-field`；`Hello!`变为`hello`，等等。在[字段名称](../annotation/add-metadata.md#field-names)下了解更多。

### 字面量

常量值 - 如`1`或`"hello"`或`date(som)`（"月初"）。dataview支持的每种数据类型都有字面量；在[这里](./literals.md)了解更多。

~~~
```dataview
LIST
WHERE file.name = "Scribble"
```
~~~

### 算术运算

您可以使用标准算术运算符组合字段：加法（`+`）、减法（`-`）、乘法（`*`）和除法（`/`）。例如`field1 + field2`是计算两个字段之和的表达式。

~~~
```dataview
TABLE start, end, (end - start) - dur(8 h) AS "Overtime" 
FROM #work
```

```dataview
TABLE hrs / 24 AS "days"
FROM "30 Projects"
```
~~~

### 比较

您可以使用各种比较运算符比较大多数值：`<`、`>`、`<=`、`>=`、`=`、`!=`。这会产生一个布尔真或假值，可以在查询的`WHERE`块中使用。

~~~
```dataview
LIST
FROM "Games"
WHERE price > 10
```

```dataview
TASK
WHERE due <= date(today)
```

```dataview
LIST
FROM #homework
WHERE status != "done"
```
~~~

> [!hint] 比较不同类型
> 将不同的[数据类型](../annotation/types-of-metadata.md)相互比较可能导致意外结果。以第二个例子为例：如果`due`未设置（在页面或任务级别都没有），它是`null`，而`null <= date(today)`返回true，包括没有任何截止日期的任务。如果不希望这样，请添加类型检查以确保您总是比较相同的类型：
> ~~~
> ```dataview
> TASK
> WHERE typeof(due) = "date" AND due <= date(today)
> ```
> ~~~
> 大多数情况下，通过`WHERE due AND due <= date(today)`检查元数据是否可用就足够了，但检查类型是获得可预见结果的更安全方法。

### 列表/对象索引

您可以通过索引运算符`list[<index>]`从[列表/数组](../annotation/types-of-metadata.md#list)检索数据，其中`<index>`是任何计算表达式。
列表是从0开始索引的，所以第一个元素是索引0，第二个元素是索引1，依此类推。
例如`list("A", "B", "C")[0] = "A"`。

类似的符号样式适用于[对象](../annotation/types-of-metadata.md#object)。
您可以使用`field["nestedfield"]`来引用对象内部或其他类似嵌套的字段。
例如，在下面定义的YAML中，我们可以通过`episode_metadata["previous"]`引用`previous`。
```yaml
---
aliases:
  - "ABC"
current_episode: "S01E03"
episode_metadata:
  previous: "S01E02"
  next: "S01E04"
---
```

您还可以从对象（将文本映射到数据值）使用索引运算符检索数据，其中索引现在是字符串/文本而不是数字。
您还可以使用简写`object.<name>`，其中`<name>`是要检索的值的名称。
对于前面的前端数据示例，我们也可以使用`episode_metadata.previous`来获得相同的值。

索引表达式也适用于具有查询语言不直接支持的字段的对象。
一个很好的例子是`where`，因为它是一个关键字。
如果您的前端数据/元数据包含字段`where`，您可以通过`row`语法引用它：`row["where"]`。
有关更多信息，请参见[FAQ中的注释](../resources/faq.md#how-do-i-use-fields-with-the-same-name-as-keywords-like-from-where)和[相应的问题](https://github.com/blacksmithgu/obsidian-dataview/issues/1164)。

~~~
```dataview
TABLE id, episode_metadata.next, aliases[0]
```
~~~

### 函数调用

Dataview支持各种操作数据的函数，这些函数在[函数文档](functions.md)中有完整描述。它们具有一般语法`function(arg1, arg2, ...)` - 即`lower(file.name)`或`regexmatch("A.+", file.folder)`。

~~~
```dataview
LIST
WHERE contains(file.name, "WIP")
```

```dataview
LIST
WHERE string(file.day.year) = split(this.file.name, "-W")[0]
```
~~~

### Lambda表达式

Lambda是高级字面量，让您定义一个接受一些输入并产生输出的函数。
它们具有一般形式：

```
(arg1, arg2, arg3, ...) => <使用args的表达式>
```

Lambda在几个高级运算符（如`reduce`和`map`）中使用，以允许对数据进行复杂转换。几个例子：

```
(x) => x.field                  (返回x的字段，通常用于map)
(x, y) => x + y                 (x和y的和)
(x) => 2 * x                    (x的两倍)
(value) => length(value) = 4    (如果value长度为4则返回true)
```

~~~
```dataview
CALENDAR file.day
FLATTEN all(map(file.tasks, (x) => x.completed)) AS "allCompleted"
WHERE !allCompleted
```
~~~

---

## 类型特定的交互和值

大多数dataview类型与运算符有特殊交互，或者有可以使用索引运算符检索的其他字段。这对于[日期](../annotation/types-of-metadata.md#date)和[持续时间](../annotation/types-of-metadata.md#duration)以及链接都是如此。在[元数据类型](../annotation/types-of-metadata.md)的相应部分中了解更多关于日期和持续时间的信息。

### 链接

您可以通过链接"索引"来获取相应页面上的值。例如`[[Assignment Math]].duedate`将从页面`Assignment Math`获取值`duedate`。

> [!note] 表达式中的链接索引
> 如果您的链接是在内联字段或前端数据中定义的字段，如`Class:: [[Math]]`，并且您想获取字段`timetable`，那么您通过写`Class.timetable`来索引它。
> 使用`[[Class]].timetable`将查找字面上称为`Class`的页面，而不是`Math`！