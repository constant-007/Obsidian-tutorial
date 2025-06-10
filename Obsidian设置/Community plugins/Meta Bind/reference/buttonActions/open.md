---
title: 打开 (Open)
description: 打开按钮动作参考文档。
---

**打开** 动作打开文件或URL。

```ts
interface OpenButtonAction {
	type: 'open';
	link: string; // 要打开的文件链接 ([[file]]) 或URL (https://www.example.com)
	newTab?: boolean; // 是否在新标签页中打开链接
}
```

### 示例

此按钮在您的默认浏览器中打开Meta Bind文档。

````custom_markdown {5-6}
```meta-bind-button
style: primary
label: 打开Meta Bind文档
action:
  type: open
  link: https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/
```
````