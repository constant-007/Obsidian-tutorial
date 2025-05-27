# 介绍

[Templater](https://github.com/SilentVoid13/Templater)是一种模板语言，允许您在笔记中插入**变量**和**函数**结果。它还可以让您执行JavaScript代码来操作这些变量和函数。

使用[Templater](https://github.com/SilentVoid13/Templater)，您将能够创建强大的模板来自动化手动任务。

## 快速示例

以下使用[Templater](https://github.com/SilentVoid13/Templater)语法的模板文件：

```javascript
---
创建日期: 2025-05-28 07:47
修改日期: Wednesday 28th May 2025 07:39:37
---

<< [[2025-05-27]] | [[2025-05-29]] >>

# system-user-functions

> [!quote] Setting goals is the first step in turning the invisible into the visible.
> — Tony Robbins
```

插入时将产生以下结果：

````
---
创建日期: 2021-01-07 17:20
修改日期: Thursday 7th January 2021 17:20:43
---

<< [[2021-04-08]] | [[2021-04-10]] >>

# Test Test

> Do the best you can until you know better. Then when you know better, do better.
> &mdash; <cite>Maya Angelou</cite>
````
