---
title: 正则表达式替换笔记内容 (RegExp Replace In Note)
description: 正则表达式替换笔记内容按钮动作参考文档。
---

此按钮动作允许您对按钮所在的整个笔记进行搜索和替换。

```ts
interface RegexpReplaceInNoteButtonAction {
	type: 'replaceInNote';
	regexp: string; // 要搜索的正则表达式
	regexpFlags?: string; // 正则表达式标志，如果省略默认为 `g`
	replacement: string; // 替换文本
}
```

您可以在替换文本中使用 `$1`、`$2` 等来引用正则表达式中匹配的分组。

### 示例

此示例将每个 `TODO: ...` 行替换为 `TODO: ... - 已完成`。

````custom_markdown {5-7}
```meta-bind-button
style: primary
label: 正则表达式替换笔记内容
action:
  type: "regexpReplaceInNote"
  regexp: "^(TODO: .*)$"
  regexpFlags: "gm"
  replacement: "$1 - 已完成"
```
````