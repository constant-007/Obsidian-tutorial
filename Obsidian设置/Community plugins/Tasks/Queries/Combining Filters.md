---
publish: true
---

# 组合过滤器

## 摘要

> [!released]
>
> - 在Tasks 1.9.0中引入。
> - 在Tasks 7.0.0中进行了重大改进：详情请参阅[[#附录 Tasks 7.0.0中布尔过滤器的变化]]。

Tasks提供的[[Filters|单个过滤器]]可以通过以下方式强大地组合在一起：

1. 将每个过滤器包装在分隔符中，如`(`和`)`，
2. 然后用布尔运算符如`AND`、`OR`和`NOT`连接它们。

例如：

````text
```tasks
not done
(due after yesterday) AND (due before in two weeks)
[tags include #inbox] OR [path includes Inbox] OR [heading includes Inbox]
```
````

上述tasks代码块中的3行每一行都代表一个单独的过滤器，只有匹配_所有_3个过滤器行的任务才会被显示。

## 语法

一个或多个过滤器可以通过布尔运算符在一行中组合在一起，创建一个新的、强大的、灵活的过滤器。

这是一个简单布尔指令组件的图表：

```text
+--------------------------+       +--------------------------+
|   ( tag includes #XX )   |  OR   |   ( tag includes #YY )   |
+--------------------------+       +--------------------------+
    ^                  ^               ^                  ^
    |                  |               |                  |
    +- 分隔符: () -+               +- 分隔符: () -+
      用于左子表达式                     用于右子表达式
              |                                  |
              +--------- 运算符: OR -----------+
                   连接两个子表达式
```

以下规则适用：

- 每个单独的过滤器必须被一对**分隔符字符**包围：
  - 本指南中最常用的分隔符是`(`和`)`。
  - 可用分隔符的完整列表是：
    - `(....)`
    - `[....]`
    - `{....}`
    - `"...."`
  - 在布尔指令中不能混合使用不同类型的分隔符：您必须为该行的过滤器选择合适的分隔符。
- 支持的**运算符**有：`AND`、`OR`、`NOT`、`AND NOT`、`OR NOT`和`XOR`。
  - 运算符区分大小写：必须大写。
  - 请参阅下面的[[#布尔运算符]]。
- 您可以使用更多分隔符将更多过滤器嵌套在一起。
- 可以使用**尾随反斜杠**（`\`）将长过滤器分成几行，如[[Line Continuations|行继续]]中所述。
- 每行组合的过滤器数量和括号嵌套级别没有实际限制。

建议：

- 当组合两个以上的过滤器时，自由使用`(`和`)`（或任何其他分隔符对）以确保您获得预期的逻辑。请参阅下面的[[#执行优先级]]。
- 请参阅[[#布尔过滤器故障排除]]以获取选择分隔符的帮助，特别是在使用`filter by function`时。

从技术上讲，行继续具有隐式的`AND`关系（因此完全保持向后兼容性），但现在一行可以有多个过滤器，用`AND`、`OR`、`NOT`、`AND NOT`、`OR NOT`和`XOR`以及括号组合。

### 执行优先级

运算符按以下顺序求值：

1. `NOT`
2. `XOR`
3. `AND`
4. `OR`

所以这两个过滤器完全等价 - 注意第二个中的额外括号：

````text
(tag includes #XX) OR (tag includes #YY) AND (tag includes #ZZ)
````

````text
(tag includes #XX) OR ( (tag includes #YY) AND (tag includes #ZZ) )
````

这两个也完全等价：

````text
(tag includes #XX) AND (tag includes #YY) OR (tag includes #ZZ)
````

````text
( (tag includes #XX) AND (tag includes #YY) ) OR (tag includes #ZZ)
````

在构建复杂的过滤器组合时，最安全的做法是自由使用`(`和`)`，这样您可以确信获得预期的行为。

## 布尔运算符

支持以下布尔运算符。

### AND

> 要求**每个**过滤器都匹配

当您使用`AND`组合过滤器时，只有匹配_每个_过滤器的任务才会显示。

例如，这将显示包含单词`some`且有开始日期的任务：

````text
(has start date) AND (description includes some)
````

Tasks要求匹配每个过滤器行，所以上面的例子等价于：

````text
has start date
description includes some
````

`AND`在与`OR`和`NOT`结合使用时变得特别有价值。

**注意**：在对话中，这样的请求：

> 显示路径中包含`inbox`的文件中的任务_和_带有标签`#inbox`的任务

... 通常意味着显示满足_任一_条件的任务，因此在布尔逻辑中必须用`OR`表示。

### OR

> 要求**任何**过滤器匹配

当您使用`OR`组合过滤器时，匹配_至少一个_过滤器的任务将被显示。

例如，要显示路径中包含`inbox`的文件中的任务以及任务行上有标签`#inbox`的任务：

````text
```tasks
not done
(path includes inbox) OR (description includes #inbox)
```
````

### NOT

> 要求过滤器**不**匹配

对于一个简单的例子，这两个是等价的：

````text
path does not include inbox
````

````text
NOT (path includes inbox)
````

---

`NOT`对于否定更复杂的表达式更有用。

对于一个更现实的例子，这个的反面：

````text
(path includes x) OR (description includes #x)
````

... 可以这样表达，无需检查任何新逻辑：

```text
NOT ( (path includes x) OR (description includes #x) )
```

另一种表达方式需要更多的小心和思考：

````text
(path does not include x) AND (description does not include #x)
````

### AND NOT

> 要求第一个过滤器匹配，同时第二个过滤器不匹配

例如：

````text
(has start date) AND NOT (description includes some)
````

### OR NOT

> 要求第一个过滤器匹配，或者第二个过滤器不匹配。

For example:

````text
(has start date) OR NOT (description includes special)
````

### XOR

> 要求两个过滤器中**只有一个**匹配

`XOR`，或`异或`显示只匹配提供的条件中_一个_的任务。

例如，要显示任务：

- 要么在路径中包含`inbox`的文件中
- 要么任务行上有标签`#inbox`
- 但不能两者都有：

````text
```tasks
not done
(path includes inbox) XOR (description includes #inbox)
```
````

它不会显示路径中既有`inbox`又在任务行中有标签`#inbox`的任务。

> [!warning]
> 不要将两个以上的过滤器与`XOR`组合，意图要求只有其中一个为真。
> 它不会给出您期望的结果。

`(filter a) XOR (filter b) XOR (filter c)`匹配只匹配其中一个过滤器的任务，**以及匹配所有三个过滤器的任务**。

## Delimiters

The following delimiter characters are available:

- `(....)`
- `[....]`
- `{....}`
- `"...."`

> [!Important]
> Each Boolean instruction line must use only one delimiter type.

This is valid:

```text
(not done) AND (is recurring)
```

This is not valid:

```text
(not done) AND {is recurring}
```

## Troubleshooting Boolean Filters

This section shows the typical solutions to a few error messages that may occur when using Boolean Filters.

### Error: malformed boolean query -- Invalid token

#### Cause: Text filter sub-expression ends with closing delimiter

The full error message is:

`malformed boolean query -- Invalid token (check the documentation for guidelines)`

> [!error] Broken query
> `(description includes (maybe)) OR (description includes (perhaps))`

How to fix the query:

> [!Info] Use a different delimiter
> `[description includes (maybe)] OR [description includes (perhaps)]`

This is why Tasks offers a choice of [[#Delimiters|delimiters]] around sub-expressions.

#### Spotting malformed boolean query problems - with built-in filters

Here is the bulk of the error text for the above broken query:

```text
Tasks query: Could not interpret the following instruction as a Boolean combination:
    (description includes (maybe)) OR (description includes (perhaps))

The error message is:
    malformed boolean query -- Invalid token (check the documentation for guidelines)

The instruction was converted to the following simplified line:
    (f1)) OR (f2))

Where the sub-expressions in the simplified line are:
    'f1': 'description includes (maybe'
        => OK
    'f2': 'description includes (perhaps'
        => OK
```

> [!tip] Points to note in the above output:
>
> 1. The mismatched brackets in the simplified line: `(f1)) OR (f2))`
> 2. The missing closing `)` in the sub-expressions:
>     - `'f1': 'description includes (maybe'`
>     - `'f2': 'description includes (perhaps'`

#### Cause: 'filter by function' sub-expression ends with closing delimiter

> [!error] Broken query
>
> ```text
> (filter by function task.tags.join(',').toUpperCase().includes('#XX')) AND \
> (filter by function task.tags.join(',').toUpperCase().includes('#YY')) AND \
> (filter by function task.tags.join(',').toUpperCase().includes('#ZZ'))
> ```

We have several options:

> [!info] Option 1: use a different delimiter
>
> ```text
> [filter by function task.tags.join(',').toUpperCase().includes('#XX')] AND \
> [filter by function task.tags.join(',').toUpperCase().includes('#YY')] AND \
> [filter by function task.tags.join(',').toUpperCase().includes('#ZZ')]
> ```

We can choose any one of the available [[#Delimiters|delimiter sets]], so long as we use the same delimiters for all sub-expressions on the line.

Above, we adjusted the query to use `[....]` instead of `(....)`, as we know that none of our sub-expressions ends with a `]`.

> [!info] Option 2: add semicolons to filter by function
>
> ```text
> (filter by function task.tags.join(',').toUpperCase().includes('#XX'); ) AND \
> (filter by function task.tags.join(',').toUpperCase().includes('#YY'); ) AND \
> (filter by function task.tags.join(',').toUpperCase().includes('#ZZ'); )
> ```

Above, we added a semicolon (`;`) at the end of each sub-expression, to put non-space character between the `)` in the `filter by function` expression and the closing Boolean delimter `)`.

> [!info] Option 3: port the Boolean logic to JavaScript
>
> ```text
> filter by function \
>     task.tags.join(',').toUpperCase().includes('#XX') && \
>     task.tags.join(',').toUpperCase().includes('#YY') && \
>     task.tags.join(',').toUpperCase().includes('#ZZ')
> ```

Above, we migrated the Boolean operators to JavaScript ones instead.

| Task Operator | JavaScript operator |
| ------------- | ------------------- |
| `AND`         | `&&`                |
| `OR`          | <code>\|\|</code>   |
| `NOT`         | `!`                 |

#### Spotting malformed boolean query problems - with 'filter by function'

Here is the bulk of the error text for the above broken query:

```text
Tasks query: Could not interpret the following instruction as a Boolean combination:
    (filter by function task.tags.join(',').toUpperCase().includes('#XX')) AND (filter by function task.tags.join(',').toUpperCase().includes('#YY')) AND (filter by function task.tags.join(',').toUpperCase().includes('#ZZ'))

The error message is:
    malformed boolean query -- Invalid token (check the documentation for guidelines)

The instruction was converted to the following simplified line:
    (f1)) AND (f2)) AND (f3))

Where the sub-expressions in the simplified line are:
    'f1': 'filter by function task.tags.join(',').toUpperCase().includes('#XX''
        => ERROR:
           Error: Failed parsing expression "task.tags.join(',').toUpperCase().includes('#XX'".
           The error message was:
           "SyntaxError: missing ) after argument list"
    'f2': 'filter by function task.tags.join(',').toUpperCase().includes('#YY''
        => ERROR:
           Error: Failed parsing expression "task.tags.join(',').toUpperCase().includes('#YY'".
           The error message was:
           "SyntaxError: missing ) after argument list"
    'f3': 'filter by function task.tags.join(',').toUpperCase().includes('#ZZ''
        => ERROR:
           Error: Failed parsing expression "task.tags.join(',').toUpperCase().includes('#ZZ'".
           The error message was:
           "SyntaxError: missing ) after argument list"
```

> [!tip] Points to note in the above output:
>
> 1. The mismatched brackets in the simplified line: `(f1)) AND (f2)) AND (f3))`
> 2. The missing closing `)` in the sub-expressions:
>     - `'f1': 'filter by function task.tags.join(',').toUpperCase().includes('#XX''`
>     - `'f2': 'filter by function task.tags.join(',').toUpperCase().includes('#YY''`
>     - `'f3': 'filter by function task.tags.join(',').toUpperCase().includes('#ZZ''`
> 3. The error messages, including:
>     - `"SyntaxError: missing ) after argument list"`

### Error: All filters in a Boolean instruction must be inside one of these pairs of delimiter characters

The full message is:

`All filters in a Boolean instruction must be inside one of these pairs of delimiter characters: (...) or [...] or {...} or "...". Combinations of those delimiters are no longer supported.`

#### Cause: Mismatched delimiter types

> [!error] Broken query
> `"not done" AND (is recurring)`

How to fix the query:

> [!Info] Fix: Make the delimiters consistent
> `(not done) AND (is recurring)`

The full output includes:

```text
Tasks query: Could not interpret the following instruction as a Boolean combination:
    "not done" AND (is recurring)

The error message is:
    All filters in a Boolean instruction must be inside one of these pairs of delimiter characters: (...) or [...] or {...} or "...". Combinations of those delimiters are no longer supported.
Problem line: ""not done" AND (is recurring)"
```

## Examples

### Managing tasks via file path and tag

I have tasks for People in our weekly meeting notes and then I might reference a tag using their name in other notes:

````text
```tasks
not done
(path includes Peter) OR (tags includes #Peter)
```
````

### Finding tasks that are waiting

I want to find tasks that are waiting for something else. But 'waiting' can be spelled in several different ways:

````text
```tasks
not done
(description includes waiting) OR \
  (description includes waits) OR \
  (description includes wartet)
```
````

### Daily notes tasks, for days other than today

I want to see tasks from anywhere in my vault with the tag `#DailyNote` or tasks in my daily notes folder, but NOT tasks in today's daily note.

````text
```tasks
not done
(tags include #DailyNote) OR \
( (path includes daily/Notes/Folder/) AND \
  (path does not include 2022-07-11) \
)
```
````

See [[Daily Agenda]] for how to use templates
to embed dates in to daily notes.

### Combined GTD Contexts

Suppose you use "Getting Things Done"-style `#context` tags to say where a task can be done, so that when you are in a particular location, you can
find all the things you could choose to do.

And suppose that several of these locations are close by each other, so when you are in one place, you can easily do things in any of the other places.

#### In One of Several Locations

You could select any of the nearby locations with:

````text
# Show all tasks I CAN do in this area:
(tags include #context/loc1) OR \
  (tags include #context/loc2) OR \
  (tags include #context/loc3)
````

#### In None of Several Locations

Now suppose you would like to review all the other tasks, that you cannot do in the location, for some reason.

An easy way to review all the _other_ tasks not possible in this area would be to use `NOT( )` around the original query:

````text
# Show all tasks I CANNOT do in this area - EASY WAY:
NOT ( \
  (tags include #context/loc1) OR \
  (tags include #context/loc2) OR \
  (tags include #context/loc3) \
)
````

The nice thing about the above `NOT` use is that if a new context gets added to the group in the future, it can be added to both task blocks via a simple find-and-replace.

The above is much easier to maintain than the other option of:

- Changing all the `includes` to `does not include`
- Changing all the `OR` to `AND`

````text
# Show all tasks I CANNOT do in this area - HARDER WAY
(tags do not include #context/loc1) AND \
  (tags do not include #context/loc2) AND \
  (tags do not include #context/loc3)
````

## Appendix: Changes to Boolean filters in Tasks 7.0.0

Tasks 7.0.0 involved a tremendous amount of work behind the scenes to improve the behaviour and usability of Boolean filters.

This section describes the changes, for completeness.

### Mixing of delimiter types is no longer allowed

> [!Danger] Breaking change
> This (undocumented) mixing of delimiter types used to be a valid query, prior to Tasks 7.0.0:
>
> ```text
> (not done) AND "is recurring"
> ```

It is no longer valid, as mixing of [[#Delimiters|delimiter types]] in a Boolean instruction is no longer allowed.

It may be fixed by changing it to use consistent delimiters, for example with one of these:

```text
(not done) AND (is recurring)
"not done" AND "is recurring"
```

### Sub-expressions can now contain parentheses and double-quotes

Sub-expressions can now contain parentheses - `(` and `)` and double-quotes - `"`.

See [[#Troubleshooting Boolean Filters]] for how to deal with sub-expressions that end with the closing delimiter character.

### More options for delimiting sub-expressions

The following delimiter characters are available:

- `(....)`
- `[....]`
- `{....}`
- `"...."`

See [[#Delimiters]] above.

### Spaces around Operators are now optional

Spaces around Operators are now optional.

For example, before Tasks 7.0.0 the following was invalid, as there were no spaces `AND`.

`(path includes a)AND(path includes b)`

Tasks now adds the missing spaces behind the scenes, so the above is now equivalent to:

`(path includes a) AND (path includes b)`

### Much better assistance with errors

A lot of effort went in to giving useful information if a Boolean instruction is invalid.

Before:

```text
Tasks query: malformed boolean query -- Invalid token (check the documentation for guidelines)
Problem line: "(description includes (maybe)) OR (description includes (perhaps))"
```

After:

```text
Tasks query: Could not interpret the following instruction as a Boolean combination:
    (description includes (maybe)) OR (description includes (perhaps))

The error message is:
    malformed boolean query -- Invalid token (check the documentation for guidelines)

The instruction was converted to the following simplified line:
    (f1)) OR (f2))

Where the sub-expressions in the simplified line are:
    'f1': 'description includes (maybe'
        => OK
    'f2': 'description includes (perhaps'
        => OK

For help, see:
    https://publish.obsidian.md/tasks/Queries/Combining+Filters

Problem line: "(description includes (maybe)) OR (description includes (perhaps))"
```
