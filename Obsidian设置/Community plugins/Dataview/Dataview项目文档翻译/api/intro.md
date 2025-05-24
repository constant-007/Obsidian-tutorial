# 概述

Dataview JavaScript API允许执行任意JavaScript，并可以访问dataview索引和查询引擎，这对于复杂视图或与其他插件的互操作性很有帮助。API有两种形式：面向插件的和面向用户的（或"内联API使用"）。

## 内联访问

您可以通过以下方式创建"DataviewJS"块：

~~~
```dataviewjs
dv.pages("#thing")...
```
~~~

在此类代码块中执行的代码可以访问`dv`变量，该变量提供了整个与代码块相关的dataview API（如`dv.table()`、`dv.pages()`等）。有关更多信息，请查看[代码块API参考](code-reference.md)。

## 插件访问

您可以通过`app.plugins.plugins.dataview.api`访问Dataview插件API（从其他插件或控制台）；此API与代码块参考类似，但由于缺少执行查询的隐式文件，参数略有不同。有关更多信息，请查看[插件API参考](code-reference.md)。
