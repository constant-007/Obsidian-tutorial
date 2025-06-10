---
title: 延时 (Sleep)
description: 延时按钮动作参考文档。
---

**延时** 动作等待指定的时间。

```ts
interface SleepButtonAction {
	type: 'sleep';
	ms: number; // 等待时间，以毫秒为单位
}
```

### 示例

此按钮将打开命令面板，等待1秒，然后在搜索框中输入 `help`。

````custom_markdown {7-8}
```meta-bind-button
style: primary
label: 延时示例
actions:
  - type: command
    command: command-palette:open
  - type: sleep
    ms: 1000
  - type: input
    str: help
```
````