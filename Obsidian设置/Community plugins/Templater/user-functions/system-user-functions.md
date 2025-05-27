---
key: value
---
# 系统命令用户函数

这种类型的用户函数允许您执行系统命令并获取其输出。

系统命令用户函数需要在Templater的设置中启用。

## 定义系统命令用户函数

要定义新的系统命令用户函数，您需要定义一个**函数名称**，与一个**系统命令**关联。

为此，请转到插件的设置并点击`添加用户函数`。

完成后，[Templater](https://github.com/SilentVoid13/Templater)将创建一个以您定义的名称命名的用户函数，该函数将执行您的系统命令并返回其输出。

就像内部函数一样，用户函数在`tp` JavaScript对象下可用，更具体地说在`tp.user`对象下。

![user_templates](../imgs/templater_user_templates.png)

## 函数参数

您可以向用户函数传递可选参数。它们必须作为包含属性及其相应值的单个JavaScript对象传递：`{arg1: value1, arg2: value2, ...}`。

这些参数将以[环境变量](https://en.wikipedia.org/wiki/Environment_variable)的形式提供给您的程序/脚本。

在我们之前的示例中，这将给出以下命令声明：`<% tp.user.echo({a: "value 1", b: "value 2"})`。

如果我们的系统命令调用bash脚本，我们将能够使用`$a`和`$b`访问变量`a`和`b`。

## 系统命令中的内部函数

您可以在系统命令中使用内部函数。内部函数将在执行系统命令之前被替换。

例如，如果您配置了系统命令`cat <% tp.file.path() %>`，它将在执行系统命令之前被替换为`cat /path/to/file`。