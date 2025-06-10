---
title: 自定义 MathJS
description: 如何将自定义功能导入 mathjs 的示例
---

您可能会发现自己想要为[数学视图字段](/obsidian-meta-bind-plugin-docs/reference/viewfields/math/)添加功能。
由于它们内部使用 [mathjs](https://mathjs.org/)，您实际上可以做到这一点！

## 将新选项导入 mathJS

mathjs 库允许用户定义自己的函数和常量，如[他们的文档](https://mathjs.org/docs/core/extension.html)中所述。

为了利用这一点，Meta Bind 公开了其 mathjs 实例供您修改。
最合理的地方是在 [JS Engine 启动脚本](https://www.moritzjung.dev/obsidian-js-engine-plugin-docs/guides/startupscripts/)中。
这确保修改在早期加载，并在第一个文档开始渲染时立即可用。

:::caution
通过文档内的 `js-engine` 代码块修改 mathJS 可能会导致时序问题，不建议这样做！
:::

### 添加自定义函数 `clamp`

作为示例，我们将定义一个 `clamp()` 函数，它不是默认 mathJS 的一部分，但可能非常有用。
该函数应接受三个参数：当前值、最小值和最大值。只要当前值在范围内，它就返回当前值，否则返回边界值。

```js
clamp: (val, min, max) => Math.min(Math.max(min, val), max);
```

将此定义添加到存储在您的库中的 JavaScript 文件中，并启用该文件作为[启动脚本运行](https://www.moritzjung.dev/obsidian-js-engine-plugin-docs/guides/startupscripts/)。
在文件内，您可以使用 API 中的 `mathJSImport(dict, options)` 函数将您的定义导入到 mathjs 中。

```js
const mb = engine.getPlugin('obsidian-meta-bind-plugin').api;

mb.mathJSImport({
	// clamp 函数的定义
	clamp: (val, min, max) => Math.min(Math.max(min, val), max),

	// 我们也可以在这里定义有用的常量
	foo: 42,
});
```

现在您可以在视图字段中使用这个新定义的函数。
这个示例将始终显示 0 到 10 之间的值，即使 `num` 超出该范围。

```meta-bind
VIEW[clamp({num}, 0, 10)]
```

您也可以使用新常量 `foo`。以下示例将显示 `52`。

```meta-bind
VIEW[foo + 10]
```
