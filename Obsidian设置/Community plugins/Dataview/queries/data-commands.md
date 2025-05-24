# 数据命令

dataview查询可以由不同的命令组成。命令按顺序执行，您可以有重复的命令（例如，多个`WHERE`块或多个`GROUP BY`块）。

## FROM

`FROM`语句决定最初将收集哪些页面并传递给其他命令进行进一步过滤。您可以从任何[源](../reference/sources.md)中选择，这目前意味着通过文件夹、标签或传入/传出链接。

- **标签**：要从标签（及其所有子标签）中选择，使用`FROM #tag`。
- **文件夹**：要从文件夹（及其所有子文件夹）中选择，使用`FROM "folder"`。
- **单个文件**：要从单个文件中选择，使用`FROM "path/to/file"`。
- **链接**：您可以选择链接到文件的页面，或从文件链接的所有页面。
  - 要获取所有链接到`[[note]]`的页面，使用`FROM [[note]]`。
  - 要获取所有从`[[note]]`链接的页面（即该文件中的所有链接），使用`FROM outgoing([[note]])`。

您可以使用`and`和`or`组合这些过滤器以获得更高级的源。

- 例如，`#tag and "folder"`将返回`folder`中具有`#tag`的所有页面。
- `[[Food]] or [[Exercise]]`将给出链接到`[[Food]]`或`[[Exercise]]`的任何页面。

您还可以使用`-`"否定"源以获得不匹配源的任何内容：

- `-#tag`将排除具有给定标签的文件。
- `#tag and -"folder"`将只包括标记了`#tag`但不在`"folder"`中的文件。

## WHERE

基于字段过滤页面。只有子句评估为`true`的页面才会被产生。

```
WHERE <clause>
```

1. 获取在过去24小时内修改的所有文件：

    ```sql
    LIST WHERE file.mtime >= date(today) - dur(1 day)
    ```

2. 查找所有未标记为完成且超过一个月的项目：

    ```sql
    LIST FROM #projects
    WHERE !completed AND file.ctime <= date(today) - dur(1 month)
    ```

## SORT

按一个或多个字段对所有结果进行排序。

```
SORT date [ASCENDING/DESCENDING/ASC/DESC]
```

您还可以提供多个字段进行排序。排序将基于第一个字段进行。然后，如果出现平局，将使用第二个字段对平局字段进行排序。如果仍然平局，第三个排序将解决它，依此类推。

```
SORT field1 [ASCENDING/DESCENDING/ASC/DESC], ..., fieldN [ASC/DESC]
```

## GROUP BY

在字段上对所有结果进行分组。每个唯一字段值产生一行，具有2个属性：一个对应于被分组的字段，一个`rows`数组字段包含所有匹配的页面。

```
GROUP BY field
GROUP BY (computed_field) AS name
```

为了使使用`rows`数组更容易，Dataview支持字段"swizzling"。如果您想要从`rows`数组中的每个对象获取字段`test`，那么`rows.test`将自动从`rows`中的每个对象获取`test`字段，产生一个新数组。
然后您可以在结果数组上应用聚合运算符，如`sum()`或`flat()`。

## FLATTEN

展平每行中的数组，为数组中的每个条目产生一个结果行。

```
FLATTEN field
FLATTEN (computed_field) AS name
```

例如，展平每个文献笔记中的`authors`字段，为每个作者提供一行：

=== "查询"
    ```sql
    TABLE authors FROM #LiteratureNote
    FLATTEN authors
    ```
=== "输出"
    |File|authors|
    |-|-|
    |stegEnvironmentalPsychologyIntroduction2018 SN|Steg, L.|
    |stegEnvironmentalPsychologyIntroduction2018 SN|Van den Berg, A. E.|
    |stegEnvironmentalPsychologyIntroduction2018 SN|De Groot, J. I. M.|
    |Soap Dragons SN|Robert Lamb|
    |Soap Dragons SN|Joe McCormick|
    |smithPainAssaultSelf2007 SN|Jonathan A. Smith|
    |smithPainAssaultSelf2007 SN|Mike Osborn|

这的一个很好的用途是当有一个深度嵌套的列表您想要更容易使用时。
例如，`file.lists`或`file.tasks`。
注意更简单的查询，尽管最终结果略有不同（分组与非分组）。
您可以使用`GROUP BY file.link`来实现相同的结果，但需要使用前面描述的`rows.T.text`。

```
table T.text as "Task Text"
from "Scratchpad"
flatten file.tasks as T
where T.text
```

```
table filter(file.tasks.text, (t) => t) as "Task Text"
from "Scratchpad"
where file.tasks.text
```

`FLATTEN`使在嵌套列表上操作更容易，因为您可以对它们使用更简单的where条件，而不是使用`map()`或`filter()`等函数。

## LIMIT

将结果限制为最多N个值。

```
LIMIT 5
```

命令按照编写的顺序处理，因此以下内容在结果已经被限制后对结果进行排序：

```
LIMIT 5
SORT date ASCENDING
```
