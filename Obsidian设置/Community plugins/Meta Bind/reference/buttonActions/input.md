---
title: 输入 (Input)
description: 输入按钮动作参考文档。
---

输入动作将文本插入到焦点元素的当前光标位置。

```ts
interface InputButtonAction {
	type: 'input';
	str: string; // 要插入的字符串
}
```

### 示例

此按钮打开命令面板并插入字符串 `help`。
结果是命令面板被打开，搜索栏中已经输入了 `help`。

````custom_markdown {7-8}
```meta-bind-button
style: primary
label: 帮助命令
actions:
  - type: command
    command: command-palette:open
  - type: input
    str: help
```
````