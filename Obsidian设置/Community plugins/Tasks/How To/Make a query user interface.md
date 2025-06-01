---
publish: true
---

# 如何制作查询用户界面

<span class="related-pages">#plugin/meta-bind</span>

## Meta Bind Tasks用户界面查询文件默认值

> [!released]
> 查询文件默认值在Tasks 7.15.0中引入。

[[Meta Bind Plugin|Meta Bind插件]]允许Obsidian用户通过内联输入字段、元数据显示和按钮使他们的笔记具有交互性。

我们可以结合：

1. Tasks插件的[[Query File Defaults|查询文件默认值]]功能，基于名为`TQ_*`的特定属性，
2. Meta Bind插件创建小部件来修改笔记属性的能力。

...来创建一个用户界面，轻松调整您的Tasks搜索，可以：

- 显示和隐藏每个任务属性，
- 启用或禁用其他搜索功能，如嵌套任务、简短模式、反向链接和按钮，
- 并允许添加任意额外指令：

![Meta Bind widgets to edit Query File Defaults](../images/query-file-defaults-meta-bind-controls.png)
<span class="caption">用于编辑查询文件默认值的Meta Bind小部件</span>

## 如何设置

按照这些步骤，假设您已经[关闭了Obsidian的限制模式](https://help.obsidian.md/Extending+Obsidian/Plugin+security)：

1. 安装并启用[Meta Bind](https://obsidian.md/plugins?search=Meta%20Bind)插件。
2. 复制下面的Markdown代码块。
3. 将Markdown粘贴到Obsidian中有一个或多个Tasks搜索的笔记中。
4. 切换到实时预览或阅读模式，查看小部件。
5. 实验后，删除任何您不需要的标签和小部件。

<!-- snippet: DocsSamplesForDefaults.test.DocsSamplesForDefaults_meta-bind-widgets-snippet.approved.md -->
```md
短模式: `INPUT[toggle:TQ_short_mode]`
树状: `INPUT[toggle:TQ_show_tree]`
标签: `INPUT[toggle:TQ_show_tags]`
id: `INPUT[toggle:TQ_show_id]` 依赖于: `INPUT[toggle:TQ_show_depends_on]`
优先级: `INPUT[toggle:TQ_show_priority]`
重复规则: `INPUT[toggle:TQ_show_recurrence_rule]` 完成时: `INPUT[toggle:TQ_show_on_completion]`
开始日期: `INPUT[toggle:TQ_show_start_date]` 计划日期: `INPUT[toggle:TQ_show_scheduled_date]` 到期日期: `INPUT[toggle:TQ_show_due_date]`
创建日期: `INPUT[toggle:TQ_show_created_date]` 取消日期: `INPUT[toggle:TQ_show_cancelled_date]` 完成日期: `INPUT[toggle:TQ_show_done_date]`
紧急度: `INPUT[toggle:TQ_show_urgency]`
反向链接: `INPUT[toggle:TQ_show_backlink]`
编辑按钮: `INPUT[toggle:TQ_show_edit_button]` 推迟按钮: `INPUT[toggle:TQ_show_postpone_button]`
任务计数: `INPUT[toggle:TQ_show_task_count]`
额外指令: `INPUT[textArea:TQ_extra_instructions]`
解释: `INPUT[toggle:TQ_explain]`
```
<!-- endSnippet -->

## 为什么提供这个？

有人可能会说这种机制可能有点笨拙，Tasks提供自己的用户界面不是更好吗？

我们同意，我们正在[issue #2579](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2579)中跟踪此问题。

但是，开发过程大致如下：

1. 教会Tasks使用[[Obsidian Properties#Using Query Properties in Searches|搜索中的查询属性]]。
2. 发现从简单的`true`/`false`属性生成Tasks指令需要在用户查询中编写一些非常复杂的JavaScript代码，这：
    - 对我们来说很难记录，
    - 对用户来说很难复制和理解，使他们的搜索变得混乱。
3. 实现[[Query File Defaults|查询文件默认值]]机制。
4. 发现使用Obsidian的[属性视图](https://help.obsidian.md/Plugins/Properties+view)核心插件*还算可以*，但是：
    - 打开和关闭侧面板有点繁琐，
    - 它在编辑多行字符串方面做得不是很好，而这对`TQ_extra_instructions`很有用。
5. 尝试[[Meta Bind Plugin|Meta Bind插件]]并决定这种用法相对容易且是一个很大的进步，直到Obsidian有自己的用户界面！
