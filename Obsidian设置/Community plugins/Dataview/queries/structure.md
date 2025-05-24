# 查询的结构

Dataview提供[多种方式](dql-js-inline.md)来编写查询，每种方式的语法都不同。

本页面提供关于如何编写**Dataview查询语言**（**DQL**）查询的信息。如果您对如何编写内联查询感兴趣，请参阅[DQL、JS和内联的内联部分](dql-js-inline.md#inline-dql)。您可以在[Javascript参考](../api/intro.md)中找到有关**Javascript查询**的更多信息。

**DQL**是一种类似SQL的查询语言，用于创建数据的不同视图或计算。它支持：

- 选择输出的**输出格式**（[查询类型](./query-types.md)）
- 从**某个[源](../reference/sources.md)**获取页面，例如标签、文件夹或链接
- 通过字段上的简单操作**过滤页面/数据**，如比较、存在性检查等
- **转换字段**以供显示，例如通过计算或拆分多值字段
- 基于字段**排序**结果
- 基于字段**分组**结果
- **限制**您的结果数量

> [!warning] 与SQL的差异
> 如果您熟悉SQL，请阅读[与SQL的差异](differences-to-sql.md)以避免将DQL与SQL混淆。

让我们看看如何使用DQL。

## DQL查询的一般格式

每个查询都遵循相同的结构，包含：

- 恰好一个**查询类型**，带有零个、一个或多个[字段](../annotation/add-metadata.md)，具体取决于查询类型
- 零个或一个**FROM**数据命令，带有一个到多个[源](../reference/sources.md)
- 零到多个其他**数据命令**，带有一个到多个[表达式](../reference/expressions.md)和/或其他信息，具体取决于数据命令

在高层次上，查询符合以下模式：

~~~
```dataview
<查询类型> <字段>
FROM <源>
<数据命令> <表达式>
<数据命令> <表达式>
          ...
```
~~~

> [!hint] 只有查询类型是强制性的
> 只有查询类型是必需的。其他所有内容都是可选的。

以下部分将更详细地解释理论。

## 选择输出格式

查询的输出格式由其**查询类型**决定。有四种可用类型：

1. **TABLE**：结果表格，每个结果一行，一个或多个字段数据列。
2. **LIST**：匹配查询的页面的项目符号列表。您可以为每个页面输出一个字段，并显示其文件链接。
3. **TASK**：匹配给定查询的任务的交互式任务列表。
4. **CALENDAR**：日历视图，通过其引用日期上的点显示每个命中。

查询类型是**查询中唯一必需的命令**。其他一切都是可选的。

> [!attention] 可能内存密集的示例
> 根据您库的大小，执行以下示例可能需要很长时间，在极端情况下甚至会冻结Obsidian。建议您指定`FROM`来将查询执行限制为您库文件的特定子集。参见下一节。

~~~
将您库中的所有页面列为项目符号列表
```dataview
LIST
```

列出您库中的所有任务（已完成或未完成）
```dataview
TASK
```

呈现日历视图，其中每个页面都表示为其创建日期上的点。
```dataview
CALENDAR file.cday
```

显示一个表格，包含您库的所有页面、它们的due字段值、文件标签以及多值字段working-hours值的平均值
```dataview
TABLE due, file.tags AS "tags", average(working-hours)
```
~~~

> [!info] 
> 在[这里](./query-types.md)阅读有关可用查询类型及其使用方法的更多信息。

## 选择您的源

除了查询类型外，您还有几个**数据命令**可用，帮助您限制、细化、排序或分组您的查询。这些查询命令之一是**FROM**语句。`FROM`接受一个[源](../reference/sources.md)或[源](../reference/sources.md)的组合作为参数，并将查询限制为匹配您的源的一组页面。

它与其他数据命令的行为不同：您可以在查询中添加**零个或一个**`FROM`数据命令，紧跟在查询类型之后。您不能添加多个FROM语句，也不能在其他数据命令之后添加它。

~~~
列出Books文件夹及其子文件夹内的所有页面
```dataview
LIST
FROM "Books"
```

列出包含标签#status/open或#status/wip的所有页面
```dataview
LIST
FROM #status/open OR #status/wip
```

列出具有标签#assignment且在文件夹"30 School"（或其子文件夹）内的所有页面，或在文件夹"30 School/32 Homeworks"内且在页面School Dashboard Current To Dos上链接的页面
```dataview
LIST
FROM (#assignment AND "30 School") OR ("30 School/32 Homeworks" AND outgoing([[School Dashboard Current To Dos]]))
```

~~~

> [!info] 
> 在[这里](./data-commands.md#from)阅读有关`FROM`的更多信息。

## 过滤、排序、分组或限制结果

除了查询类型和上面解释的**数据命令**`FROM`之外，您还有几个其他**数据命令**可用，帮助您限制、细化、排序或分组您的查询结果。

除了`FROM`命令外，所有数据命令都可以**以任何顺序多次使用**（只要它们出现在查询类型和`FROM`之后，如果使用了`FROM`的话）。它们将按照编写的顺序执行。

可用的包括：

1. **FROM**如上所述[上面](#选择您的源)。
2. **WHERE**：基于笔记**内部**的信息、元数据字段过滤笔记。
3. **SORT**：根据字段和方向对结果进行排序。
4. **GROUP BY**：将多个结果捆绑到每组一个结果行中。
5. **LIMIT**：将查询的结果数量限制为给定数字。
6. **FLATTEN**：基于字段或计算将一个结果拆分为多个结果。

~~~

列出所有具有元数据字段`due`且`due`在今天之前的页面
```dataview
LIST
WHERE due AND due < date(today)
```

列出您库中最近创建的10个具有标签#status/open的页面
```dataview
LIST
FROM #status/open
SORT file.ctime DESC
LIMIT 10
```

将您库中最旧的10个未完成任务列为交互式任务列表，按其包含文件分组，并从最旧到最新文件排序。
```dataview
TASK
WHERE !completed
SORT created ASC
LIMIT 10
GROUP BY file.link
SORT rows.file.ctime ASC
```

~~~

> [!info] 
> 了解有关可用[数据命令](./data-commands.md)的更多信息。

## 示例

以下是一些示例查询。在[这里](../resources/examples.md)找到更多示例。

~~~
```dataview
TASK
```
~~~

~~~
```dataview
TABLE recipe-type AS "type", portions, length
FROM #recipes
```
~~~

~~~
```dataview
LIST
FROM #assignments
WHERE status = "open"
```
~~~

~~~
```dataview
TABLE file.ctime, appointment.type, appointment.time, follow-ups
FROM "30 Protocols/32 Management"
WHERE follow-ups
SORT appointment.time
```
~~~

~~~
```dataview
TABLE L.text AS "My lists"
FROM "dailys"
FLATTEN file.lists AS L
WHERE contains(L.author, "Surname")
```
~~~

~~~
```dataview
LIST rows.c
WHERE typeof(contacts) = "array" AND contains(contacts, [[Mr. L]])
SORT length(contacts)
FLATTEN contacts as c
SORT link(c).age ASC
```
~~~
