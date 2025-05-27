# 脚本用户函数

这种类型的用户函数允许您从JavaScript文件调用JavaScript函数并获取其输出。

要使用脚本用户函数，您需要在Templater的设置中指定一个脚本文件夹。此文件夹需要从您的vault中可访问。

## 定义脚本用户函数

假设您在Templater的设置中指定了`Scripts`文件夹作为脚本文件夹。

Templater将加载`Scripts`文件夹中的所有JavaScript（`.js`文件）脚本。

然后您可以创建名为`Scripts/my_script.js`的脚本（需要`.js`扩展名）。由于Obsidian只创建markdown文件，您可能需要在Obsidian外部创建该文件。

然后您将能够将脚本作为用户函数调用。函数名称对应于脚本文件名。

脚本应遵循[CommonJS模块规范](https://flaviocopes.com/commonjs/)，并导出单个函数。

```javascript
function my_function (msg) {
    return `来自我的脚本的消息：${msg}`;
}
module.exports = my_function;
```

在此示例中，完整的命令调用如下所示：

```javascript
<% tp.user.my_script("Hello World!") %>
```

这将输出`来自我的脚本的消息：Hello World!`。

## 全局命名空间

在脚本用户函数中，您仍然可以访问全局命名空间变量，如`app`或`moment`。

但是，您无法访问模板引擎作用域变量，如`tp`或`tR`。如果您想使用它们，必须将它们作为函数的参数传递。

## 函数参数

根据您定义函数的方式，您可以向函数传递任意数量的参数。

例如，您可以将`tp`对象传递给函数，以便能够使用Templater的所有[内部变量/函数](../internal-variables-functions/overview.md)：`<% tp.user.<user_function_name>(tp) %>`

## 用户脚本文档

您可以选择在方法文件的**顶部**使用[TSDoc标准](https://tsdoc.org/)记录脚本的功能。如果提供，这将为您的用户脚本提供类似智能感知的体验，类似于其他templater函数的体验。

### 带文档的用户脚本示例

```javascript
/**
 * 这做了一些很酷的事情
 */
function doSomething() {
    console.log('某些事情已完成')
}

module.exports = doSomething;
```
