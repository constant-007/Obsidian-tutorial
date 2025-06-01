---
publish: true
---

# 自定义状态

<span class="related-pages">#feature/statuses</span>

## 简介

> [!released]
> 自定义状态在Tasks 1.23.0中引入。

自定义状态代表任何非标准的markdown任务。

这里有一些具有示例自定义状态的任务，即在`[`和`]`之间具有非标准字符：

```text
- [X] 已检查
- [-] 已放弃/取消的任务
- [?] 一个问题
- [/] 半完成/进行中的任务
```

它们**需要自定义CSS样式或主题**才能在Tasks块或实时预览中正确显示。

这是您可以使用自定义状态和样式做的事情：

![Selection of checkboxes from Minimal theme](../../images/theme-minimal-reading-view-sample.png) ![Selection of checkboxes from ITS theme](../../images/theme-its-reading-view-sample.png)

## 有什么大不了的？

人们一直在使用主题和CSS片段来设置Obsidian中自定义复选框的样式。

Tasks的自定义状态允许您做的是**还可以自定义任务的行为**。

## 默认自定义状态

这是自定义状态最初在Tasks设置中的样子，显示了Tasks默认提供的两个自定义状态：

![Default custom statuses](../../images/settings-custom-statuses-initial.png)

这是您可以如何使用它们：

<!-- placeholder to force blank line before included text --><!-- include: DocsSamplesForStatuses.test.DefaultStatuses_custom-statuses.approved.md -->

| 状态符号 | 下一个状态符号 | 状态名称<br>`status.name includes...`<br>`sort by status.name`<br>`group by status.name` | 状态类型<br>`status.type is...`<br>`sort by status.type`<br>`group by status.type` | 需要自定义样式 |
| ----- | ----- | ----- | ----- | ----- |
| `/` | `x` | In Progress | `IN_PROGRESS` | Yes |
| `-` | `space` | Cancelled | `CANCELLED` | Yes |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

## 设置您的自定义状态

<!-- force a blank line --><!-- include: snippet-statuses-overview.md -->

> [!info]
> 理解和设置状态（或"替代复选框"）的大致步骤：
>
> - 理解什么是状态：
>   - [[Statuses|状态]]
>   - [[Custom Statuses|自定义状态]]
> - 选择您的状态样式方案：这将确定您的自定义状态的名称和符号：
>   - 一些常见的在[[About Status Collections|关于状态集合]]中显示
> - 设置您的状态样式方案
>   - [[Style custom statuses|如何设置自定义状态样式]]。
> - 配置Tasks使用您的自定义状态
>   - [[Set up custom statuses|如何设置您的自定义状态]]
>   - [[Check your Statuses|检查您的状态]]
> - 可选地，更新您的任务搜索以利用新的灵活性
>   - [[Filters#Filters for Task Statuses|任务状态过滤器]]

<!-- force a blank line --><!-- endInclude -->

### 首先选择您的样式方案

您可以使用任何您希望的片段或主题。如果您已经在使用支持"自定义复选框"的片段或主题，您应该坚持使用它。

但是，如果您使用的是默认主题，或者不知道如何设置"自定义复选框"样式的主题，您需要选择一个。

[[About Status Collections|关于状态集合]]列出了Tasks已经为其提供一键支持的那些，以帮助您选择。

### 安装您的样式方案

例如，您可以按照[[Style custom statuses|如何设置自定义状态样式]]进行操作。

### 编辑自定义状态

您选择的样式工具将决定您希望在自定义状态中使用哪些字母和字符。

现在您可以按照[[Set up custom statuses|如何设置您的自定义状态]]进行操作。

或者您可以阅读[[Status Settings|状态设置]]，并了解如何[[Editing a Status|编辑状态]]。

> [!warning]
> 记住在设置自定义状态之前设置您选择的CSS片段或主题。
