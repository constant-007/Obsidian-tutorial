---
title: 按钮
description: 按钮教程，buttons 插件的精神继承者。
---

按钮就是...按钮，在您的笔记内。
它们可以配置为执行各种操作，如打开文件、运行命令，甚至运行 JavaScript 文件。

:::note
按钮动作的列表、其必需属性和示例可以在侧边栏的`参考 -> 按钮动作`下找到。
:::

## 创建按钮

:::tip
可以使用`Open Button Builder`命令轻松创建按钮。
:::

要创建按钮，您需要创建一个语言设置为`meta-bind-button`的代码块。
代码块内部属于按钮的 YAML 格式配置。

以下示例按钮显示`Meta Bind Help`并打开 meta bind FAQ 页面。

````custom_markdown
```meta-bind-button
style: primary
label: Meta Bind Help
action:
  type: command
  command: obsidian-meta-bind-plugin:mb-open-faq
```
````

## 内联按钮

内联按钮是与文本内联显示的按钮。
它们使用以`BUTTON`开头的内联代码块创建。
内联按钮必须通过匹配的 id 引用在**同一笔记**中其他地方定义的按钮代码块。

在插件设置的`Button Templates`下声明的按钮可以被每个笔记中的内联按钮引用。

以下示例内联按钮引用下面带有`help-button` id 的代码块按钮。
通过引用按钮代码块，内联按钮将具有与代码块按钮相同的配置。
可以通过将`hidden` YAML 属性设置为`true`来隐藏代码块按钮。

````custom_markdown "BUTTON[help-button]" {6}
Meta Bind 有一个插件内帮助页面。`BUTTON[help-button]` 这不是很酷吗？

```meta-bind-button
style: primary
label: Meta Bind Help
id: help-button
action:
  type: command
  command: obsidian-meta-bind-plugin:open-faq
```
````

## 按钮组

内联按钮可以在一行中显示多个按钮。
为此，需要将用逗号分隔的多个按钮 id 传递给`BUTTON`内联代码块。

以下示例显示了两个按钮的按钮组。

````custom_markdown "BUTTON[light-mode, dark-mode]" {6-7, 16-17}
主题切换器：`BUTTON[light-mode, dark-mode]`

```meta-bind-button
style: destructive
label: Light Mode
id: light-mode
hidden: true
actions:
  - type: command
    command: theme:use-light
```

```meta-bind-button
style: primary
label: Dark Mode
id: dark-mode
hidden: true
actions:
  - type: command
    command: theme:use-dark
```
````

## 按钮配置

### 按钮属性

按钮的 YAML 配置必须遵循以下 TypeScript 接口。

```ts
interface ButtonConfig {
	// 必需字段：
	// 按钮上显示的文本。
	label: string;
	// 按钮的样式。
	style: 'default' | 'primary' | 'destructive' | 'plain';

	// 可选字段：
	// 在按钮上显示的可选 lucide 图标。
	icon?: string;
	// 要添加到按钮的可选 CSS 类。多个类可以用空格分隔。
	class?: string;
	// 应用于按钮的可选 CSS 内联样式。
	cssStyle?: string;
	// 按钮背景图像的可选路径。
	backgroundImage?: string;
	// 悬停在按钮上时显示的可选工具提示。如果未设置，则使用标签。
	tooltip?: string;
	// 按钮的可选 id，用于在内联按钮中引用按钮。
	id?: string;
	// 是否应隐藏此按钮，在仅在内联按钮中使用按钮时很有用。
	hidden?: boolean;

	// 按钮动作：
	// 单击按钮时要执行的动作。
	action?: ButtonAction;
	// 可选择地，可以在单击按钮时执行多个动作。
	actions?: ButtonAction[];
}
```

`action`和`actions`是互斥的，意味着只能使用其中一个。

有关如何使用 CSS 类设置按钮样式的示例，请参阅[`样式和 CSS`](/obsidian-meta-bind-plugin-docs/guides/stylingandcss/#button-styling-example)页面。

## 按钮动作

按钮动作可能需要多个属性，具体取决于动作类型，但每个动作都有一个`type`属性，通过它来识别。

按钮动作及其必需属性的列表可以在侧边栏的`参考 -> 按钮动作`下找到。
