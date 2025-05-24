# 查询类型

**查询类型**决定了您的dataview查询输出的外观。它是您给dataview查询的**第一个也是唯一必需的**规范。有四种可用类型：`LIST`、`TABLE`、`TASK`和`CALENDAR`。

查询类型还决定了查询执行的**信息级别**。`LIST`、`TABLE`和`CALENDAR`在**页面级别**操作，而`TASK`查询在`file.tasks`级别操作。更多信息请参见`TASK`查询类型。

您可以将**每种查询类型与所有可用的[数据命令](data-commands.md)组合**来细化您的结果集。在[如何使用Dataview](../index.md#how-to-use-dataview)和[结构页面](structure.md)上阅读有关查询类型和数据命令之间相互关系的更多信息。

> [!summary] 查询类型
> 查询类型决定查询的输出格式。它是查询的唯一必需信息。

## LIST

`LIST`查询输出一个项目符号列表，包含您的文件链接或组名（如果您决定[分组](data-commands.md#group-by)）。您可以指定**最多一个附加信息**与您的文件或组信息一起输出。

> [!summary] 查询类型`LIST`
> `LIST`输出页面链接或组键的项目符号列表。您可以指定为每个结果显示的一个附加信息。

最简单的LIST查询输出您库中所有文件的项目符号列表：

~~~
```dataview
LIST
```
~~~

**输出**


- [Classic Cheesecake](#)
- [Git Basics](#)
- [How to fix Git Cheatsheet](#)
- [League of Legends](#)
- [Pillars of Eternity 2](#)
- [Stardew Valley](#)
- [Dashboard](#)


但是您当然可以使用[数据命令](data-commands.md)来限制您想要列出的页面：

~~~
```dataview
LIST
FROM #games/mobas OR #games/crpg
```
~~~

**输出**

- [League of Legends](#)
- [Pillars of Eternity 2](#)

### 输出附加信息

要向您的查询添加**附加信息**，请在`LIST`命令之后和可能可用的数据命令之前指定它：

~~~
```dataview
LIST file.folder
```
~~~

**输出**


- [Classic Cheesecake](#): Baking/Recipes
- [Git Basics](#): Coding
- [How to fix Git Cheatsheet](#): Coding/Cheatsheets
- [League of Legends](#): Games
- [Pillars of Eternity 2](#): Games
- [Stardew Valley](#): Games/finished
- [Dashboard](#):

您只能添加**一个**附加信息，不能添加多个。但您可以**指定计算值**而不是纯元数据字段，它可以包含多个字段的信息：

~~~
```dataview
LIST "File Path: " + file.folder + " _(created: " + file.cday + ")_"
FROM "Games"
```
~~~

**输出**

- [League of Legends](#): File Path: Games _(created: May 13, 2021)_
- [Pillars of Eternity 2](#): File Path: Games _(created: February 02, 2022)_
- [Stardew Valley](#): File Path: Games/finished _(created: April 04, 2021)_

### 分组

默认情况下，**分组列表**显示其组键，且仅显示组键：

~~~
```dataview
LIST
GROUP BY type
```
~~~

**输出**

- game
- knowledge
- moc
- recipe
- summary

分组`LIST`查询的常见用例是通过将文件链接指定为附加信息来将其添加到输出中：

~~~
```dataview
LIST rows.file.link
GROUP BY type
```
~~~

- game:
    - [Stardew Valley](#)
    - [League of Legends](#)
    - [Pillars of Eternity 2](#)
- knowledge:
    - [Git Basics](#)
- moc:
    - [Dashboard](#)
- recipe:
    - [Classic Cheesecake](#)
- summary:
    - [How to fix Git Cheatsheet](#)

### LIST WITHOUT ID

如果您不希望在列表视图中包含文件名或组键，可以使用`LIST WITHOUT ID`。`LIST WITHOUT ID`的工作方式与`LIST`相同，但如果您添加附加信息，它不会输出文件链接或组名。

~~~
```dataview
LIST WITHOUT ID
```
~~~

**输出**


- [Classic Cheesecake](#)
- [Git Basics](#)
- [How to fix Git Cheatsheet](#)
- [League of Legends](#)
- [Pillars of Eternity 2](#)
- [Stardew Valley](#)
- [Dashboard](#)

这与`LIST`相同，因为它不包含附加信息！

~~~
```dataview
LIST WITHOUT ID type
```
~~~

**输出**

- moc
- recipe
- summary
- knowledge
- game
- game
- game

例如，如果您想输出计算值，`LIST WITHOUT ID`会很方便。

~~~
```dataview
LIST WITHOUT ID length(rows) + " pages of type " + key
GROUP BY type
```
~~~

**输出**

- 3 pages of type game
- 1 pages of type knowledge
- 1 pages of type moc
- 1 pages of type recipe
- 1 pages of type summary

## TABLE

`TABLE`查询类型将页面数据输出为表格视图。您可以通过将其添加为**逗号分隔的列表**来向您的`TABLE`查询添加零到多个元数据字段。您不仅可以使用纯元数据字段作为列，还可以指定**计算**。可选地，您可以通过`AS <header>`语法指定**表头**。与所有其他查询类型一样，您可以使用[数据命令](data-commands.md)为您的查询细化结果集。

> [!summary] `TABLE`查询类型
> `TABLE`查询呈现任意数量的元数据值或计算的表格视图。可以通过`AS <header>`指定列标题。

~~~
```dataview
TABLE
```
~~~

**输出**

| File (7) |
| ----- |
| [Classic Cheesecake](#) |
| [Git Basics](#) |
| [How to fix Git Cheatsheet](#) |
| [League of Legends](#) |
| [Pillars of Eternity 2](#) |
| [Stardew Valley](#) |
| [Dashboard](#) |

> [!hint] 更改第一列标题名称
> 您可以通过Dataview设置在表格设置 -> 主列名称/组列名称下更改第一列标题的名称（默认为"File"或"Group"）。
> 如果您只想为一个特定的`TABLE`查询更改名称，请查看`TABLE WITHOUT ID`。

> [!info] 禁用结果计数
> 第一列总是显示结果计数。如果您不想显示它，可以在Dataview的设置中禁用它（"显示结果计数"，自0.5.52版本起可用）。

当然，`TABLE`是为指定一到多个附加信息而设计的：

~~~
```dataview
TABLE started, file.folder, file.etags
FROM #games
```
~~~

**输出**

| File (3) | started | file.folder | file.etags |
| --- | --- | --- | --- |
| [League of Legends](#)  | 	May 16, 2021 | 	Games	 | - #games/moba  |
| [Pillars of Eternity 2](#)  | 	April 21, 2022 | 	Games	 | - #games/crpg |
| [Stardew Valley](#) | 	April 04, 2021 | 	Games/finished	 |  - #games/simulation |

> [!hint] 隐式字段
> 对`file.folder`和`file.etags`感到好奇？在[页面上的隐式字段](../annotation/metadata-pages.md)中了解更多。

### 自定义列标题

您可以使用`AS`语法为您的列指定**自定义标题**：

~~~
```dataview
TABLE started, file.folder AS Path, file.etags AS "File Tags"
FROM #games
```
~~~

**输出**

| File (3) | started | Path | File Tags |
| --- | --- | --- | --- |
| [League of Legends](#) | 	May 16, 2021 | 	Games	 | - #games/moba  |
| [Pillars of Eternity 2](#)  | 	April 21, 2022 | 	Games	 | - #games/crpg |
| [Stardew Valley](#) | 	April 04, 2021 | 	Games/finished	 |  - #games/simulation |

> [!info] 带空格的自定义标题
> 如果您想使用带空格的自定义标题，如`File Tags`，您需要将其包装在双引号中：`"File Tags"`。

当您想使用**计算或表达式作为列值**时，这特别有用：

~~~
```dataview
TABLE
default(finished, date(today)) - started AS "Played for",
file.folder AS Path,
file.etags AS "File Tags"
FROM #games
```
~~~

**输出**

| File (3) | Played for | Path | File Tags |
| --- | --- | --- | --- |
| [League of Legends](#) | 	1 years, 6 months, 1 weeks | 	Games	 | - #games/moba  |
| [Pillars of Eternity 2](#)  | 	7 months, 2 days | 	Games	 | - #games/crpg |
| [Stardew Valley](#) | 	4 months, 3 weeks, 3 days | 	Games/finished	 |  - #games/simulation |

> [!hint] 计算和表达式
> 在[表达式](../reference/expressions.md)和[函数](../reference/functions.md)下了解更多关于计算表达式和计算能力的信息。

### TABLE WITHOUT ID

如果您不想要第一列（默认为"File"或"Group"），可以使用`TABLE WITHOUT ID`。`TABLE WITHOUT ID`的工作方式与`TABLE`相同，但如果您添加附加信息，它不会将文件链接或组名作为第一列输出。

例如，如果您输出另一个标识值，可以使用此功能：

~~~
```dataview
TABLE WITHOUT ID
steamid,
file.etags AS "File Tags"
FROM #games
```
~~~

**输出**

| steamid (3)  | File Tags |
| --- | --- |
| 560130 |  - #games/crog  |
| - |  - #games/moba |
| 413150 |   - #games/simulation |

另外，如果您想为**一个特定查询重命名第一列**，也可以使用`TABLE WITHOUT ID`。

~~~
```dataview
TABLE WITHOUT ID
file.link AS "Game",
file.etags AS "File Tags"
FROM #games
```
~~~

**输出**

| Game (3) | File Tags |
| --- | --- |
| [League of Legends](#) |  - #games/moba  |
| [Pillars of Eternity 2](#)  | - #games/crpg |
| [Stardew Valley](#) |  - #games/simulation |

> [!info] 一般情况下重命名第一列
> 如果您想在所有情况下重命名第一列，请在Dataview设置的表格设置下更改名称。

## TASK

`TASK`查询输出**您库中所有任务的交互式列表**，这些任务匹配给定的[数据命令](data-commands.md)（如果有的话）。与其他查询类型相比，`TASK`查询是特殊的，因为它们返回的是**任务作为结果而不是页面**。这意味着所有[数据命令](data-commands.md)都在**任务级别**操作，使得可以细粒度地过滤您的任务，例如根据它们的状态或在任务本身上指定的元数据。

另外，`TASK`查询是**通过DQL操作您的文件**的唯一可能性。通常，Dataview不会触及您文件的内容；然而，如果您通过dataview查询检查任务，它也会**在其原始文件中被检查**。在Dataview设置的"任务设置"下，您可以选择在dataview中检查任务时自动设置`completion`元数据字段。但请注意，这只有在您在dataview块内检查任务时才有效。

> [!summary] `TASK`查询类型
> `TASK`查询呈现您库中所有任务的交互式列表。`TASK`查询在**任务级别**执行，而不是页面级别，允许任务特定的过滤。这是dataview中唯一在交互时修改您原始文件的命令。

~~~
```dataview
TASK
```
~~~

**输出**

- [ ] Buy new shoes #shopping
- [ ] Mail Paul about training schedule
- [ ] Finish the math assignment
    - [x] Finish Paper 1 [due:: 2022-08-13]
    - [ ] Read again through chapter 3 [due:: 2022-09-01]
    - [x] Write a cheatsheet [due:: 2022-08-02]
    - [ ] Write a summary of chapter 1-4 [due:: 2022-09-12]
- [x] Hand in physics
- [ ] Get new pillows for mom #shopping
- [x] Buy some working pencils #shopping

您可以像所有其他查询类型一样使用[数据命令](data-commands.md)。数据命令在任务级别执行，使[任务上的隐式字段](../annotation/metadata-tasks.md)直接可用。

~~~
```dataview
TASK
WHERE !completed AND contains(tags, "#shopping")
```
~~~

**输出**

- [ ] Buy new shoes #shopping
- [ ] Get new pillows for mom #shopping

任务的常见用例是**按其来源文件对任务进行分组**：

~~~
```dataview
TASK
WHERE !completed
GROUP BY file.link
```
~~~

**输出**

[2022-07-30](#) (1)

- [ ] Finish the math assignment
    - [ ] Read again through chapter 3 [due:: 2022-09-01]
    - [ ] Write a summary of chapter 1-4 [due:: 2022-09-12]

[2022-09-21](#) (2)

- [ ] Buy new shoes #shopping
- [ ] Mail Paul about training schedule

[2022-09-27](#) (1)

- [ ] Get new pillows for mom #shopping

> [!hint] 计算带有子任务的任务
> 注意到`2022-07-30`标题上的(1)吗？子任务属于其父任务，不会单独计算。另外，它们在过滤时**行为不同**。

### 子任务

如果任务**用制表符缩进**并且在未缩进的任务下方，则被视为**子任务**。

- [ ] clean up the house
	- [ ] kitchen
	- [x] living room
	- [ ] Bedroom [urgent:: true]

> [!info] 项目符号列表项的子项
> 虽然项目符号列表项下的缩进任务严格来说也是子任务，但Dataview在大多数情况下会将它们作为普通任务处理。

子任务**属于其父任务**。这意味着如果您查询任务，您将获得子任务作为其父任务的一部分。

~~~
```dataview
TASK
```
~~~

**输出**

- [ ] clean up the house
	- [ ] kitchen
	- [x] living room
	- [ ] Bedroom [urgent:: true]
- [ ] Call the insurance about the car
- [x] Find out the transaction number

这特别意味着，只要父任务匹配查询，子任务就会成为您结果集的一部分——**即使子任务本身不匹配**。

~~~
```dataview
TASK
WHERE !completed
```
~~~

**输出**

- [ ] clean up the house
	- [ ] kitchen
	- [x] living room
	- [ ] Bedroom [urgent:: true]
- [ ] Call the insurance about the car

在这里，`living room`**不匹配**查询，但仍然被包括在内，因为其父任务`clean up the house`匹配。

请注意，如果子任务匹配您的谓词但父任务不匹配，您将获得单独的子任务：

~~~
```dataview
TASK
WHERE urgent
```
~~~

**输出**

- [ ] Bedroom [urgent:: true]

## CALENDAR

`CALENDAR`查询输出一个基于月份的日历，其中每个结果都以点的形式描绘在其引用日期上。`CALENDAR`是唯一需要附加信息的查询类型。这个附加信息需要是所有查询页面上的[日期](../annotation/types-of-metadata.md#date)（或未设置）。

> [!summary] `CALENDAR`查询类型
> `CALENDAR`查询类型呈现一个日历视图，其中每个结果由给定元数据字段日期上的点表示。

~~~
```dataview
CALENDAR file.ctime
```
~~~

**输出**

![](../assets/calendar_query_type.png)

虽然可以将`SORT`和`GROUP BY`与`CALENDAR`组合使用，但它**没有效果**。另外，如果给定的元数据字段包含除有效[日期](../annotation/types-of-metadata.md#date)之外的其他内容，日历查询将不会渲染（但字段可以为空）。为了确保您只考虑有效的页面，您可以过滤有效的元数据值：

~~~
```dataview
CALENDAR due
WHERE typeof(due) = "date"
```
~~~
