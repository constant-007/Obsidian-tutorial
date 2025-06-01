---
publish: true
---

# Aura主题

## 介绍

|                       位置 | 链接                                                                                                                                                          |
| ------------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                        GitHub: | <https://github.com/ashwinjadhav818/obsidian-aura>                                                                                                            |
|                  Obsidian Hub: | [Aura Theme](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/Themes/Aura)                                            |
| Tasks-Demo保险库中的测试笔记: | [Theme - Aura Theme](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/resources/sample_vaults/Tasks-Demo/Styling/Theme%20-%20Aura%20Theme.md) |
|                         备注: |                                                                                                                                                               |

## 截图

![在阅读模式下显示的示例任务，使用Aura主题](../../../images/theme-aura-reading-view.png)

## 支持的状态

<!-- snippet: DocsSamplesForStatuses.test.Theme_Aura_Text.approved.txt -->
```txt
- [ ] #task `space` 未完成
- [x] #task `x` 完成/已完成
- [-] #task `-` 已取消
- [>] #task `>` 推迟
- [/] #task `/` 进行中，或半完成
- [!] #task `!` 重要
- [?] #task `?` 问题
- [R] #task `R` 审查
- [+] #task `+` 收件箱/稍后处理的任务
- [b] #task `b` 书签
- [B] #task `B` 头脑风暴
- [D] #task `D` 推迟或已安排
- [I] #task `I` 信息
- [i] #task `i` 想法
- [N] #task `N` 笔记
- [Q] #task `Q` 引用
- [W] #task `W` 成功/胜利/奖励
- [P] #task `P` 优点
- [C] #task `C` 缺点
```
<!-- endSnippet -->

## Tasks的一键添加

Tasks的设置面板有一个一键按钮，可以添加以下信息，代表此插件中的自定义复选框。

<!-- placeholder to force blank line before included text --><!-- include: DocsSamplesForStatuses.test.Theme_Aura_Table.approved.md -->

| 状态符号 | 下一个状态符号 | 状态名称<br>`status.name includes...`<br>`sort by status.name`<br>`group by status.name` | 状态类型<br>`status.type is...`<br>`sort by status.type`<br>`group by status.type` | 需要自定义样式 |
| ----- | ----- | ----- | ----- | ----- |
| `space` | `x` | 未完成 | `TODO` | 否 |
| `x` | `space` | 完成/已完成 | `DONE` | 否 |
| `-` | `space` | 已取消 | `CANCELLED` | 是 |
| `>` | `x` | 推迟 | `TODO` | 是 |
| `/` | `x` | 进行中，或半完成 | `IN_PROGRESS` | 是 |
| `!` | `x` | 重要 | `TODO` | 是 |
| `?` | `x` | 问题 | `TODO` | 是 |
| `R` | `x` | 审查 | `TODO` | 是 |
| `+` | `x` | 收件箱/稍后处理的任务 | `TODO` | 是 |
| `b` | `x` | 书签 | `TODO` | 是 |
| `B` | `x` | 头脑风暴 | `TODO` | 是 |
| `D` | `x` | 推迟或已安排 | `TODO` | 是 |
| `I` | `x` | 信息 | `TODO` | 是 |
| `i` | `x` | 想法 | `TODO` | 是 |
| `N` | `x` | 笔记 | `TODO` | 是 |
| `Q` | `x` | 引用 | `TODO` | 是 |
| `W` | `x` | 成功/胜利/奖励 | `TODO` | 是 |
| `P` | `x` | 优点 | `TODO` | 是 |
| `C` | `x` | 缺点 | `TODO` | 是 |

<!-- placeholder to force blank line after included text --><!-- endInclude -->
