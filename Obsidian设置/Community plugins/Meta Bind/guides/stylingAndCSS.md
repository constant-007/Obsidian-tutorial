---
title: 样式和 CSS
description: 如何使用 CSS 样式化 Meta Bind。
---

要样式化各种 Meta Bind 元素，您需要编写自定义 [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)。
将自定义 CSS 加载到 Obsidian 的最简单方法是使用 [CSS 片段](https://help.obsidian.md/Extending+Obsidian/CSS+snippets)。

### 输入字段样式示例

假设我们想要将特定的进度条着色为红色。为此我们可以利用 class 参数。

首先我们创建带有 class 参数的进度条。在这个例子中，我们将特殊类命名为 `red-progress-bar`。

```meta-bind
INPUT[progressBar(class(red-progress-bar)):someProperty]
```

然后我们创建 [CSS 片段](https://help.obsidian.md/Extending+Obsidian/CSS+snippets)，使用选择器选择带有 `red-progress-bar` 类的进度条。
然后我们定位进度条的进度元素并将背景颜色设置为红色。

```css title="snippet.css" ".red-progress-bar"
.mb-input-type-progressBar.red-progress-bar .mb-progress-bar-progress {
	background: var(--color-red);
}
```

在某些情况下，您可能需要更高的[特异性](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity)来覆盖现有样式。在这种情况下，您可以使用 `!important` 标志。

```css title="snippet.css" ".red-progress-bar"
.mb-input-type-progressBar.red-progress-bar .mb-progress-bar-progress {
	background: var(--color-red) !important;
}
```

### 按钮样式示例

如果您想更改特定按钮的样式，可以为按钮指定 CSS 类，然后使用 CSS 片段定位它。

首先我们创建一个按钮并指定自定义类，在这个例子中是 `green-button`。

```yaml
style: primary
label: Open Meta Bind FAQ
class: green-button
action:
  type: command
  command: obsidian-meta-bind-plugin:open-faq
```

然后我们创建 [CSS 片段](https://help.obsidian.md/Extending+Obsidian/CSS+snippets)，使用选择器选择带有 `green-button` 类的 Meta Bind 按钮。
然后我们定位按钮元素本身并将其颜色设置为绿色。

```css title="snippet.css" ".green-button"
.mb-button.green-button > button {
	color: var(--color-green);
}
```

在某些情况下，您可能需要更高的[特异性](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity)来覆盖现有样式。在这种情况下，您可以使用 `!important` 标志。

```css title="snippet.css" ".green-button"
.mb-button.green-button > button {
	color: var(--color-green) !important;
}
```