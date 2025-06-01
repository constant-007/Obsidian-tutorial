---
publish: true
---

# 占位符

<span class="related-pages">#feature/scripting</span>

> [!released]
> 占位符在Tasks 4.7.0中引入。

## 总结

- Tasks提供占位符功能，使过滤器能够访问查询文件的位置。
- 任何在一对`{{`和`}}`字符串内的已知属性都会被扩展为从查询文件路径获得的值。
- 例如：
  - `{{query.file.path}}`可能被扩展为
  - `some/sample/actions on my hobby.md` - 对于该文件内的任何Tasks查询。
- 占位符中可用的值列在[[Query Properties|查询属性]]中。
- 占位符还提供编写[[Comments#Inline comments|内联注释]]的能力。

## 检查占位符值

[[Explaining Queries|explain]]指令显示查询中任何占位符是如何被解释的。这可以用来理解占位符一般是如何扩展的。

例如，当在文件`some/sample/file path.md`中的tasks查询块中放置以下带有[[Placeholders|占位符]]中[[Query Properties|查询属性]]的查询时：

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

结果以以下内容开始，展示了`{{...}}`内的每个值是如何被扩展的：

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

## 在占位符中使用查询属性

> [!released]
> 在占位符中使用Obsidian属性在Tasks 7.15.0中引入。

现在可以使用查询文件中的属性。请参阅[[Obsidian Properties#Using Query Properties in Searches|在搜索中使用查询属性]]

## 使用preset.xxx

您可以执行以下操作：

```text
{{preset.my_snippet_from_settings}}
```

另请参阅[[Presets|预设]]。

## 错误检查：无效变量

如果占位符中有任何未知属性，会写出清晰的消息。

例如，以下显示查询属性的名称是大小写敏感的：

<!-- snippet: DocsSamplesForExplain.test.explain_placeholders_error.approved.query.text -->
```text
# query.file.fileName is invalid, because of the capital N.
# query.file.filename is the correct property name.
filename includes {{query.file.fileName}}
```
<!-- endSnippet -->

...生成此输出：

```text
Tasks query: There was an error expanding one or more placeholders.

The error message was:
    Unknown property: query.file.fileName

The problem is in:
    filename includes {{query.file.fileName}}
```

%% ---------------------------------------------------------------------------
如果此文本发生更改，意味着上面的硬编码输出需要更新：

<!-- snippet: DocsSamplesForExplain.test.explain_placeholders_error.approved.explanation.text -->
```text
Explanation of this Tasks code block query:

Query has an error:
There was an error expanding one or more placeholders.

The error message was:
    Unknown property: query.file.fileName

The problem is in:
    filename includes {{query.file.fileName}}
```
<!-- endSnippet -->
--------------------------------------------------------------------------- %%

## 需要注意的事项

- 符号是大小写敏感的：
  - `query.file.fileName`不被识别
- 当在自定义过滤器和分组中使用占位符时，它们必须用引号包围。
  - 例如：`'{{query.file.folder}}'`

## 已知限制

- 它会抱怨注释中任何不被识别的占位符，即使注释随后被忽略。
- 允许在正则表达式中使用
  - 但由于正则表达式中[[Regular Expressions#Special characters|具有特殊含义的字符]]，不建议使用它们。

## 缺失功能

- 按今天的日期或时间搜索
- 从文件名获取日期字符串

## 技术详情

- 使用的模板库是[mustache.js](https://www.npmjs.com/package/mustache)。
- 通过[mustache-validator](https://www.npmjs.com/package/mustache-validator)实现错误检查以检测未知变量的使用。
