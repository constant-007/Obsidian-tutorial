---
publish: true
---

# 解释查询

## 概述：'explain'指令

> [!released]
在Tasks 1.19.0中引入。

`explain`指令在实时预览和阅读模式下查看tasks代码块时，在搜索结果的开头添加一些额外的输出。

这有许多好处：

- 易于理解基于日期的过滤器：
  - 过滤器中的任何日期都会被展开，以显示搜索中使用的实际日期。
- 布尔查询逻辑更清晰。
  - 查询的组合（通过`AND`、`OR`、`NOT`等）可以更清楚地看到。
- 如果启用了[[Global Filter|全局过滤器]]，它会包含在解释中。
  - 这通常解释了为什么任务从结果中缺失。
- 如果启用了[[Global Query|全局查询]]，它也会包含在解释中。
- 列出任何[[query file defaults|查询文件默认值]]生成的指令（自Tasks 7.15.0起）。
- 列出任何[[Grouping|'group by']]指令（自Tasks 5.4.0起）。
- 列出任何[[Sorting|'sort by']]指令（自Tasks 5.4.0起）。

## 示例

### 过滤器中的日期被展开

例如，当以下文本放在tasks查询块中时：

<!-- snippet: DocsSamplesForExplain.test.explain_expands_dates.approved.query.text -->
```text
starts after 2 years ago
scheduled after 1 week ago
due before tomorrow
explain
```
<!-- endSnippet -->

在`2022-10-21`时，结果以以下内容开始：

<!-- snippet: DocsSamplesForExplain.test.explain_expands_dates.approved.explanation.text -->
```text
Explanation of this Tasks code block query:

  starts after 2 years ago =>
    start date is after 2020-10-21 (Wednesday 21st October 2020) OR no start date

  scheduled after 1 week ago =>
    scheduled date is after 2022-10-14 (Friday 14th October 2022)

  due before tomorrow =>
    due date is before 2022-10-22 (Saturday 22nd October 2022)
```
<!-- endSnippet -->

注意它如何非常清楚地显示正在搜索的日期，包括星期几。

它还显示`starts`搜索也匹配没有开始日期的任务。

### 正则表达式被解释

> [!released]
> 在Tasks 4.3.0中引入。

例如，当以下[[Regular Expressions|正则表达式]]放在tasks查询块中时：

<!-- snippet: DocsSamplesForExplain.test.explain_regular_expression.approved.query.text -->
```text
explain
path regex matches /^Root/Sub-Folder/Sample File\.md/i
```
<!-- endSnippet -->

结果以以下内容开始：

<!-- snippet: DocsSamplesForExplain.test.explain_regular_expression.approved.explanation.text -->
```text
Explanation of this Tasks code block query:

  path regex matches /^Root/Sub-Folder/Sample File\.md/i =>
    using regex:     '^Root\/Sub-Folder\/Sample File\.md' with flag 'i'
```
<!-- endSnippet -->

### 显示布尔组合

例如，当以下文本放在tasks查询块中时：

<!-- snippet: DocsSamplesForExplain.test.explain_boolean_combinations.approved.query.text -->
```text
explain
not done
(due before tomorrow) AND (is recurring)
```
<!-- endSnippet -->

在`2022-10-21`时，结果以以下内容开始：

<!-- snippet: DocsSamplesForExplain.test.explain_boolean_combinations.approved.explanation.text -->
```text
Explanation of this Tasks code block query:

  not done

  (due before tomorrow) AND (is recurring) =>
    AND (All of):
      due before tomorrow =>
        due date is before 2022-10-22 (Saturday 22nd October 2022)
      is recurring
```
<!-- endSnippet -->

### 显示更复杂的组合

对于复杂的布尔过滤器组合，即使使用[[Line Continuations|行继续]]来提高可读性，也很容易将括号放在错误的位置。

使用`explain`，解释的逻辑很容易看到。

例如，当以下文本放在tasks查询块中时：

<!-- snippet: DocsSamplesForExplain.test.explain_nested_boolean_combinations.approved.query.text -->
```text
explain
(                                                                                       \
    (description includes 1) AND (description includes 2) AND (description includes 3)  \
) OR (                                                                                  \
    (description includes 5) AND (description includes 6) AND (description includes 7)  \
)                                                                                       \
AND NOT (description includes 7)
```
<!-- endSnippet -->

在`2022-10-21`时，结果以以下内容开始：

<!-- snippet: DocsSamplesForExplain.test.explain_nested_boolean_combinations.approved.explanation.text -->
```text
Explanation of this Tasks code block query:

  (                                                                                       \
      (description includes 1) AND (description includes 2) AND (description includes 3)  \
  ) OR (                                                                                  \
      (description includes 5) AND (description includes 6) AND (description includes 7)  \
  )                                                                                       \
  AND NOT (description includes 7)
   =>
  ( (description includes 1) AND (description includes 2) AND (description includes 3) ) OR ( (description includes 5) AND (description includes 6) AND (description includes 7) ) AND NOT (description includes 7) =>
    OR (At least one of):
      AND (All of):
        description includes 1
        description includes 2
        description includes 3
      AND (All of):
        AND (All of):
          description includes 5
          description includes 6
          description includes 7
        NOT:
          description includes 7
```
<!-- endSnippet -->

## 高级示例

### 显示全局查询

> [!released]
全局查询设置在Tasks 3.5.0中添加。

例如，使用这个[[Global Query|全局查询]]：

<!-- snippet: DocsSamplesForExplain.test.explain_example_global_query.approved.query.text -->
```text
limit 50
heading includes tasks
```
<!-- endSnippet -->

当以下文本放在tasks查询块中时：

<!-- snippet: DocsSamplesForExplain.test.explain_explains_task_block_with_global_query_active.approved.query.text -->
```text
not done
due next week
explain
```
<!-- endSnippet -->

在`2022-10-21`时，结果以以下内容开始：

<!-- snippet: DocsSamplesForExplain.test.explain_explains_task_block_with_global_query_active.approved.explanation.text -->
```text
Explanation of the global query:

  heading includes tasks

  At most 50 tasks.

Explanation of this Tasks code block query:

  not done

  due next week =>
    due date is between:
      2022-10-24 (Monday 24th October 2022) and
      2022-10-30 (Sunday 30th October 2022) inclusive
```
<!-- endSnippet -->

### 显示查询文件默认值

> [!released]
> [[Query File Defaults|查询文件默认值]]功能在Tasks 7.15.0中引入。

> [!info]- 什么是查询文件默认值？
> 您可以使用[[Query File Defaults|查询文件默认值]]功能通过在查询文件的前言中添加某些预定义的属性值来修改Tasks搜索。
>
> 例如，将`TQ_short_mode`设置为`true`会使Tasks在查询开头插入以下行：
>
> ```text
> short mode
> ```

考虑这个Markdown笔记：

<!-- placeholder to force blank line before included text --><!-- include: DocsSamplesForExplain.test.explain_query_file_defaults_file_content.approved.md -->

````text
---
TQ_extra_instructions: |-
  folder includes {{query.file.folder}}
  not done
TQ_short_mode: true
TQ_show_tree: true
---

```tasks
explain
```
````

<!-- placeholder to force blank line after included text --><!-- endInclude -->

Tasks结果将以以下内容开始：

<!-- snippet: DocsSamplesForExplain.test.explain_query_file_defaults_explanation.approved.explanation.text -->
```text
Explanation of the Query File Defaults (from properties/frontmatter in the query's file):

  folder includes {{query.file.folder}} =>
  folder includes Test Data/

  not done

  short mode

  show tree

Explanation of this Tasks code block query:

  No filters supplied. All tasks will match the query.
```
<!-- endSnippet -->

### 占位符值被展开

> [!released]
> 占位符在Tasks 4.7.0中引入。

例如，当以下包含[[Placeholders|占位符]]中[[Query Properties|查询属性]]的查询放在文件`some/sample/file path.md`的tasks查询块中时：

<!-- snippet: DocsSamplesForExplain.test.explain_placeholders.approved.query.text -->
```text
explain
path includes {{query.file.path}}
path includes {{query.file.pathWithoutExtension}}
root includes {{query.file.root}}
folder includes {{query.file.folder}}
filename includes {{query.file.filename}}
filename includes {{query.file.filenameWithoutExtension}}

description includes Some Cryptic String {{! Inline comments are removed before search }}
```
<!-- endSnippet -->

结果以以下内容开始：

<!-- snippet: DocsSamplesForExplain.test.explain_placeholders.approved.explanation.text -->
```text
Explanation of this Tasks code block query:

  path includes {{query.file.path}} =>
  path includes some/sample/file path.md

  path includes {{query.file.pathWithoutExtension}} =>
  path includes some/sample/file path

  root includes {{query.file.root}} =>
  root includes some/

  folder includes {{query.file.folder}} =>
  folder includes some/sample/

  filename includes {{query.file.filename}} =>
  filename includes file path.md

  filename includes {{query.file.filenameWithoutExtension}} =>
  filename includes file path

  description includes Some Cryptic String {{! Inline comments are removed before search }} =>
  description includes Some Cryptic String
```
<!-- endSnippet -->

## 样式化解释结果

### 默认样式

为了可读性，解释以固定宽度字体（`PRE`块）显示，如果文本对于屏幕来说太宽，会显示水平滚动条。否则，测试显示解释在小屏幕设备上将无法使用。

### 自定义结果

使用[Obsidian中的CSS片段](https://help.obsidian.md/How+to/Add+custom+styles#Use+Themes+and+or+CSS+snippets)，我们可以更改解释块的外观。

例如，[这个CSS片段](https://github.com/obsidian-tasks-group/obsidian-tasks/blob/main/resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-explain-text-blue.css) `tasks-plugin-explain-text-blue.css`使解释块文本变为蓝色：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-explain-text-blue.css -->
```css
/* Make the Tasks plugin's 'explain' output stand out in blue */
.plugin-tasks-query-explanation {
    color: var(--color-blue);
}
```
<!-- endSnippet -->
