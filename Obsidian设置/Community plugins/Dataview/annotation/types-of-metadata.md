# 字段类型

dataview中的所有字段都有一个**类型**，这决定了dataview如何渲染、排序和操作该字段。
在["添加元数据"](add-metadata.md)中了解更多关于如何创建字段的信息，在[页面上的元数据](./metadata-pages.md)和[任务和列表上的元数据](./metadata-tasks.md)中了解您自动可用的信息。

## 为什么类型很重要？

Dataview提供了[函数](../reference/functions.md)，您可以使用它们来修改您的元数据，并允许您编写各种复杂的查询。特定函数需要特定的数据类型才能正确工作。这意味着您字段的数据类型决定了您可以在这些字段上使用哪些函数以及函数的行为方式。此外，根据类型，dataview呈现的输出可能会有所不同。

大多数时候您不需要过多担心字段的类型，但如果您想对数据执行计算和其他神奇操作，您应该了解它们。

> [!example] 基于类型的不同渲染
> 如果您有这个文件：
> ~~~yaml
> date1:: 2021-02-26T15:15
> date2:: 2021-04-17 18:00
> 
> ```dataview
> TABLE date1, date2
> WHERE file = this.file
> ```
> ~~~
> 
> 您将看到以下输出（取决于您的dataview日期+时间格式设置）：
> 
> | File (1) | date1 | date2 |
> | -------- | ----- | ----- |
> | Untitled 2 | 3:15 PM - February 26, 2021 | 2021-04-17 18:00 |
> 
> `date1`被识别为**日期**，而`date2`对dataview来说是普通的**文本**，这就是为什么`date1`为您解析得不同。在[下面的日期](#date)中了解更多。

## 可用的字段类型

Dataview知道几种字段类型来涵盖常见用例。

### 文本

默认的万能类型。如果字段不匹配更具体的类型，它就是纯文本。

```markdown
Example:: This is some normal text.
```

> [!hint] 多行文本
> 多行文本作为值只能通过YAML前端数据和管道操作符实现：
> ```yaml
> ---
> poem: |
>   Because I could not stop for Death,
>   He kindly stopped for me;
>   The carriage held but just ourselves
>   And Immortality.
> author: "[[Emily Dickinson]]"
> title: "Because I could not stop for Death"
> ---
> ```
> 对于内联字段，换行意味着值的结束。

### 数字

像'6'和'3.6'这样的数字。
```markdown
Example:: 6
Example:: 2.4
Example:: -80
```

在YAML前端数据中，您写数字时不需要引号：

```yaml
---
rating: 8
description: "A nice little horror movie"
---
```

### 布尔值

布尔值只知道两个值：true或false，作为编程概念。

```markdown
Example:: true
Example:: false
```

### 日期

匹配ISO8601记号的文本将自动转换为日期对象。[ISO8601](https://en.wikipedia.org/wiki/ISO_8601)遵循格式`YYYY-MM[-DDTHH:mm:ss.nnn+ZZ]`。月份后的所有内容都是可选的。
    
```markdown
Example:: 2021-04 
Example:: 2021-04-18
Example:: 2021-04-18T04:19:35.000
Example:: 2021-04-18T04:19:35.000+06:30
```

当查询这些日期时，您可以访问为您返回日期特定部分的属性：

- field.year
- field.month
- field.weekyear
- field.week
- field.weekday
- field.day
- field.hour
- field.minute
- field.second
- field.millisecond

例如，如果您想知道您的日期在哪个月，您可以通过`datefield.month`访问它：

~~~markdown
birthday:: 2001-06-11

```dataview
LIST birthday
WHERE birthday.month = date(now).month
```
~~~

为您返回本月发生的所有生日。对`date(now)`感到好奇？在[字面量](../reference/literals.md#dates)下阅读更多。

> [!info] 日期对象的显示
> Dataview以人类可读的格式呈现日期对象，即`3:15 PM - February 26, 2021`。您可以在Dataview的设置中的"常规"下用"日期格式"和"日期+时间格式"调整这种格式的外观。如果您只想在特定查询中调整格式，请使用[dateformat函数](../reference/functions.md#dateformatdatedatetime-string)。

### 持续时间

持续时间是`<时间> <单位>`形式的文本，如`6 hours`或`4 minutes`。接受常见的英语缩写如`6hrs`或`2m`。您可以在一个字段中指定多个单位，即`6hr 4min`，可选择用逗号分隔符：`6 hours, 4 minutes`

```markdown
Example:: 7 hours
Example:: 16days
Example:: 4min
Example:: 6hr7min
Example:: 9 years, 8 months, 4 days, 16 hours, 2 minutes
Example:: 9 yrs 8 min
```

在[字面量](../reference/literals.md#durations)上找到被识别为持续时间的值的完整列表。

> [!hint] 日期和持续时间的计算
> 日期和持续时间类型彼此兼容。这意味着您可以，例如，将持续时间添加到日期以产生新日期：
> ~~~markdown
> departure:: 2022-10-07T15:15
> length of travel:: 1 day, 3 hours
> 
> **Arrival**: `= this.departure + this.length-of-travel`
> ~~~
> 
> 并且当用日期计算时您会得到持续时间：
> ~~~markdown
> release-date:: 2023-02-14T12:00
>   
> `= this.release-date - date(now)` until release!!
> ~~~
> 
> 对`date(now)`感到好奇？在[字面量](../reference/literals.md#dates)下阅读更多。

### 链接

Obsidian链接如`[[Page]]`或`[[Page|Page Display]]`。

```markdown
Example:: [[A Page]]
Example:: [[Some Other Page|Render Text]]
```

> [!info] YAML前端数据中的链接
> 如果您在前端数据中引用链接，您需要引用它，如下：`key: "[[Link]]"`。这是默认的Obsidian支持的行为。未引用的链接导致无效的YAML前端数据，无法再解析。
> ```yaml
> ---
> parent: "[[parentPage]]"
> ---
> ```
> 请注意，这对dataview来说只是一个链接，但对Obsidian来说不再是——这意味着它不会显示在传出链接中，不会在图形视图中显示，并且不会在重命名时更新。

### 列表

列表是多值字段。在YAML中，这些被定义为普通的YAML列表：
```yaml
---
key3: [one, two, three]
key4:
 - four
 - five
 - six
---
```

在内联字段中，它们是逗号分隔的列表值：

```markdown
Example1:: 1, 2, 3
Example2:: "yes", "or", "no"
```

请注意，在内联字段中，您需要将**文本值包装在引号中**才能被识别为列表（见`Example2`）。`yes, or, no`被识别为纯文本。

> [!info] 同一文件中重复的元数据键导致列表
> 如果您在同一笔记中使用元数据键两次或更多次，dataview将收集所有值并给您一个列表。例如
> ~~~markdown
> grocery:: flour
> [...]
> grocery:: soap
> 
> ```dataview
> LIST grocery
> WHERE file = this.file
> ```
> ~~~
> 将给您返回`flour`和`soap`的**列表**。

> [!hint] 数组就是列表
> 在本文档的某些地方，您会读到术语"数组"。数组是Javascript中列表的术语——列表和数组是相同的。需要数组作为参数的函数需要列表作为参数。

### 对象

对象是一个父字段下多个字段的映射。这些只能在YAML前端数据中定义，使用YAML对象语法：
```yaml
---
obj:
  key1: "Val"
  key2: 3
  key3: 
    - "List1"
    - "List2"
    - "List3"
---
```

在查询中，您然后可以通过`obj.key1`等访问这些子值：

~~~markdown
```dataview
TABLE obj.key1, obj.key2, obj.key3
WHERE file = this.file
```
~~~
