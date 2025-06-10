---
title: 替换自身 (Replace Self)
description: 替换自身按钮动作参考文档。
---

此按钮动作用纯文本或Templater模板替换按钮本身。

这仅适用于代码块中的按钮，因此此动作不适用于不在 `meta-bind` 代码块内的内联按钮。

```ts
interface ReplaceSelfButtonAction {
	type: 'replaceSelf';
	replacement: string; // 用于替换按钮的字符串或Templater模板路径
	templater?: boolean; // 如果为true，替换内容是Templater模板
}
```

### 示例

此按钮在点击时将自己替换为文本 `我不再是按钮了 :(`。

````custom_markdown {5-6}
```meta-bind-button
style: primary
label: 替换自身
action:
  type: "replaceSelf"
  replacement: "我不再是按钮了 :("
```
````