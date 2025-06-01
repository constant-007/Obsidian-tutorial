---
publish: true
---

# Things主题

## 介绍

|                       位置 | 链接                                                                                                                                                                |
| ------------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                        GitHub: | <https://github.com/colineckert/obsidian-things>                                                                                                                        |
|                  Obsidian Hub: | [Things Theme](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/Themes/Things)                                            |
| Tasks-Demo保险库中的测试笔记: | [Theme - Things Theme](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/resources/sample_vaults/Tasks-Demo/Styling/Theme%20-%20Things%20Theme.md) |

## 截图

![在阅读模式下显示的示例任务，使用Things主题](../../../images/theme-things-reading-view.png)

## 支持的状态

<!-- snippet: DocsSamplesForStatuses.test.Theme_Things_Text.approved.txt -->
```txt
- [ ] #task `space` 待办
- [/] #task `/` 未完成
- [x] #task `x` 完成
- [-] #task `-` 已取消
- [>] #task `>` 转发
- [<] #task `<` 安排
- [?] #task `?` 问题
- [!] #task `!` 重要
- [*] #task `*` 星标
- ["] #task `"` 引用
- [l] #task `l` 位置
- [b] #task `b` 书签
- [i] #task `i` 信息
- [S] #task `S` 储蓄
- [I] #task `I` 想法
- [p] #task `p` 优点
- [c] #task `c` 缺点
- [f] #task `f` 火焰
- [k] #task `k` 钥匙
- [w] #task `w` 胜利
- [u] #task `u` 向上
- [d] #task `d` 向下
```
<!-- endSnippet -->

## Tasks的一键添加

Tasks的设置面板有一个一键按钮，可以添加以下信息，代表此插件中的自定义复选框。

<!-- placeholder to force blank line before included text --><!-- include: DocsSamplesForStatuses.test.Theme_Things_Table.approved.md -->

| 状态符号 | 下一个状态符号 | 状态名称<br>`status.name includes...`<br>`sort by status.name`<br>`group by status.name` | 状态类型<br>`status.type is...`<br>`sort by status.type`<br>`group by status.type` | 需要自定义样式 |
| ----- | ----- | ----- | ----- | ----- |
| `space` | `x` | 待办 | `TODO` | 否 |
| `/` | `x` | 未完成 | `IN_PROGRESS` | 是 |
| `x` | `space` | 完成 | `DONE` | 否 |
| `-` | `space` | 已取消 | `CANCELLED` | 是 |
| `>` | `x` | 转发 | `TODO` | 是 |
| `<` | `x` | 安排 | `TODO` | 是 |
| `?` | `x` | 问题 | `TODO` | 是 |
| `!` | `x` | 重要 | `TODO` | 是 |
| `*` | `x` | 星标 | `TODO` | 是 |
| `"` | `x` | 引用 | `TODO` | 是 |
| `l` | `x` | 位置 | `TODO` | 是 |
| `b` | `x` | 书签 | `TODO` | 是 |
| `i` | `x` | 信息 | `TODO` | 是 |
| `S` | `x` | 储蓄 | `TODO` | 是 |
| `I` | `x` | 想法 | `TODO` | 是 |
| `p` | `x` | 优点 | `TODO` | 是 |
| `c` | `x` | 缺点 | `TODO` | 是 |
| `f` | `x` | 火焰 | `TODO` | 是 |
| `k` | `x` | 钥匙 | `TODO` | 是 |
| `w` | `x` | 胜利 | `TODO` | 是 |
| `u` | `x` | 向上 | `TODO` | 是 |
| `d` | `x` | 向下 | `TODO` | 是 |

<!-- placeholder to force blank line after included text --><!-- endInclude -->
