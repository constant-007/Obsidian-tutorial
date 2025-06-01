---
publish: true
---

# Dataview格式

<span class="related-pages">#task-formats #task-format/dataview #plugin/dataview</span>

## 读取和写入dataview格式

> [!released]
> 在Tasks 3.3.0中引入。

Tasks现在对dataview插件的基于文本的格式有了逐步发展的支持，用于向任务行添加数据。

> [!Warning]
> 目前，对dataview格式的支持是部分的，与dataview行为存在一些重要差异。
>
> 我们将努力改善兼容性，但与此同时，**请仔细阅读本页面**。

## 方括号内联字段

Tasks专门读取任务列表项中的[Dataview的方括号内联字段](https://blacksmithgu.github.io/obsidian-dataview/annotation/add-metadata/#inline-fields)。

这意味着您需要在Tasks行上编写`key:: value`字符串，用`[]`或`()`包围。

但是，请注意，当Tasks*写入*任务行时，它总是用`[]`写入，即使它们最初是用`()`写入的。

括号`[]`和`()`在[Dataview显示方式](https://blacksmithgu.github.io/obsidian-dataview/annotation/add-metadata/#inline-fields)上有所不同。使用圆括号语法，Dataview只显示字段值，不显示键。

### 确保在实时预览中正确显示

> [!tip]
> 如果在源码或实时预览中，**您的任何dataview字段都有下划线**，为确保您在实时预览中看到所有数据，您应该**分隔字段**用以下之一：
>
> - 2个空格
> - 逗号和空格
>
> [[Create or edit Task|创建或编辑任务]]模态框会自动在dataview字段之间放置2个空格。

> [!warning]
> `[Text][More Text]`是一个Markdown功能，称为[引用样式链接](https://daringfireball.net/projects/markdown/syntax#link)。
>
> 如果Obsidian中**启用**了实时预览，Obsidian将**隐藏**第二组方括号内的所有内容。
>
> 所以一个有多个内联字段的任务：
>
> ```text
> - [ ] This is a task [priority:: high] [start:: 2023-04-24] [due:: 2023-05-01]
> ```
>
> 在启用实时预览时会看起来像这样：
>
> > - [ ] This is a task <u>priority:: high</u> [due:: 2023-05-01]
>
> ---
>
> 这个问题超出了Tasks插件的范围，但可以通过以下任何解决方法来避免：
>
> - 在Obsidian中**关闭**实时预览。
> - 用至少2个空格分隔每个字段。
>
> > [!example]
> >
> > ```text
> >  - [ ] This is a task [priority:: high]  [start:: 2023-04-24]  [due:: 2023-05-01]
> >  ```
>
> - 用逗号分隔每个字段。
>
> > [!example]
> >
> > ```text
> >  - [ ] This is a task [priority:: high], [start:: 2023-04-24], [due:: 2023-05-01]
> > ```

## 支持的dataview字段

这些示例演示了Tasks插件解析dataview字段所支持的所有字段。

> [!Tip]
> 下面的所有示例都显示方括号中的字段：`[...]`。
>
> Tasks也读取圆括号中的dataview字段：`(...)`。

<!-- NEW_TASK_FIELD_EDIT_REQUIRED -->

### 日期的Dataview格式

这些名称与[dataview文档](https://blacksmithgu.github.io/obsidian-dataview/annotation/metadata-tasks/#field-shorthands)中的相同字段一致。

<!-- snippet: DocsSamplesForTaskFormats.test.Serializer_Dates_dataview-snippet.approved.md -->
```md
- [ ] #task 有创建日期  [created:: 2023-04-13]
- [ ] #task 有计划日期  [scheduled:: 2023-04-14]
- [ ] #task 有开始日期  [start:: 2023-04-15]
- [ ] #task 有到期日期  [due:: 2023-04-16]
- [x] #task 有完成日期  [completion:: 2023-04-17]
- [-] #task 有取消日期  [cancelled:: 2023-04-18]
```
<!-- endSnippet -->

有关更多信息，请参阅[[Dates|日期]]。

### 优先级的Dataview格式

> [!Info]
> 这些名称是为Tasks使用而选择的，dataview不了解。当然可以在dataview中搜索它们。

<!-- snippet: DocsSamplesForTaskFormats.test.Serializer_Priorities_dataview-snippet.approved.md -->
```md
- [ ] #task 最低优先级  [priority:: lowest]
- [ ] #task 低优先级  [priority:: low]
- [ ] #task 普通优先级
- [ ] #task 中等优先级  [priority:: medium]
- [ ] #task 高优先级  [priority:: high]
- [ ] #task 最高优先级  [priority:: highest]
```
<!-- endSnippet -->

有关更多信息，请参阅[[Priority|优先级]]。

### 重复的Dataview格式

> [!Info]
> 这个名称是为Tasks使用而选择的，因为它在[dataview功能请求#878](https://github.com/blacksmithgu/obsidian-dataview/issues/878)中被建议。dataview还不了解它。当然可以在dataview中搜索它。

```markdown
- [ ] #task 这是一个重复任务 [repeat:: every day when done]
```

有关更多信息，请参阅[[Recurring Tasks|重复任务]]。

### 完成时行为的Dataview格式

<!-- snippet: DocsSamplesForTaskFormats.test.Serializer_OnCompletion_dataview-snippet.approved.md -->
```md
- [ ] #task 完成时保留此任务
- [ ] #task 完成时也保留此任务  [onCompletion:: keep]
- [ ] #task 完成时删除此任务  [onCompletion:: delete]
- [ ] #task 完成时删除此重复任务的已完成实例  [repeat:: every day]  [onCompletion:: delete]
```
<!-- endSnippet -->

有关更多信息，请参阅[[On Completion|完成时行为]]。

### 依赖关系的Dataview格式

<!-- snippet: DocsSamplesForTaskFormats.test.Serializer_Dependencies_dataview-snippet.approved.md -->
```md
- [ ] #task 先做这个  [id:: dcf64c]
- [ ] #task 在第一个和其他任务之后做这个  [dependsOn:: dcf64c,0h17ye]
```
<!-- endSnippet -->

有关更多信息，请参阅[[Task Dependencies|任务依赖]]。

## 自动建议和Dataview格式

Dataview格式完全支持Tasks的[[Auto-Suggest|自动建议]]功能，但需要用户手动输入周围的括号（`[]`或`()`）。这在`设置 > 编辑器 > 自动配对括号`启用时效果最佳。

自Tasks 4.6.1起，自动建议菜单*仅*在方括号`[]`或圆括号`()`之间出现。

## Dataview格式的限制

必读：

- [[About Task Formats#Impact of non-default task formats on Tasks behaviour|关于任务格式#非默认任务格式对Tasks行为的影响]]
- [[About Task Formats#Limitations of task format support|关于任务格式#任务格式支持的限制]]

与Dataview自己解析任务行相比的其他限制：

- Tasks还不能从任务行内的任意位置读取Dataview字段，尽管Dataview允许这样做。
- Tasks目前只从匹配任何全局过滤器的任务行读取Dataview字段。
  - 它还不能从[前言](https://blacksmithgu.github.io/obsidian-dataview/annotation/add-metadata/#frontmatter)读取字段。
  - 它不读取已被认为是任务的行之外的[内联字段](https://blacksmithgu.github.io/obsidian-dataview/annotation/add-metadata/#inline-fields)。
