---
publish: true
---

# Ebullientworks主题

## 介绍

|                       位置 | 链接                                                                                                                                                                |
| ------------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                        GitHub: | <https://github.com/ebullient/obsidian-theme-ebullientworks>                                                                                                        |
|                  Obsidian Hub: | [Ebullientworks Theme](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/Themes/Ebullientworks)                              |
| Tasks-Demo保险库中的测试笔记: | [Theme - Ebullientworks](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/resources/sample_vaults/Tasks-Demo/Styling/Theme%20-%20Ebullientworks.md) |

## 截图

![在阅读模式下显示的示例任务，使用Ebullientworks主题](../../../images/theme-ebullientworks-reading-view.png)

## 支持的状态

<!-- snippet: DocsSamplesForStatuses.test.Theme_Ebullientworks_Text.approved.txt -->
```txt
- [ ] #task `space` 未选中
- [x] #task `x` 已选中
- [-] #task `-` 已取消
- [/] #task `/` 进行中
- [>] #task `>` 推迟
- [!] #task `!` 重要
- [?] #task `?` 问题
- [r] #task `r` 审查
```
<!-- endSnippet -->

## Tasks的一键添加

Tasks的设置面板有一个一键按钮，可以添加以下信息，代表此插件中的自定义复选框。

<!-- placeholder to force blank line before included text --><!-- include: DocsSamplesForStatuses.test.Theme_Ebullientworks_Table.approved.md -->

| 状态符号 | 下一个状态符号 | 状态名称<br>`status.name includes...`<br>`sort by status.name`<br>`group by status.name` | 状态类型<br>`status.type is...`<br>`sort by status.type`<br>`group by status.type` | 需要自定义样式 |
| ----- | ----- | ----- | ----- | ----- |
| `space` | `x` | 未选中 | `TODO` | 否 |
| `x` | `space` | 已选中 | `DONE` | 否 |
| `-` | `space` | 已取消 | `CANCELLED` | 是 |
| `/` | `x` | 进行中 | `IN_PROGRESS` | 是 |
| `>` | `x` | 推迟 | `TODO` | 是 |
| `!` | `x` | 重要 | `TODO` | 是 |
| `?` | `x` | 问题 | `TODO` | 是 |
| `r` | `x` | 审查 | `TODO` | 是 |

<!-- placeholder to force blank line after included text --><!-- endInclude -->
