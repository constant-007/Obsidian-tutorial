# 用户函数

您可以在Templater中定义自己的函数。

有两种类型的用户函数可以使用：

- [脚本用户函数](./script-user-functions.md)
- [系统命令用户函数](./system-user-functions.md)

## 调用用户函数

您可以使用常用的函数调用语法调用用户函数：`tp.user.<user_function_name>()`，其中`<user_function_name>`是您定义的函数名称。

例如，如果您定义了一个名为`echo`的系统命令用户函数，完整的命令调用如下所示：

```js
<% tp.user.echo() %>
```

## 无移动端支持

目前，用户函数在Obsidian移动端上不可用。