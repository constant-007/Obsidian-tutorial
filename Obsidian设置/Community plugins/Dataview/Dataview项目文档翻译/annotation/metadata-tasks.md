# 任务和列表上的元数据

就像页面一样，您也可以在列表项和任务级别上添加**字段**，以将其绑定到特定任务作为上下文。为此，您需要使用[内联字段语法](add-metadata.md#inline-fields)：

```markdown
- [ ] Hello, this is some [metadata:: value]!
- [X] I finished this on [completion:: 2021-08-15].
```

任务和列表项在数据方面是相同的，因此您的所有项目符号也都有这里描述的所有信息。

## 字段简写

[Tasks](https://publish.obsidian.md/tasks/Introduction)插件引入了一种不同的[使用表情符号的标记法](https://publish.obsidian.md/tasks/Reference/Task+Formats/Tasks+Emoji+Format)来配置与任务相关的不同日期。在Dataview的上下文中，这种标记法称为`字段简写`。当前版本的Dataview仅支持如下所示的日期简写。不支持优先级和重复简写。

=== "示例"
    - [ ] Due this Saturday 🗓️2021-08-29
    - [x] Completed last Saturday ✅2021-08-22
    - [ ] I made this on ➕1990-06-14
    - [ ] Task I can start this weekend 🛫2021-08-29
    - [x] Task I finished ahead of schedule ⏳2021-08-29 ✅2021-08-22

这些表情符号简写有两个特点。首先，它们省略了内联字段语法（不需要`[🗓️:: YYYY-MM-DD]`），其次，在数据方面它们映射到**文本**字段名称：

| 字段名称       | 简写语法            |
| ---------- | --------------- |
| due        | `🗓️YYYY-MM-DD` |
| completion | `✅YYYY-MM-DD`   |
| created    | `➕YYYY-MM-DD`   |
| start      | `🛫YYYY-MM-DD`  |
| scheduled  | `⏳YYYY-MM-DD`   |

这意味着如果您想查询所有在2021-08-22完成的任务，您将编写：

~~~markdown
```dataview
TASK
WHERE completion = date("2021-08-22")
```
~~~

这将列出两种变体——简写和文本注释：

```markdown
- [x] Completed last Saturday ✅2021-08-22
- [x] Some Done Task [completion:: 2021-08-22]
```

## 隐式字段

与页面一样，Dataview向每个任务或列表项添加了许多隐式字段：

> [!info] 字段的继承
> 任务从其父页面继承*所有字段*——因此如果您的页面中有`rating`字段，您也可以在`TASK`查询中的任务上访问它。

| 字段名称             | 数据类型 | 描述                                                                                                               |
| ---------------- | ---- | ---------------------------------------------------------------------------------------------------------------- |
| `status`         | 文本   | 此任务的完成状态，由`[ ]`括号内的字符确定。通常对于未完成的任务是空格`" "`，对于已完成的任务是`"x"`，但允许支持替代任务状态的插件。                                        |
| `checked`        | 布尔值  | 此任务的状态是否**不**为空，意味着它在其`[ ]`括号中有某个`status`字符（可能是也可能不是`"x"`）而不是空格。                                                 |
| `completed`      | 布尔值  | 这个*特定*任务是否已完成；这不考虑任何子任务的完成或未完成。如果任务标记为`"x"`，则明确被认为是"已完成"。如果您使用自定义状态，例如`[-]`，`checked`将为true，而`completed`将为false。 |
| `fullyCompleted` | 布尔值  | 此任务和**所有**其子任务是否都已完成。                                                                                            |
| `text`           | 文本   | 此任务的纯文本，包括任何元数据字段注释。                                                                                             |
| `visual`         | 文本   | 此任务的文本，由Dataview呈现。此字段可以在DataviewJS中被覆盖，以允许渲染与常规任务文本不同的任务文本，同时仍然允许检查任务（因为Dataview验证逻辑通常检查文本与文件中的文本）。             |
| `line`           | 数字   | 此任务出现在文件的行号。                                                                                                     |
| `lineCount`      | 数字   | 此任务占用的Markdown行数。                                                                                                |
| `path`           | 文本   | 此任务所在文件的完整路径。对于[页面](./metadata-pages.md)等于`file.path`。                                                           |
| `section`        | 链接   | 指向包含此任务的部分的链接。                                                                                                   |
| `tags`           | 列表   | 任务文本内的任何标签。                                                                                                      |
| `outlinks`       | 列表   | 此任务中定义的任何链接。                                                                                                     |
| `link`           | 链接   | 指向此任务附近最近的可链接块的链接；对于创建指向任务的链接很有用。                                                                                |
| `children`       | 列表   | 此任务的任何子任务或子列表。                                                                                                   |
| `task`           | 布尔值  | 如果为true，这是一个任务；否则，它是一个常规列表元素。                                                                                    |
| `annotated`      | 布尔值  | 如果任务文本包含任何元数据字段则为true，否则为false。                                                                                  |
| `parent`         | 数字   | 此任务上方任务的行号（如果存在）；如果这是根级任务，则为null。                                                                                |
| `blockId`        | 文本   | 此任务/列表元素的块ID（如果已使用`^blockId`语法定义了一个）；否则为null。                                                                    |

使用[简写语法](#字段简写)时，以下附加属性可能可用：

- `completion`：任务完成的日期。
- `due`：任务的截止日期（如果有）。
- `created`：任务创建的日期。
- `start`：任务可以开始的日期。
- `scheduled`：任务计划工作的日期。

### 在查询中访问隐式字段

如果您使用[TASK](../queries/query-types.md#task)查询，您的任务是顶级信息，可以不带任何前缀使用：

~~~markdown
```dataview
TASK
WHERE !fullyCompleted
```
~~~

对于其他每种查询类型，您首先需要访问隐式字段`file.lists`或`file.tasks`来检查这些列表项特定的隐式字段：

~~~markdown
```dataview
LIST
WHERE any(file.tasks, (t) => !t.fullyCompleted)
```
~~~

这将给您返回所有内部有未完成任务的文件链接。我们在页面级别获得任务列表，因此需要使用[列表函数](../reference/functions.md)来查看每个元素。