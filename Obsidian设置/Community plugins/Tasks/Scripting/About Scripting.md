---
publish: true
---

# 关于脚本编程

<span class="related-pages">#index-pages #feature/scripting</span>

## 简介

这是一套不断增长的文档的开始，旨在为您提供在Tasks中更精细地控制搜索的工具。

我们在这里非常宽泛地使用"脚本编程"这个词：

- 目前，它仅指在Tasks查询块中编写JavaScript表达式。
- 它旨在随着时间的推移发展成更广泛的功能。

## 占位符功能

- [[Placeholders|占位符]] - 在原生Tasks查询中使用占位符文本，例如`{{query.file.path}}`来引用包含查询的文件的某些属性。

## 脚本编程功能

- [[Custom Filters|自定义过滤器]] - 编写简短的JavaScript表达式来创建任务搜索过滤器。
  - 另请参阅[[Filters|过滤器]]文档中添加的许多`filter by function`示例。
- [[Custom Sorting|自定义排序]] - 编写简短的JavaScript表达式来对Tasks查询结果中的任务进行排序。
  - 另请参阅[[Sorting|排序]]文档中添加的许多`sort by function`示例。
- [[Custom Grouping|自定义分组]] - 编写简短的JavaScript表达式来在Tasks查询结果中创建任务组名称。
  - 另请参阅[[Grouping|分组]]文档中添加的许多`group by function`示例。

## 脚本编程参考

- [[Task Properties|任务属性]] - 所有可用的任务属性，例如`task.description`、`task.file.path`。
  - 注意：这些属性也在[[Quick Reference|快速参考]]中列出。
- [[Query Properties|查询属性]] - 所有可用的查询属性，例如`query.file.path`、`query.file.path` - 可通过[[Placeholders|占位符]]使用。
- [[Expressions|表达式]] - 关于JavaScript表达式如何工作的一些背景知识，用于Tasks代码块中。
