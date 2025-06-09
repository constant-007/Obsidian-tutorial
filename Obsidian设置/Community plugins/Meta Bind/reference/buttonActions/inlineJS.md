---
title: Run Inline JavaScript
description: Inline JS button action reference.
---

**内联JavaScript** 动作使用JS Engine插件运行提供的代码。

:::note
此功能需要满足以下条件：

1. 安装并启用 [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin) 插件。
2. 在Meta Bind设置中启用 **JavaScript**。
   :::

```ts
interface InlineJSButtonAction {
	type: 'inlineJS';
	code: string; // 要运行的代码
}
```

按钮配置在脚本中作为 **只读** 变量 `context.buttonConfig` 可用。
关于按钮的其他信息可在 `context.buttonContext` 对象中获取。
更多信息请参见 [Button Context](/obsidian-meta-bind-plugin-docs/api/interfaces/buttoncontext/)。

:::tip[多行字符串]

使用 [YAML多行字符串](https://yaml-multiline.info/)，您可以编写多行JavaScript代码。

:::

### 示例

此按钮将在控制台输出 `Hello World!`。

````custom_markdown {5-6}
```meta-bind-button
style: primary
label: Greet the World
action:
  type: inlineJS
  code: "console.log('Hello World!');"
```
````