---
publish: true
aliases:
  - Status Type
---

# 状态类型

<span class="related-pages">#feature/statuses</span>

## 概述

随着创建各种[[Custom Statuses|自定义状态]]的新能力，Tasks需要了解每个状态的足够信息，以便决定：

- 搜索时如何处理任务，
- 以及切换具有该状态的任务时要做什么，包括添加或删除完成日期，以及创建新的任务重复。

这通过引入"状态类型"得到解决，这只是一组5种可能的状态类型：

- `TODO`
- `IN_PROGRESS`
- `DONE`
- `CANCELLED`
- `NON_TASK`

## 类型

### TODO

不言自明，我们希望：这可以被认为是"尚未开始的事情"。

### IN_PROGRESS

使用此功能是完全可选的。您可能会发现能够优先完成已经开始的任务很有用。

### DONE

`DONE`类型用于确定：

- 切换任务时是否添加或删除完成日期。
- 完成重复任务时是否创建新实例。

页面[[Recurring Tasks and Custom Statuses|重复任务和自定义状态]]有几个实际示例来完整解释上述要点。

### CANCELLED

这通常用于您最初认为需要完成但后来发现由于某种原因不需要的任务。

以前，Tasks中这些任务的唯一选择是将它们标记为DONE，但这是误导性的。它还可能为它们添加完成日期，这更加误导。

### NON_TASK

自定义复选框样式通常用于非任务概念，例如"优点"和"缺点"列表。

您可能希望将此类型分配给您的某些状态，以允许您编写过滤器从任务搜索中排除它们。

当您点击`NON_TASK`状态的复选框时，任务行将：

- 永远不会获得完成日期
- 永远不会创建新实例，即使任务行有[[Recurring Tasks|重复规则]]。

## 状态类型相关指令

- 状态类型可以使用`status.type`搜索，例如`status.type is IN_PROGRESS`。
  - 您可以有任意数量的具有相同状态类型的状态，然后使用`status.type`方便地搜索它们
- 还可用：
  - `sort by status.type`
  - `group by status.type`

`status.type`过滤器使用Tasks代码中的一种新模式，有些人称之为"[编写帮助消息而不是错误消息](https://twitter.com/travis_simon/status/1069074730211135488)"。

如果Tasks不理解`status.type`指令，它会报告这种消息：

```text
Tasks query: Invalid status.type instruction: 'status.type in progress'.
    Allowed options: 'is' and 'is not' (without quotes).
    Allowed values:  TODO DONE IN_PROGRESS CANCELLED NON_TASK
                     Note: values are case-insensitive,
                           so 'in_progress' works too, for example.
    Example:         status.type is not NON_TASK
```

### Tasks过滤器中的状态类型

有了状态类型的所有这些额外灵活性，它们在Tasks搜索中有什么影响。

例如，旧的`done`和`not done`过滤器如何使用它们？

如果您对细节感兴趣，此表演示了Tasks中每种状态类型的行为。
每列显示具有给定状态类型的代表性示例任务。

显示的任务纯粹是上下文示例。`~`列只是一个任意示例，用于显示`NON_TASK`的行为。您可以将这些类型中的每一个分配给您的任何自定义状态。

<!-- placeholder to force blank line before included text --><!-- include: DocsSamplesForStatuses.test.Status_Transitions_status-types.approved.md -->

| 操作和status.type | TODO | IN_PROGRESS | DONE | CANCELLED | NON_TASK |
| ----- | ----- | ----- | ----- | ----- | ----- |
| 示例任务 | `- [ ] demo` | `- [/] demo` | `- [x] demo` | `- [-] demo` | `- [~] demo` |
| 匹配`not done` | YES | YES | no | no | no |
| 匹配`done` | no | no | YES | YES | YES |
| 匹配`status.type is TODO` | YES | no | no | no | no |
| 匹配`status.type is IN_PROGRESS` | no | YES | no | no | no |
| 匹配`status.type is DONE` | no | no | YES | no | no |
| 匹配`status.type is CANCELLED` | no | no | no | YES | no |
| 匹配`status.type is NON_TASK` | no | no | no | no | YES |
| 匹配`status.name includes todo` | YES | no | no | no | no |
| 匹配`status.name includes in progress` | no | YES | no | no | no |
| 匹配`status.name includes done` | no | no | YES | no | no |
| 匹配`status.name includes cancelled` | no | no | no | YES | no |
| `group by status`的名称 | Todo | Todo | Done | Done | Done |
| `group by status.type`的名称 | %%2%%TODO | %%1%%IN_PROGRESS | %%3%%DONE | %%4%%CANCELLED | %%5%%NON_TASK |
| `group by status.name`的名称 | Todo | In Progress | Done | Cancelled | My custom status |

<!-- placeholder to force blank line after included text --><!-- endInclude -->
