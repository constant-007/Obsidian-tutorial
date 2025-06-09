---
title: Meta Bind 嵌入
description: Meta Bind 嵌入教程。
---

Meta Bind 嵌入是一种在另一个笔记中嵌入笔记的方法，其工作方式与普通的 Obsidian 嵌入略有不同。

与 Meta Bind 的其他功能结合使用，它们允许您构建动态模板。
传统基于模板的方法的主要缺点是对模板的修改不会自动应用到使用该模板创建的所有笔记中。
另一方面，Meta Bind 嵌入会将对"模板"的更改立即传播到所有嵌入它的笔记中，因为"模板"文件在每次笔记渲染时都会被读取，而不是仅在创建笔记时读取一次。

## 与 Obsidian 嵌入的区别

假设您有一个名为`Note A`的笔记，您想将其嵌入到`Note B`中。

使用普通的 Obsidian 嵌入，您会在`Note B`中写`![[Note A]]`。
这会嵌入笔记，但它不是无缝的。
`Note A`的内容仍然认为它是`Note A`的一部分，而不是`NoteB`的一部分。
这意味着嵌入中的任何小组件，如[输入字段](/obsidian-meta-bind-plugin-docs/guides/inputfields)，将绑定到并更改`Note A`的前置元数据，而不是`Note B`的。

这就是 Meta Bind 嵌入的用武之地。
它们无缝地嵌入`Note A`并使其认为它是`Note B`的一部分。
意味着嵌入中的任何[输入字段](/obsidian-meta-bind-plugin-docs/guides/inputfields)将绑定到`Note B`而不是`Note A`。
这甚至延伸到其他插件添加的 markdown 装饰。

## 语法

Meta Bind 嵌入使用语言为`meta-bind-embed`的代码块创建。
代码块的内容是指向您要嵌入的笔记的单个链接。

以下示例在`Note B`中嵌入`Note A`。

````md
这是 Note B。

```meta-bind-embed
[[Note A]]
```
````
