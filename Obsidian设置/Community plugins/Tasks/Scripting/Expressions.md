---
publish: true
---

# 表达式

<span class="related-pages">#feature/scripting</span>

> [!released]
> 表达式在Tasks 4.0.0中引入。

## 简介

> [!Note]
> 编写JavaScript语言的完整解释超出了本文档的范围。
>
> 我们提供一些入门材料和一些经过深思熟虑的示例来给您启发，并鼓励您实验并亲自尝试该功能。

## 什么是表达式？

- 语言是JavaScript。
- 表达式是一个字符串指令。
- 从Tasks 4.4.0开始，可以使用变量、函数、`if`块和类似的构造。请参阅[[#更复杂的表达式]]。
- 从Tasks 5.0.0开始，由于[[Line Continuations|行连续]]，长表达式可以写成多行。
- 一个任务被传递给表达式，并执行计算。
  - 从Tasks 4.0.0开始，传入单个任务来实现[[Custom Grouping|自定义分组]]。
  - 从Tasks 4.2.0开始，传入单个任务来实现[[Custom Filters|自定义过滤器]]。
  - 从Tasks 6.0.0开始，传入单个任务来实现[[Custom Sorting|自定义排序]]。
- 然后Tasks从输入计算一个值。

## 示例表达式

表达式的真正价值在于从任务中的数据计算值。

在本节中，我们使用人为简单的固定表达式来演示可用的各种能力。

下面的每一行都是这种形式：

~~~text
表达式 => 结果
~~~

### 简单表达式

一些示例表达式：

<!-- placeholder to force blank line before included text --><!-- include: Expression.test.Expression_result.approved.md -->

~~~text
'hello' => 'hello'
"hello" => 'hello'
"" => ''
[] => []
"" || "No value" => 'No value'
false => false
true => true
1 => 1
0 => 0
0 || "No value" => 'No value'
1.0765456 => 1.0765456
6 * 7 => 42
["heading1", "heading2"] => ['heading1', 'heading2']
[1, 2] => [1, 2]
null => null
null || "No value" => 'No value'
undefined => undefined
undefined || "No value" => 'No value'
"I _am_ not _italic_".replaceAll("_", "\\_") => 'I \_am\_ not \_italic\_'
~~~

<!-- placeholder to force blank line after included text --><!-- endInclude -->

注意：

- 单引号（`'`）和双引号（`"`）通常是等价的，您可以使用您喜欢的任何一种。
- `||`表示"或"。如果`||`左边的表达式失败，则使用右边的表达式。
- 您可以通过将这些值添加到Tasks查询块中的`group by function`行来实验这些值。
- 如果您不写`return`语句，Tasks会为您添加一个。

### 更复杂的表达式

从Tasks 4.4.0开始，还可以在表达式中使用更复杂的构造：

- `return`语句
- 命名变量
- `if`语句
- 函数

从Tasks 5.0.0开始，还可以使用[[Line Continuations|行连续]]使较长的表达式更易读。

<!-- placeholder to force blank line before included text --><!-- include: Expression.test.Expression_returns_and_functions.approved.md -->

~~~text
return 42
=> 42

const x = 1 + 1; return x * x
=> 4

if (1 === 1) { return "yes"; } else { return "no" }
=> 'yes'

function f(value) {                 \
    if (value === 1 ) {             \
        return "yes";               \
    } else {                        \
        return "no";                \
    }                               \
}                                   \
return f(1);
=> 'yes'
~~~

<!-- placeholder to force blank line after included text --><!-- endInclude -->
