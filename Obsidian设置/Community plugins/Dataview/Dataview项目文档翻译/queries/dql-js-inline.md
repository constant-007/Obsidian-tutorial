# DQL、JS和内联

一旦您向[相关页面添加了有用的数据](../annotation/add-metadata.md)，您就会想要在某个地方实际显示它或对其进行操作。Dataview允许以四种不同的方式执行此操作，所有这些方式都直接在您的Markdown中以代码块的形式编写，并在您的库发生更改时实时重新加载。

## Dataview查询语言（DQL）

[**Dataview查询语言**](structure.md)（简称**DQL**）是一种类似SQL的语言，是Dataview的核心功能。它支持[四种查询类型](./query-types.md)来产生不同的输出，[数据命令](./data-commands.md)来细化、重新排序或分组您的结果，以及[丰富的函数](../reference/functions.md)，允许进行众多操作和调整以实现您想要的输出。

> [!warning] 与SQL的差异
> 如果您熟悉SQL，请阅读[与SQL的差异](differences-to-sql.md)以避免将DQL与SQL混淆。

您可以使用以`dataview`为类型的代码块创建**DQL**查询：

~~~
```dataview
TABLE rating AS "Rating", summary AS "Summary" FROM #games
SORT rating DESC
```
~~~

> [!attention] 使用反引号
> 有效的代码块需要在开头和结尾使用反引号（`）（每端三个）。不要将反引号与看起来相似的撇号'混淆！

在[查询语言参考](structure.md)下找到如何编写DQL查询的解释。如果您更喜欢通过示例学习，请查看[查询示例](../resources/examples.md)。

## 内联DQL

内联DQL使用内联块格式而不是代码块，并使用可配置的前缀来标记此内联代码块为DQL块。

~~~
`= this.file.name`
~~~

> [!info] DQL前缀的更改
> 您可以在Dataview的设置中的"代码块设置" > "内联查询前缀"下将`=`更改为另一个标记（如`dv:`或`~`）。

内联DQL查询在您笔记的中间某处显示**恰好一个值**。它们无缝地融入您笔记的内容中：

~~~markdown
Today is `= date(today)` - `= [[exams]].deadline - date(today)` until exams!
~~~

例如，将呈现为

~~~markdown
Today is November 07, 2022 - 2 months, 5 days until exams!
~~~

**内联DQL**查询总是显示恰好一个值，而不是值的列表（或表格）。您可以通过前缀`this.`访问**当前页面**的属性，或通过`[[linkToPage]].`访问不同页面的属性。

~~~markdown
`= this.file.name`
`= this.file.mtime`
`= this.someMetadataField`
`= [[secondPage]].file.name`
`= [[secondPage]].file.mtime`
`= [[secondPage]].someMetadataField`
~~~

您可以在内联DQL查询中使用作为[表达式](../reference/expressions.md)和[字面量](../reference/literals.md)可用的一切，包括[函数](../reference/functions.md)。另一方面，查询类型和数据命令在**内联中不可用**。

~~~markdown
Assignment due in `= this.due - date(today)`
Final paper due in `= [[Computer Science Theory]].due - date(today)`

🏃‍♂️ Goal reached? `= choice(this.steps > 10000, "YES!", "**No**, get moving!")`

You have `= length(filter(link(dateformat(date(today), "yyyy-MM-dd")).file.tasks, (t) => !t.completed))` tasks to do. `= choice(date(today).weekday > 5, "Take it easy!", "Time to get work done!")`
~~~

## Dataview JS

dataview [JavaScript API](../api/intro.md)为您提供JavaScript的全部功能，并提供用于提取Dataview数据和执行查询的DSL，允许您创建任意复杂的查询和视图。与查询语言类似，您通过`dataviewjs`注释的代码块创建Dataview JS块：

~~~java
```dataviewjs
let pages = dv.pages("#books and -#books/finished").where(b => b.rating >= 7);
for (let group of pages.groupBy(b => b.genre)) {
   dv.header(3, group.key);
   dv.list(group.rows.file.name);
}
```
~~~

在JS dataview块内，您可以通过`dv`变量访问完整的dataview API。有关您可以用它做什么的解释，请参见[API文档](../api/code-reference.md)或[API示例](../api/code-examples.md)。

> [!attention] 高级用法
> 编写Javascript查询是一种高级技术，需要对编程和JS有所了解。请注意，JS查询可以访问您的文件系统，在使用其他人的JS查询时要谨慎，特别是当它们不是通过Obsidian社区公开分享时。

## 内联Dataview JS

与查询语言类似，您可以编写JS内联查询，这让您可以直接嵌入计算的JS值。您通过内联代码块创建JS内联查询：

```
`$= dv.current().file.mtime`
```

在内联DataviewJS中，您可以访问`dv`变量，就像在`dataviewjs`代码块中一样，并且可以进行所有相同的调用。结果应该是评估为JavaScript值的东西，Dataview将自动适当地呈现它。

与内联DQL查询不同，内联JS查询确实可以访问Dataview JS查询可用的所有内容，因此可以查询和输出多个页面。

> [!info] 内联JS前缀的更改
> 您可以在Dataview的设置中的"代码块设置" > "Javascript内联查询前缀"下将`$=`更改为另一个标记（如`dvjs:`或`$~`）。
