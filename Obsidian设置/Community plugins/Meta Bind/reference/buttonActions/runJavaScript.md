---
title: 运行JavaScript文件 (Run JavaScript File)
description: 运行JavaScript文件按钮动作参考文档。
---

**运行JavaScript文件** 动作执行一个JavaScript文件。

:::note
此功能需要满足以下条件：

1. 安装并启用 [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin) 插件。
2. 在Meta Bind设置中启用 **JavaScript**。
   :::

```ts
interface JSButtonAction {
	type: 'js';
	file: string; // 要运行的JavaScript文件路径，相对于库根目录
	args?: Record<string, unknown>; // 传递给脚本的可选参数 (在脚本中可通过 `context.args` 访问)
}
```

按钮配置在脚本中作为 **只读** 变量 `context.buttonConfig` 可用。
关于按钮的其他信息可在 `context.buttonContext` 对象中获取。
更多信息请参见 [Button Context](/obsidian-meta-bind-plugin-docs/api/interfaces/buttoncontext/)。
参数通过 `context.args` 传递给脚本。

### 示例

````custom_markdown {5-6}
```meta-bind-button
style: primary
label: 运行JavaScript文件
action:
  type: js
  file: someScript.js
  args:
    greeting: "Meta Bind用户"
```
````

在库根目录下有以下 `someScript.js` 文件。

```js title="someScript.js"
console.log('Hello ${context.args.greeting}!');
```

当您点击按钮时，应该会在控制台看到打印的字符串 `Hello Meta Bind用户!`。