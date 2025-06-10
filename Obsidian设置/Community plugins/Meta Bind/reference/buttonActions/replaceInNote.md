---
title: 替换笔记内容 (Replace In Note)
description: 替换笔记内容按钮动作参考文档。
---

此按钮动作允许您用新文本或Templater模板替换当前笔记中的指定行范围。

```ts
interface ReplaceInNoteButtonAction {
	type: 'replaceInNote';
	fromLine: number; // 开始替换的行号 (基于1的索引)
	toLine: number; // 停止替换的行号 (基于1的索引)
	replacement: string; // 替换文本或替换Templater模板的路径
	templater?: boolean; // 替换内容是否为Templater模板
}
```

如果 `templater` 为 `true`，`replacement` 字段被视为Templater模板的路径。
如果 `templater` 为 `false` 或未指定，`replacement` 字段被视为纯文本。

### 示例

此示例将当前笔记的第3-5行替换为以下文本。

```markdown
一些
文本
内容
```

````custom_markdown {5-8}
```meta-bind-button
style: primary
label: 替换笔记内容
action:
  type: "replaceInNote"
  fromLine: 3
  toLine: 5
  replacement: "一些\n文本\n内容"
```
````