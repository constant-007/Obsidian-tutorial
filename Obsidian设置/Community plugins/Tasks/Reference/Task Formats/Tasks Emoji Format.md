---
publish: true
---

# Tasks表情符号格式

<span class="related-pages">#task-formats #task-format/tasks</span>

这些示例演示了Tasks插件解析其自己的表情符号标识符所支持的所有字段。

<!-- NEW_TASK_FIELD_EDIT_REQUIRED -->

## 日期的Tasks表情符号格式

<!-- snippet: DocsSamplesForTaskFormats.test.Serializer_Dates_tasksPluginEmoji-snippet.approved.md -->
```md
- [ ] #task 有创建日期 ➕ 2023-04-13
- [ ] #task 有计划日期 ⏳ 2023-04-14
- [ ] #task 有开始日期 🛫 2023-04-15
- [ ] #task 有到期日期 📅 2023-04-16
- [x] #task 有完成日期 ✅ 2023-04-17
- [-] #task 有取消日期 ❌ 2023-04-18
```
<!-- endSnippet -->

有关更多信息，请参阅[[Dates|日期]]。

## 优先级的Tasks表情符号格式

<!-- snippet: DocsSamplesForTaskFormats.test.Serializer_Priorities_tasksPluginEmoji-snippet.approved.md -->
```md
- [ ] #task 最低优先级 ⏬
- [ ] #task 低优先级 🔽
- [ ] #task 普通优先级
- [ ] #task 中等优先级 🔼
- [ ] #task 高优先级 ⏫
- [ ] #task 最高优先级 🔺
```
<!-- endSnippet -->

有关更多信息，请参阅[[Priority|优先级]]。

## 重复的Tasks表情符号格式

```markdown
- [ ] #task 这是一个重复任务 🔁 every day when done
```

有关更多信息，请参阅[[Recurring Tasks|重复任务]]。

## 完成时行为的Tasks表情符号格式

<!-- snippet: DocsSamplesForTaskFormats.test.Serializer_OnCompletion_tasksPluginEmoji-snippet.approved.md -->
```md
- [ ] #task 完成时保留此任务
- [ ] #task 完成时也保留此任务 🏁 keep
- [ ] #task 完成时删除此任务 🏁 delete
- [ ] #task 完成时删除此重复任务的已完成实例 🔁 every day 🏁 delete
```
<!-- endSnippet -->

有关更多信息，请参阅[[On Completion|完成时行为]]。

## 依赖关系的Tasks表情符号格式

<!-- snippet: DocsSamplesForTaskFormats.test.Serializer_Dependencies_tasksPluginEmoji-snippet.approved.md -->
```md
- [ ] #task 先做这个 🆔 dcf64c
- [ ] #task 在第一个和其他任务之后做这个 ⛔ dcf64c,0h17ye
```
<!-- endSnippet -->

有关更多信息，请参阅[[Task Dependencies|任务依赖]]。

## Tasks表情符号格式的限制

### 不间断空格：NBSP字符

从网站复制和粘贴文本时，空格有时会被粘贴为`NBSP`字符。

这些字符在文本编辑器中通常是可见的，但在Obsidian中它们看起来像普通空格。

Tasks目前不将这些字符视为空格，因此表情符号及其值可能无法正确读取。

我们在[issue #606](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/606)中跟踪这个问题。

### 手动'双向上'箭头表情符号无法识别

参见下面的[[Tasks Emoji Format#Unicode Variation Selectors|Tasks表情符号格式#Unicode变体选择器]]。

### Unicode变体选择器

Tasks不理解unicode[变体选择器](https://en.wikipedia.org/wiki/Variation_Selectors_(Unicode_block))。

有报告称，当手动添加时，这会阻止Tasks正确读取高优先级表情符号（⏫）。

我们在[issue #2273](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2273)中跟踪这个问题。
