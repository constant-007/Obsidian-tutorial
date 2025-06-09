---
title: Command
description: Command button action reference.
---

**命令** 动作运行一个 Obsidian 命令。命令的 ID 可以使用 `Meta Bind: Select and copy command id` 命令找到。

```ts
interface CommandButtonAction {
	type: 'command';
	command: string; // 要运行的命令的 ID
}
```

### 示例

此按钮在 Obsidian 中打开 Meta Bind FAQ 页面。

````custom_markdown {5-6}
```meta-bind-button
style: primary
label: Meta Bind Help
action:
  type: command
  command: obsidian-meta-bind-plugin:open-faq
```
````