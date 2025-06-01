---
publish: true
---

# 推迟

<span class="related-pages">#feature/dates</span>

## 介绍

> [!Tip]
> 您是否曾经发现您的任务列表充满了您以最好的意图安排的过期任务？
>
> - 现在您想推迟其中许多任务，以便专注于紧急优先事项？
> - 或者您想删除日期？
>
> 那么⏩推迟按钮就是为您准备的！

Tasks搜索结果中的⏩按钮允许您快速推迟（或"暂停"）任务到明天或更晚。

> [!released]
>
> - 推迟功能在Tasks 5.3.0中引入。
> - 删除现有日期的能力在Tasks 7.3.0中引入。

### 点击和上下文菜单

⏩按钮提供两种选择：

1. **点击按钮**将日期推进到以下**较早者**：
    - 明天
    - 当前日期的后一天
    ![Tooltip on the Postpone button shows tomorrow's date, for dates before or on today](../images/postpone-overdue-task-default-action.png)
    <span class="caption">推迟按钮上的**工具提示**显示**明天的日期**，适用于**今天或之前的日期**。</span>
    ![Tooltip on the Postpone button shows 'postpone by day', for future dates.](../images/postpone-future-task-default-action.png)
    <span class="caption">推迟按钮上的**工具提示**显示"**推迟一天**"，适用于**未来日期**。</span>

2. **右键点击**或**长按**按钮从上下文菜单中选择：
    - 未来6天内的日期
    - 更远的未来日期
    - 删除日期的选项：
    ![Context menu on the Postpone button shows options for dates before or on today](../images/postpone-overdue-task-context-menu.png)
    <span class="caption">推迟按钮上的**上下文菜单**显示**今天或之前日期**的选项</span>
    ![Context menu on the Postpone button shows options for future dates.](../images/postpone-future-task-context-menu.png)
    <span class="caption">推迟按钮上的**上下文菜单**显示**未来日期**的选项。</span>

### 编辑哪个日期字段？

推迟选项查看这些任务字段中的第一个，并将编辑以下第一个：

1. **截止**日期，如果存在。
1. **计划**日期
    - 如果不存在截止日期。
1. **开始**日期
    - 如果不存在截止或计划日期。

### 何时显示推迟按钮？

- 当前没有截止、计划和开始日期的任务不显示推迟按钮。
- 具有任何无效日期（包括创建和完成日期）的任务也不显示推迟按钮。
- 您可以使用`hide postpone button` [[Layout|布局]]指令从您的任务查询结果中隐藏推迟按钮。

### 可用性

此功能目前仅在Tasks查询搜索结果中可用。

| 位置                                   | 查看模式 | 是否有效? |
| --------------------------------------- | ------------ | ------ |
| markdown文件中的任务行            | 源码模式  | ❌     |
| markdown文件中的任务行            | 实时预览 | ❌     |
| markdown文件中的任务行            | 阅读模式 | ❌     |
| 编辑任务模态框                         | 所有模式    | ❌     |
| Tasks查询搜索结果中的⏩按钮 | 实时预览 | ✅     |
| Tasks查询搜索结果中的⏩按钮 | 阅读模式 | ✅     |

## 当前限制

### 为什么特定任务上不显示推迟？

原因之一：

- 任务状态类型[[Status Types|状态类型]]是`DONE`、`CANCELLED`或`NON_TASK`。
- 任务没有[[Dates#Due date|截止]]、[[Dates#Scheduled date|计划]]或[[Dates#Start date|开始]]日期。
- 任务至少有一个日期字段具有无效的日期值。
- 使用了`hide postpone button`指令。

### 我可以使用推迟为未设置日期的任务添加日期吗？

目前不可以。
