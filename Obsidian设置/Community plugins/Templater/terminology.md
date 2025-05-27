# 术语说明

要理解[Templater](https://github.com/SilentVoid13/Templater)的工作原理，让我们先定义几个术语：

- **模板**是包含**[命令](./commands/overview.md)**的文件。
- 以开始标签`开头，以结束标签`结尾的文本片段被称为**[命令](./commands/overview.md)**。
- **函数**是一个可以在**命令**内调用并返回值（替换字符串）的对象

有两种类型的函数可以使用：

- [内部函数](./internal-functions/overview.md)。这些是插件内置的**预定义**函数。例如，`tp.date.now`是一个返回当前日期的内部函数。
- [用户函数](./user-functions/overview.md)。用户可以定义自己的函数。它们可以是[系统命令](./user-functions/system-user-functions.md)或[用户脚本](./user-functions/script-user-functions.md)。

### 示例

以下模板包含2个命令，调用了2个不同的内部函数：

```
昨天：2025-05-27
明天：2025-05-29
```

在下一部分中，我们将了解编写命令所需的语法。
