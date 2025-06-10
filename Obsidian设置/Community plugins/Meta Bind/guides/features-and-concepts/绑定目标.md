---
title: 绑定目标
description: Meta Bind 绑定目标教程。
---

绑定目标是 Meta Bind 的核心概念。
它们是基于文本的方式，用于将插件指向特定的前置元数据属性。
本教程将教您如何使用它们。

:::caution[限制]
绑定目标是**静态的**，意味着它们在创建后无法更改。

这意味着您**不能**拥有一个控制绑定目标指向何处的属性，除非使用 JavaScript。请参阅[高级示例](/obsidian-meta-bind-plugin-docs/guides/advancedusecases/)。
:::

## 语法

绑定目标由三个部分组成。

```meta-bind
storageType^storagePath#property
```

`storageType`和`storagePath`可以省略，导致它们默认为其默认值。

以下绑定目标将始终使用默认存储类型`frontmatter`，
意味着它指向前置元数据属性。

```meta-bind
storagePath#property
```

以下绑定目标将始终使用包含文件作为存储路径。
包含文件意味着绑定目标或字段所在的文件，即绑定目标是其一部分的文件。

```meta-bind
property

storageType^property
```

### 默认值示例

这意味着以下绑定目标是**等效的**，假设当前文件是`Test Note`。

```meta-bind
property

frontmatter^Test Note#property
```

### 1. 存储类型

存储类型告诉插件存储路径指向哪里。
有四种不同的存储类型。
默认值是`frontmatter`，如果您不指定存储类型，将使用它。

| 存储类型                | 描述                                                      |
| ----------------------- | --------------------------------------------------------- |
| `frontmatter`（默认）   | 存储路径指向文件，属性指向前置元数据字段。                 |
| `memory`                | 存储路径指向文件，属性指向内存字段。                       |
| `globalMemory`          | 不允许存储路径，属性指向内存字段。                         |
| `scope`                 | 不允许存储路径，属性扩展另一个绑定目标。                   |

#### `frontmatter`

这指的是 Obsidian 的前置元数据，它是文件顶部的 YAML 块。

#### `memory`

内存是一个**作用域**的内存存储，但不保存到任何文件。
这意味着您写入缓存中文件路径的值将在没有任何内容使用该文件路径一段时间后**丢失**，或者您重启 Obsidian 时丢失。

#### `globalMemory`

全局内存是一个**非作用域**的内存存储，不保存到任何文件。
全局内存在所有笔记之间共享，并且在您重启 Obsidian 时**将丢失**。

### 2. 存储路径

存储路径通常指向文件。
如果省略，默认为包含文件。
包含文件意味着绑定目标或字段所在的文件，即绑定目标是其一部分的文件。

#### 示例

让我们想象一下，我们在一个名为`Overview`的笔记中，我们希望我们的切换开关不改变这个笔记的完成状态，而是改变我们名为`Task A`的任务笔记的状态。
这也是可能的。我们只需要告诉插件在笔记`Task A`中更改`completed`。我们通过绑定到`Task A#completed`（`file_name#frontmatter_field`）来做到这一点。

输入字段声明现在看起来像这样。

```meta-bind "Task A#completed"
INPUT[toggle:Task A#completed]
```

如果您有多个同名的笔记，仅指定名称是不够的，因为插件无法确定您指的是哪一个。
在这种情况下，您需要指定相对于库根目录的完整路径。

```meta-bind "path/to/Task A#completed"
INPUT[toggle:path/to/Task A#completed]
```

### 3. 属性

属性是您要绑定到的字段的名称。
对于默认存储类型`frontmatter`，这是前置元数据属性的名称。

#### 带空格的属性和嵌套属性

插件使用类似 JavaScript 的语法来访问前置元数据。
这意味着为了绑定到带有特殊字符（如空格）的前置元数据字段，
您需要使用 JavaScript 的方括号语法。

这将**不**起作用。

```meta-bind "is completed"
INPUT[toggle:is completed]
```

但这将起作用。

```meta-bind '["is completed"]'
INPUT[toggle:["is completed"]]
```

要访问嵌套的前置元数据字段，您可以使用简单的`.`或方括号语法。
以下两个示例是**等效的**。

```meta-bind "this.is.nested"
INPUT[toggle:this.is.nested]
```

```meta-bind 'this["is"].nested'
INPUT[toggle:this["is"].nested]
```
