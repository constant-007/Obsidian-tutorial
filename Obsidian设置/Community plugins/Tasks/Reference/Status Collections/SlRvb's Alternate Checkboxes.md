---
publish: true
---

# SlRvb的替代复选框

## 介绍

这个主题提供与[[ITS Theme|ITS主题]]相同的复选框，但也能与其他主题一起工作，因此更加灵活。

|                       位置 | 链接                                                                                                                                                                                                    |
| ------------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                        GitHub: | <https://github.com/SlRvb/Obsidian--ITS-Theme/blob/main/Guide/Alternate-Checkboxes.md>                                                                                                                  |
|                  Obsidian Hub: | [Alternate Checkboxes](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/CSS+Snippets/Alternate+Checkboxes+(SlRvb))                                              |
| Tasks-Demo保险库中的测试笔记: | [Snippet - SlRvb's Alternate Checkboxes](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/resources/sample_vaults/Tasks-Demo/Styling/Snippet%20-%20SlRvb's%20Alternate%20Checkboxes.md) |

## 截图

![在阅读模式下显示的示例任务，使用SlRvb的替代复选框代码片段](../../../images/snippet-slrvb-alternate-checkboxes.png)

## 支持的状态

<!-- snippet: DocsSamplesForStatuses.test.Theme_ITS_Text.approved.txt -->
```txt
- [ ] #task `space` 未选中
- [x] #task `x` 常规
- [X] #task `X` 已选中
- [-] #task `-` 已丢弃
- [>] #task `>` 转发
- [D] #task `D` 日期
- [?] #task `?` 问题
- [/] #task `/` 半完成
- [+] #task `+` 添加
- [R] #task `R` 研究
- [!] #task `!` 重要
- [i] #task `i` 想法
- [B] #task `B` 头脑风暴
- [P] #task `P` 优点
- [C] #task `C` 缺点
- [Q] #task `Q` 引用
- [N] #task `N` 笔记
- [b] #task `b` 书签
- [I] #task `I` 信息
- [p] #task `p` 释义
- [L] #task `L` 位置
- [E] #task `E` 示例
- [A] #task `A` 答案
- [r] #task `r` 奖励
- [c] #task `c` 选择
- [d] #task `d` 正在进行
- [T] #task `T` 时间
- [@] #task `@` 角色/人物
- [t] #task `t` 对话
- [O] #task `O` 大纲/情节
- [~] #task `~` 冲突
- [W] #task `W` 世界
- [f] #task `f` 线索/发现
- [F] #task `F` 伏笔
- [H] #task `H` 最爱/健康
- [&] #task `&` 象征主义
- [s] #task `s` 秘密
```
<!-- endSnippet -->

## Tasks的一键添加

Tasks的设置面板有一个一键按钮，可以添加以下信息，代表此插件中的自定义复选框。

<!-- placeholder to force blank line before included text --><!-- include: DocsSamplesForStatuses.test.Theme_ITS_Table.approved.md -->

| 状态符号 | 下一个状态符号 | 状态名称<br>`status.name includes...`<br>`sort by status.name`<br>`group by status.name` | 状态类型<br>`status.type is...`<br>`sort by status.type`<br>`group by status.type` | 需要自定义样式 |
| ----- | ----- | ----- | ----- | ----- |
| `space` | `x` | 未选中 | `TODO` | 否 |
| `x` | `space` | 常规 | `DONE` | 否 |
| `X` | `space` | 已选中 | `DONE` | 是 |
| `-` | `space` | 已丢弃 | `CANCELLED` | 是 |
| `>` | `x` | 转发 | `TODO` | 是 |
| `D` | `x` | 日期 | `TODO` | 是 |
| `?` | `x` | 问题 | `TODO` | 是 |
| `/` | `x` | 半完成 | `IN_PROGRESS` | 是 |
| `+` | `x` | 添加 | `TODO` | 是 |
| `R` | `x` | 研究 | `TODO` | 是 |
| `!` | `x` | 重要 | `TODO` | 是 |
| `i` | `x` | 想法 | `TODO` | 是 |
| `B` | `x` | 头脑风暴 | `TODO` | 是 |
| `P` | `x` | 优点 | `TODO` | 是 |
| `C` | `x` | 缺点 | `TODO` | 是 |
| `Q` | `x` | 引用 | `TODO` | 是 |
| `N` | `x` | 笔记 | `TODO` | 是 |
| `b` | `x` | 书签 | `TODO` | 是 |
| `I` | `x` | 信息 | `TODO` | 是 |
| `p` | `x` | 释义 | `TODO` | 是 |
| `L` | `x` | 位置 | `TODO` | 是 |
| `E` | `x` | 示例 | `TODO` | 是 |
| `A` | `x` | 答案 | `TODO` | 是 |
| `r` | `x` | 奖励 | `TODO` | 是 |
| `c` | `x` | 选择 | `TODO` | 是 |
| `d` | `x` | 正在进行 | `IN_PROGRESS` | 是 |
| `T` | `x` | 时间 | `TODO` | 是 |
| `@` | `x` | 角色/人物 | `TODO` | 是 |
| `t` | `x` | 对话 | `TODO` | 是 |
| `O` | `x` | 大纲/情节 | `TODO` | 是 |
| `~` | `x` | 冲突 | `TODO` | 是 |
| `W` | `x` | 世界 | `TODO` | 是 |
| `f` | `x` | 线索/发现 | `TODO` | 是 |
| `F` | `x` | 伏笔 | `TODO` | 是 |
| `H` | `x` | 最爱/健康 | `TODO` | 是 |
| `&` | `x` | 象征主义 | `TODO` | 是 |
| `s` | `x` | 秘密 | `TODO` | 是 |

<!-- placeholder to force blank line after included text --><!-- endInclude -->
