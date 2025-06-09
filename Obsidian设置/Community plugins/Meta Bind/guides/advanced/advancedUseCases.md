---
title: 高级用例
description: 更高级用例的集合。
---

如果您愿意涉足 [JavaScript](https://developer.mozilla.org/en-US/docs/Learn/JavaScript) 的世界，您可以使用 Meta Bind 做很多有趣的事情。

:::note
以下示例假设您拥有：

1. 安装并启用 [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin)。
2. 在 Meta Bind 设置中启用 **JavaScript**。
:::

:::caution
我建议您在尝试使用这些示例之前熟悉 JavaScript。
如果您不小心，很容易创建无限循环或其他性能问题。
:::

## 性能考虑

使用 JavaScript 动态创建输入或视图字段可能会对性能产生影响，特别是如果您在整个笔记中都这样做。

## 使用 JavaScript 的动态绑定目标

您可以使用 JavaScript 根据另一个绑定目标的值动态更改绑定目标。

此示例演示如何使用选择输入来更改数字输入的绑定目标。
选择输入绑定到 `index` 变量，数字输入构造为绑定到 `list[index]` 变量。

````custom_markdown
---
list:
  - 1
  - 2
  - 3
index: 0
---

索引：`INPUT[inlineSelect(option(0), option(1), option(2)):index]`

```meta-bind-js-view
{index} as index
---
const str = `\`INPUT[number:list[${context.bound.index}]]\``;
return engine.markdown.create(str)
```
````

## 选择输入的动态选项

您也可以使用 JavaScript 动态更改选择输入的选项。

````custom_markdown
---
options:
  - "1"
  - "2"
  - "3"
selected: 1
---

选项：`INPUT[inlineList:options]`

```meta-bind-js-view
{options} as options
---
const options = context.bound.options.map(x => `option(${x})`).join(", ");
const str = `\`INPUT[inlineSelect(${options}):selected]\``;
return engine.markdown.create(str);
```
````

## 其他示例

GitHub 仓库[这里](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/tree/release/exampleVault/Advanced%20Examples)有其他高级示例。有另一个？请提交拉取请求。