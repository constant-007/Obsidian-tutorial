---
publish: true
---

# 设置自定义状态

<span class="related-pages">#feature/statuses</span>

## 动机

本页面向您展示如何自定义Tasks库中使用的状态，一旦您决定了要在`[`和`]`内使用哪些字母和符号，以及它们应该被称为什么。

### 核心（内置）状态

安装后，Tasks插件仅支持任务的两种状态：

```text
- [ ] 我是一个尚未完成的待办任务
- [x] 我是一个已经完成的完成任务
```

- 点击待办任务将其转换为完成
- 点击完成任务将其转换为待办

### 自定义状态

许多用户希望表示其他状态，如已取消、已委派、已阻止等等。

> [!released]
自定义状态在Tasks 1.23.0中引入。

Tasks现在允许您在设置中添加自定义状态，让您强大地控制点击任务复选框时接下来会发生什么。

## 任务状态设置

这是您首次查看Tasks设置中任务状态部分时看到的内容：

![初始任务状态选项](../images/settings-statuses-initial.png)

您可以在[[Status Settings|状态设置]]中了解相关信息。

## 示例：添加一组高优先级状态

### 目标

假设您想创建一组3个状态，它们之间循环切换，也许是为了让重要任务从其他所有任务中脱颖而出：

<!-- placeholder to force blank line before included text --><!-- include: DocsSamplesForStatuses.test.DefaultStatuses_important-cycle.approved.md -->

| 状态符号 | 下一个状态符号 | 状态名称 | 状态类型 | 需要自定义样式 |
| ----- | ----- | ----- | ----- | ----- |
| `!` | `D` | 重要 | `TODO` | 是 |
| `D` | `X` | 进行中 - 重要 | `IN_PROGRESS` | 是 |
| `X` | `!` | 完成 - 重要 | `DONE` | 是 |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

### 步骤

1. 打开Tasks设置面板
1. 向下滚动并点击"添加新任务状态"
    - 这将创建一个新的空状态：
    - ![添加新空状态后的设置](../images/settings-custom-statuses-added-1.png)
1. 点击铅笔图标
    - 这将打开[[Editing a Status|状态编辑模态框]]。
    - 注意红色着色，表示尚未有效的值。
    - 如果您不确定为什么某些内容无效，请点击复选标记按钮，解释性通知将弹出几秒钟。
    - ![编辑状态的模态框](../images/settings-custom-statuses-dialog-1.png)
1. 输入所需的值（参见上面目标中的表格）：
    - ![为我们的新状态输入值](../images/settings-custom-statuses-dialog-2.png)
1. 点击复选标记按钮保存新状态，并查看结果：
    - ![保存新状态值后](../images/settings-custom-statuses-added.png)
1. 对上面目标中的其他两个状态重复此操作，您应该看到新状态流程的清晰反映
    - `[!]` -> `[D]` -> `[X]` -> `[!]`：
    - ![添加其他两个新状态后](../images/settings-custom-statuses-important-loop-added.png)

> [!info]
> 状态更改立即应用于新编辑的任务和随后打开的笔记。
>
> 在实验和设置状态时，您不需要重启Obsidian，除非您希望让Tasks重新读取库中的所有任务，例如让搜索知道状态的更改。
>
> 一旦您对状态满意，我们建议重启Obsidian，以确保所有任务和查询结果使用正确的设置。

> [!warning]
Tasks目前允许创建多个具有相同符号的状态。它会静默忽略任何重复的符号：只有第一个会被使用。如有疑问，请检查[[Create or edit Task|"创建或编辑任务"模态框]]中状态下拉菜单中的可用状态。

### 测试新状态

现在您可以使用[[Create or edit Task|"创建或编辑任务"模态框]]创建新任务并设置其状态：

![任务编辑模态框立即显示新状态](../images/modal-showing-new-statuses.png)

创建一个重要任务：

```text
- [!] #task 做重要的事情
```

切换到阅读模式。
然后点击上述任务的复选框。
它变成：

```text
- [D] #task 做重要的事情
```

重复 - 注意大写的`X`：

```text
- [X] #task 做重要的事情 ✅ 2023-01-09
```

再次重复：

```text
- [!] #task 做重要的事情
```

## 添加更多状态

[[Status Settings#Bulk-adding Statuses|批量添加状态]]显示了在单个步骤中快速添加大量状态的各种方法。

## 相关页面

<!-- force a blank line --><!-- include: snippet-statuses-overview.md -->

> [!info]
> 理解和设置状态（或"替代复选框"）的大致步骤：
>
> - 了解什么是状态：
>   - [[Statuses|状态]]
>   - [[Custom Statuses|自定义状态]]
> - 选择您的状态样式方案：这将决定您自定义状态的名称和符号：
>   - 一些常见的在[[About Status Collections|关于状态集合]]中显示
> - 设置您的状态样式方案
>   - [[Style custom statuses|如何设置自定义状态样式]]。
> - 配置Tasks使用您的自定义状态
>   - [[Set up custom statuses|如何设置您的自定义状态]]
>   - [[Check your Statuses|检查您的状态]]
> - 可选地，更新您的任务搜索以利用新的灵活性
>   - [[Filters#Filters for Task Statuses|任务状态过滤器]]

<!-- force a blank line --><!-- endInclude -->
