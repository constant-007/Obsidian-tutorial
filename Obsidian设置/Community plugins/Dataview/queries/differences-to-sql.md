<!--
 * @Author: chinesehamburger 2576226012@qq.com
 * @Date: 2024-12-12 14:24:45
 * @LastEditors: chinesehamburger 2576226012@qq.com
 * @LastEditTime: 2024-12-13 16:40:43
 * @FilePath: \obsidian-dataview\docs\docs\queries\differences-to-sql.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# Dataview查询语言（DQL）与SQL

如果您熟悉SQL并且有编写SQL查询的经验，您可能会以类似的方式来编写DQL查询。然而，DQL与SQL有显著差异。

DQL查询是**从上到下逐行执行**的。它更像是一个计算机程序而不是典型的SQL查询。

当一行被评估时，它产生一个结果集并**将整个集合传递给下一行DQL**，下一行将操作从前一行接收到的集合。这就是为什么在DQL中可以有多个WHERE子句的原因。但在DQL中，它不是"子句"而是"数据命令"。DQL查询的每一行（除了第1和第2行）都是一个"数据命令"。

## DQL查询的结构

DQL查询不是以SELECT开始，而是以确定查询类型的词开始，该词决定最终结果如何在屏幕上呈现（表格、列表、任务列表或日历）。然后是字段列表，这实际上与您在SELECT语句后放置的列列表非常相似。

下一行以FROM开始，后面跟的不是表名，而是一个复杂的表达式，类似于SQL WHERE子句。在这里您可以过滤许多内容，如文件中的标签、文件名、路径名等。在后台，此命令已经产生了一个结果集，这将是我们在后续行中由"数据命令"进行进一步数据操作的初始集合。

您可以有任意多的后续行。每行都将以[数据命令](data-commands.md)开始，并将重新塑造从前一行接收到的结果集。例如：

- WHERE数据命令将只保留结果集中匹配给定条件的那些行。这意味着，除非结果集中的所有数据都匹配条件，否则此命令将向下一行传递比从前一行接收到的更小的结果集。与SQL不同，您可以有任意多的WHERE命令。
- FLATTEN数据命令在常见的SQL中没有，但在DQL中您可以使用它来降低结果集的深度。
- DQL与SQL类似，有GROUP BY命令，但这也可以多次使用，这在常见的SQL中是不可能的。您甚至可以依次执行多个SORT或GROUP BY命令。
