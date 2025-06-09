---
title: Insert Into Note
description: Insert Into Note button action reference.
---

此动作在按钮所在笔记的指定行号处插入纯文本或Templater模板。

```ts
interface InsertIntoNoteButtonAction {
	type: 'insertIntoNote';
	line: number; // 插入文本的行号
	value: string; // 要插入的文本或Templater模板的路径
	templater?: boolean; // 如果为true，值是Templater模板的路径
}
```

如果 `templater` 为 `true`，`value` 字段被视为Templater模板的路径。
如果 `templater` 为 `false` 或未指定，`value` 字段被视为纯文本。

### 示例

此按钮在笔记的第3行插入文本 "Hello, world!"。

````custom_markdown {5-8}
```meta-bind-button
style: primary
label: Insert Into Note
action:
  type: insertIntoNote
  line: 3
  value: "Hello, world!"
  templater: false
```
````