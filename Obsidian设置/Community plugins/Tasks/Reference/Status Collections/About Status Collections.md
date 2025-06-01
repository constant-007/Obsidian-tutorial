---
publish: true
aliases:
  - Reference/Status Collections/Status Collections
---

# 关于状态集合

<span class="related-pages">#index-pages #feature/statuses</span>

## 背景

> [!released]
自定义状态在Tasks 1.23.0中引入。

您可以使用Tasks的[[Statuses|状态]]功能控制任务的行为（例如点击复选框时会发生什么）。

<!-- force a blank line --><!-- include: snippet-statuses-overview.md -->

> [!info]
> 理解和设置状态（或"替代复选框"）的基本步骤：
>
> - 了解什么是状态：
>   - [[Statuses|状态]]
>   - [[Custom Statuses|自定义状态]]
> - 选择您的状态样式方案：这将确定您自定义状态的名称和符号：
>   - 一些常见的方案在[[About Status Collections|关于状态集合]]中显示
> - 设置您的状态样式方案
>   - [[Style custom statuses|如何设置自定义状态的样式]]。
> - 配置Tasks使用您的自定义状态
>   - [[Set up custom statuses|如何设置您的自定义状态]]
>   - [[Check your Statuses|检查您的状态]]
> - 可选，更新您的任务搜索以利用新的灵活性
>   - [[Filters#Filters for Task Statuses|任务状态过滤器]]

<!-- force a blank line --><!-- endInclude -->

主题和代码片段作者通常将此称为"自定义复选框"。

Tasks只知道如何显示两种核心状态：`[空格]`和`[x]`。

因此，在设置自定义状态之前，您需要决定采用哪个CSS代码片段或主题。本节将在这方面提供帮助。

## 选项

### 您当前的主题或CSS代码片段

如果您已经对支持自定义复选框的主题或CSS代码片段感到满意，可以停止阅读本节，并继续配置Tasks来使用它：请参阅[[Set up custom statuses|如何设置您的自定义状态]]。

### 选择主题或CSS代码片段

Tasks为下面"目录"中的所有主题和CSS代码片段提供了简单的一键设置。

### 我们的推荐：SlRvb的替代复选框

如果您不确定使用哪个，我们建议使用CSS代码片段而不是主题：

- 主题对于markdown演示的许多方面都有很强的意见。
- CSS代码片段通常可以与各种主题一起使用，因此它们保持了更多的选择开放性。

被广泛使用的[[SlRvb's Alternate Checkboxes|SlRvb的替代复选框]]代码片段非常出色，我们建议从它开始。

但是，您也可以浏览本节中的页面，查看Tasks已知的其他选项。

## 支持的CSS代码片段和主题

- [[About Status Collections|关于状态集合]]
- [[AnuPpuccin Theme|AnuPpuccin主题]]
- [[Aura Theme|Aura主题]]
- [[Border Theme|Border主题]]
- [[Ebullientworks Theme|Ebullientworks主题]]
- [[ITS Theme|ITS主题]]
- [[LYT Mode Theme|LYT模式主题]]
- [[Minimal Theme|Minimal主题]]
- [[SlRvb's Alternate Checkboxes|SlRvb的替代复选框]]
- [[Things Theme|Things主题]]
