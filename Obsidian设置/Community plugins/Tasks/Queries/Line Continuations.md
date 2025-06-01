---
publish: true
---

# 行继续

> [!released]
>
> - 在Tasks 5.0.0中引入。
> - **重要**：此功能改变了查询行上最后反斜杠（`\`）字符的含义。请参阅下面的[[#Appendix Updating pre-5.0.0 searches with trailing backslashes|附录：更新带有尾随反斜杠的5.0.0之前的搜索]]来更新查询。

## 在查询中换行长行

在Tasks代码块中，**反斜杠（`\`）**是"行继续字符"。如果在行末放置反斜杠，该行被认为在下一行继续。

这对于将长查询分解为多行以提高可读性很有用。

例如这个查询：

<!-- snippet: DocsSamplesForExplain.test.explain_line_continuation_-_single_slash.approved.query.text -->
```text
(priority is highest) OR       \
    (priority is lowest)
explain
```
<!-- endSnippet -->

... 运行此搜索：

<!-- snippet: DocsSamplesForExplain.test.explain_line_continuation_-_single_slash.approved.explanation.text -->
```text
Explanation of this Tasks code block query:

  (priority is highest) OR       \
      (priority is lowest)
   =>
  (priority is highest) OR (priority is lowest) =>
    OR (At least one of):
      priority is highest
      priority is lowest
```
<!-- endSnippet -->

此功能对于长[[Combining Filters|组合过滤器]]、[[Custom Sorting|自定义排序]]和[[Custom Grouping|自定义分组]]行以及其他可能难以在一行上阅读的查询很有帮助。

在[[Grouping#Due Date|截止日期自定义分组示例]]的末尾有一些更现实的示例。

需要注意的要点：

- 要成为继续字符，`\`必须是行上的**最后一个字符**。
- 所有`\`及其周围的所有空白都被压缩为单个空格。
- 考虑缩进第二行和后续行，以便查询的结构立即清晰。
- 考虑对齐`\`字符以提高可读性。
- 如有疑问，添加`explain`指令来检查您的代码块是如何解释的。

## 需要尾随反斜杠的搜索

在Tasks代码块中，行末的**两个反斜杠（`\\`）**被视为**单个反斜杠**。

这使得在需要尾随反斜杠进行查询的罕见情况下可以进行搜索。

例如这个查询：

<!-- snippet: DocsSamplesForExplain.test.explain_line_continuation_-_double_slash.approved.query.text -->
```text
# Search for a single backslash:
description includes \\
explain
```
<!-- endSnippet -->

... 运行此搜索：

<!-- snippet: DocsSamplesForExplain.test.explain_line_continuation_-_double_slash.approved.explanation.text -->
```text
Explanation of this Tasks code block query:

  description includes \\ =>
  description includes \
```
<!-- endSnippet -->

需要注意的要点：

- 或者，您可以在尾随`\`后添加一个或多个空格以防止它成为继续字符。
  - 但这是有风险的，因为一些编辑器和linter会删除不必要的尾随空格。
  - 所以**两个反斜杠选项更安全**。
- 如有疑问，添加`explain`指令来检查您的代码块是如何解释的。

## 附录：更新带有尾随反斜杠的5.0.0之前的搜索

> [!Warning]
> 在Tasks 5.0.0中，查询行上**最后反斜杠（`\`）字符**的含义**从**：
>
> - `搜索反斜杠字符`
>
> **改为**：
>
> - `将下一个查询行连接到此行`
>
> 要保留以前的搜索行为，请在查询行末尾使用`\\`而不是`\`。
>
> 例如：
>
> | 旧指令                   | 改用此指令       |
> | --------------------------------- | ---------------------------------- |
> | `description includes something\` | `description includes something\\` |
>
> 有关详细信息，请参阅[[Line Continuations#Searches needing a trailing backslash|需要尾随反斜杠的搜索]]在[[Line Continuations|行继续]]中。
