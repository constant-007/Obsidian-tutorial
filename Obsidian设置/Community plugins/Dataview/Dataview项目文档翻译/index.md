
> [!important]+ "Dataview项目文档翻译“目录内容说明
> "Dataview项目文档翻译“目录下的内容都是官方Dataview插件文档的翻译，最新内容请认准：https://blacksmithgu.github.io/obsidian-dataview/
> 
> 如果发现需要更新可以在项目issue中提出

# 概览

Dataview是一个基于您个人知识库的实时索引和查询引擎。您可以向笔记中[**添加元数据**](annotation/add-metadata.md)，并使用[**Dataview查询语言**](queries/structure.md)来列出、过滤、排序或分组您的数据。Dataview保持您的查询始终最新，使数据聚合变得轻而易举。

您可以：

- 通过在日常笔记中记录睡眠情况来跟踪您的睡眠，并自动创建您睡眠计划的周表。
- 自动收集笔记中指向书籍的链接，并按评分排序呈现它们。
- 自动收集与今天日期相关的页面，并在您的日常笔记中显示它们。
- 查找没有标签的页面以进行后续处理，或显示特定标签页面的精美视图。
- 创建动态视图，显示笔记中记录的即将到来的生日或事件

以及更多功能。

> [!hint] 
> Dataview为您提供了一种在库中搜索、显示和操作索引数据的快速方法！

Dataview具有高度通用性和高性能，可扩展到数十万个注释笔记而不会出现问题。

如果内置的[查询语言](queries/structure.md)无法满足您的需求，您可以针对[dataview API](api/intro.md)运行任意JavaScript，并直接在您的笔记中构建任何您可能需要的实用程序。

> [!info] Dataview用于显示，而非编辑
> Dataview用于显示和计算数据。它不用于编辑您的笔记/元数据，并且总是保持它们不被触碰（...除非您通过Dataview勾选一个[任务](queries/query-types.md#task)。）

## 如何使用Dataview

Dataview由两个主要组成部分构成：**数据索引**和**数据查询**。

> [!info] 链接文档页面的更多详细信息
> 以下章节应该为您提供关于可以使用dataview做什么以及如何操作的总体概述。请务必访问链接的页面以了解各个部分的更多信息。

### 数据索引

Dataview基于您的Markdown文件中的元数据运行。它无法读取您库中的所有内容，只能读取特定数据。您的一些内容，如标签和项目符号（包括任务），在Dataview中[自动可用](annotation/add-metadata.md#implicit-fields)。您可以通过**字段**添加其他数据，要么在文件顶部[通过YAML前端数据](annotation/add-metadata.md#frontmatter)，要么在内容中间使用[内联字段](annotation/add-metadata.md#inline-fields)通过`[key:: value]`语法。Dataview*索引*这些数据以使其可供您查询。

> [!hint] 
> Dataview索引[某些信息](annotation/add-metadata.md#implicit-fields)如标签和列表项以及您通过字段添加的数据。只有索引数据在Dataview查询中可用！

例如，一个文件可能看起来像这样：

```markdown
---
author: "Edgar Allan Poe"
published: 1845
tags: poems
---

# The Raven

Once upon a midnight dreary, while I pondered, weak and weary,
Over many a quaint and curious volume of forgotten lore—
```

或者像这样：

```markdown
#poems

# The Raven

From [author:: Edgar Allan Poe], written in (published:: 1845)

Once upon a midnight dreary, while I pondered, weak and weary,
Over many a quaint and curious volume of forgotten lore—
```

就索引元数据（或您可以查询的内容）而言，它们是相同的，仅在注释样式上有所不同。如何[注释您的元数据](annotation/add-metadata.md)取决于您和您的个人偏好。有了这个文件，您将有**元数据字段**`author`可用，以及Dataview[自动作为隐式字段](annotation/metadata-pages.md)提供给您的一切，如标签或笔记标题。

> [!attention] 数据需要被索引
> 在上面的例子中，您在Dataview中*没有*诗歌本身可用：它是一个段落，不是元数据字段，也不是Dataview自动索引的内容。它不是Dataview索引的一部分，所以您将无法查询它。

### 数据查询

您可以通过**查询**的帮助访问**索引数据**。

有**三种不同的方式**可以编写查询：借助[Dataview查询语言](queries/dql-js-inline.md#dataview-query-language-dql)，作为[内联语句](queries/dql-js-inline.md#inline-dql)，或以最灵活但最复杂的方式：作为[Javascript查询](queries/dql-js-inline.md#dataview-js)。

**Dataview查询语言**（**DQL**）为您提供了一个广泛而强大的工具包来查询、显示和操作您的数据。一个[**内联查询**](queries/dql-js-inline.md#inline-dql)为您提供了在笔记中任何地方显示恰好一个索引值的可能性。您也可以用这种方式进行计算。有了**DQL**在手，在您的数据之旅中，您可能无需任何Javascript就能很好地完成工作。

一个DQL查询由几个部分组成：

- 恰好一个[**查询类型**](queries/query-types.md)，决定您的查询输出的样子
- 无或一个[**FROM语句**](queries/data-commands.md#from)来选择特定的标签或文件夹（或另一个[源](reference/sources.md)）来查看
- 无到多个[**其他数据命令**](queries/data-commands.md)，帮助您过滤、分组和排序您想要的输出

例如，一个查询可能看起来像这样：

~~~markdown
```dataview
LIST
```
~~~

它列出您库中的所有文件。

> [!info] 除了查询类型之外的一切都是可选的
> 您需要有效DQL查询的唯一事项是查询类型（在[CALENDAR](queries/query-types.md#calendar)上，还需要一个日期字段。）

一个更受限制的查询可能看起来像这样：

~~~markdown
```dataview
LIST
FROM #poems
WHERE author = "Edgar Allan Poe"
```
~~~

它列出您库中所有带有标签`#poems`并且有一个名为`author`、值为`Edgar Allan Poe`的[字段](annotation/add-metadata.md)的文件。这个查询会找到我们上面的示例页面。

`LIST`只是您可以使用的四种[查询类型](queries/query-types.md)中的一种。例如，使用`TABLE`，我们可以向输出添加更多信息：

~~~markdown
```dataview
TABLE author, published, file.inlinks AS "Mentions"
FROM #poems
```
~~~

这会给您返回这样的结果：

| File (3) |	author |	published	| Mentions |
| -------- | ------- | ---------- | -------- |
| The Bells |	Edgar Allan Poe |	1849 |  |	
| The New Colossus |	Emma Lazarus | 1883	| - [[Favorite Poems]] |	
| The Raven |	Edgar Allan Poe |	1845 | - [[Favorite Poems]] |	

不过，这并不是dataview功能的终点。您还可以借助[**函数**](reference/functions.md)对您的数据进行**操作**。请注意，这些操作只在您的查询内部进行——您**文件中的数据保持不变**。

~~~markdown
```dataview
TABLE author, date(now).year - published AS "Age in Yrs", length(file.inlinks) AS "Counts of Mentions"
FROM #poems
```
~~~

给您返回

| File (3) |	author |	Age in Yrs	| Count of Mentions |
| -------- | ------- | ---------- | -------- |
| The Bells	|  Edgar Allan Poe |	173 | 0 |
| The New Colossus	| Emma Lazarus |	139 |	1 |
| The Raven |	Edgar Allan Poe |	177 | 1 |	

> [!info] 
> 在[这里](resources/examples.md)找到更多示例。

如您所见，dataview不仅允许您快速且始终最新地聚合数据，它还可以帮助您进行操作，为您的数据集提供新的见解。浏览文档以了解更多如何与您的数据交互的信息。

祝您以新的方式探索库的乐趣！

## 资源和帮助

这份文档不是在您的数据之旅中唯一可以帮助您的地方。查看[资源和支持](./resources/resources-and-support.md)以获取有用页面和视频的列表。
