---
publish: true
---

# 限制

## 限制任务总数

您可以限制作为查询结果显示的任务总数。

使用查询字符串`limit to <number> tasks`。
这将只列出查询的前`<number>`个结果（排序后）。

简写形式是`limit <number>`。

## 限制每组中的任务数

如果使用了[[Grouping|分组]]，您还可以限制每组中允许的任务数。否则此限制将被忽略。

使用查询字符串`limit groups to <number> tasks`。
这将只列出查询结果中每组的前`<number>`个任务。

简写形式是`limit groups <number>`。

> [!NOTE]
> 如果Tasks查询中没有`group by`指令，`limit groups`指令将被忽略。

> [!released]
> `limit groups to <number> tasks`在Tasks 3.8.0中引入。

## 查看找到的任务总数

如果任一`limit`选项阻止任何任务在结果中显示，将显示总数，例如：

```text
50 of 686 tasks
```

> [!released]
> 显示任务总数的功能在Tasks 4.8.0中添加。
