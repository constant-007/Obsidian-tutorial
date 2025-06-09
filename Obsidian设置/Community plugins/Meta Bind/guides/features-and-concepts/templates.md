---
title: 输入字段模板
description: Meta Bind 输入字段模板教程。
---

模板允许您在整个库中重用输入字段。
您可以在插件设置中指定它们。

## 使用模板

首先，我们需要在插件设置中创建一个模板。
让我们创建一个滑块模板，如下所示。

| 模板名称         | 模板字符串                                                |
| ---------------- | --------------------------------------------------------- |
| `sliderTemplate` | `INPUT[slider(addLabels, minValue(0), maxValue(10))]`    |

注意模板**没有**绑定到任何元数据。

要使用模板，我们打开一个笔记并编写以下内容。

```meta-bind
INPUT[templateName][overrides]
```

这里，`overrides`可能包含输入字段类型、参数和绑定目标。
如果您不想覆盖模板中的任何内容，它也可以为空。

例如，如果我们想为前置元数据中的某个`rating`使用`sliderTemplate`，我们会写：

```meta-bind
INPUT[sliderTemplate][:rating]
```

我们将`templateName`设置为`sliderTemplate`（告诉 meta-bind 使用我们之前创建的模板），在`overrides`中我们将输入字段绑定到前置元数据属性`rating`。
