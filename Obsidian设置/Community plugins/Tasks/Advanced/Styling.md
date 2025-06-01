---
publish: true
---

# 样式化Tasks

<span class="related-pages">#css</span>

## 介绍

> [!released]
下面几乎所有功能都在Tasks 3.0.0中引入。

在渲染的查询和阅读视图中，Tasks插件添加了详细的CSS类和数据属性，代表每个任务的许多内容，允许通过CSS进行非常广泛的样式选项。
不仅渲染任务行中的每个组件都用类标记以区分它们，许多组件还添加了代表任务实际内容的类和数据属性，因此CSS规则可以引用诸如任务的相对到期日期或其特定优先级等数据。

### 请在线分享您的样式

我们邀请创建自己的Obsidian CSS片段的Tasks用户在["Show and tell"讨论类别](https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/categories/show-and-tell)中分享它们 - 以激励其他人并允许他们使用和学习您的CSS和设计技能。

提前感谢您！

### 向后兼容性和CSS片段

> [!warning]
如果您发现任何现有的Tasks CSS片段在Tasks 3.0.0中停止工作，请按照下面[[Styling#Appendix: Fixing CSS pre-existing snippets for Tasks 3.0.0|附录：为Tasks 3.0.0修复CSS预存在片段]]中的建议进行操作。

## 基本任务结构

> [!released]
以下描述涉及在Tasks 3.0.0中引入的渲染任务重构。

Tasks插件以以下结构渲染任务（这指的是查询结果，但阅读视图是相同的，除了最顶层的容器）：

<!-- NEW_TASK_FIELD_EDIT_REQUIRED -->

```markdown
- Obsidian代码块 (div class="block-language-tasks")
  - 结果列表 (ul class="plugin-tasks-query-result") 或阅读视图列表 (ul class="contains-task-list")
    - 任务 (li class="task-list-item" + 属性如data-task-priority="medium" data-task-due="past-1d" + data-task="[custom_status]" + data-line="[line]")
      - 任务复选框 (li class="task-list-item-checkbox")
      - 任务内容 (span class="tasks-list-text")
        - 任务描述和标签 (span class="task-description")
          - 内部span
            - 描述中的每个标签都包装在<a href class="tag" data-tag-name="[tag-name]">中
        - 任务ID (span class="task-id")
          - 内部span
        - 任务'依赖于' (span class="task-dependsOn")
          - 内部span
        - 任务优先级 (span class="task-priority" + data-task-priority属性)
          - 内部span
        - 任务重复规则 (span class="task-recurring")
          - 内部span
        - 任务'完成时' (span class="onCompletion")
          - 内部span
        - 任务创建日期 (span class="task-created" + data-task-created属性)
          - 内部span
        - ... 开始日期、计划日期、到期日期、取消日期和完成日期按此顺序
      - 任务额外内容（链接、编辑按钮、推迟按钮）(span class="task-extras")
  - 任务计数 (div class="tasks-count")
```

如上所示，基本任务`li`包含一个复选框和一个内容span。
内容span包含一系列**组件**span：描述、优先级、重复、创建日期、开始日期、计划日期、到期日期、取消日期和完成日期按此顺序。

每个组件span都标有一个**通用类**，它表示组件的类型，在某些情况下还有一个**数据属性**，代表组件的内容本身。

在每个组件span内还有一个额外的"内部"span，它是保存实际组件文本的span。
这个额外内部span的原因是它允许CSS样式紧密包装文本本身，而不是其容器框，例如用于绘制恰好是文本大小的高亮或框的目的。

### 示例HTML：完整模式

为了帮助可视化上面的结构，下面是在[[Layout#Full Mode|完整模式]]中显示的示例Tasks搜索的HTML。

> [!Note]
> 在阅读模式中：
>
> - `li`内的所有类和数据都可用，
> - 并且没有"任务额外内容"内容可用。

> [!example]- 示例HTML：完整模式
> ![[Sample HTML - Full mode]]

### 示例HTML：简短模式

下面是[[Layout#Short Mode|简短模式]]中的相同Tasks搜索。

> [!Note]
> 与完整模式的差异：
>
> - `ul`有一个额外的类`tasks-layout-short-mode`，
> - Tasks表情符号后的任何文本值都被省略，
> - 反向链接更短并有一个额外的类`internal-link-short-mode`，
> - 推迟按钮有一个额外的类`tasks-postpone-short-mode`。

> [!example]- 示例HTML：简短模式
> ![[Sample HTML - Short mode]]

## 通用类和数据属性

> [!released]
数据属性在Tasks 3.0.0中引入。

每个渲染的任务组件（描述、优先级、重复规则等）都包含一个**通用类**，表示这种类型的组件。
通用类是：

<!-- NEW_TASK_FIELD_EDIT_REQUIRED -->

- `task-description`
- `task-priority`
- `task-due`
- `task-created`
- `task-start`
- `task-scheduled`
- `task-cancelled`
- `task-done`
- `task-recurring`
- `task-onCompletion`
- `task-id`
- `task-dependsOn`
- `task-block-link`

除了通用类，还有代表各种任务组件内容的[**数据属性**](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes)。

名为`data-task-priority`的**优先级数据属性**表示类的特定优先级。它可以是`highest`、`high`、`medium`、`low`、`lowest`或`normal`。
`normal`值是特殊的：即使没有为该任务设置优先级字段，它也会作为默认值添加到任务的上级`task-list-item`中。

<!-- NEW_TASK_FIELD_EDIT_REQUIRED -->
**日期属性**以相对于当前日期的格式表示到期、创建、开始、计划或完成日期。
日期属性是`data-task-due`、`data-task-created`、`data-task-start`、`data-task-scheduled`、`data-task-cancelled`和`data-task-done`，并填充相对表达式，表示此字段相比今天代表的天数：

- `data-task-due="today"`（或`data-task-start="today"`、`data-task-start="today"`等）代表今天。
- `data-task-due="future-1d"`（或`data-task-start="future-1d"`）代表未来1天，即明天。
- `data-task-due="past-1d"`（或`data-task-start="past-1d"`）代表过去1天，即昨天。
- 这些属性最多添加到未来或过去7天，例如`data-task-scheduled="future-7d"`或`data-task-due="past-7d"`。
- 超过未来或过去7天的日期被给予`far`后缀，例如`data-task-scheduled="future-far"`或`data-task-due="past-far"`。

**标签数据属性**将每个标签的内容重复为数据属性，用于根据特定标签应用格式。
标签`<a>`元素添加了一个`data-tag-name`属性，其中包含标签名称的*清理*版本，这基本上意味着在HTML属性中非法使用的字符（例如`&`、`"`）被替换为破折号。

数据属性既添加到它们对应的组件（例如到期日期组件），也添加到完整的任务`li`，使CSS规则能够轻松地根据某些属性为完整任务设置样式（例如如果今天到期则以不同颜色显示完整任务，根据标签为任务着色）或只是一个相关组件。

一个例外是标签数据属性，它只添加到渲染描述中标签的`<a>`元素 - 但您仍然可以使用CSS `:has`选择器根据标签格式化整个任务的描述，如下面的示例所示。

> [!warning]
CSS `:has`选择器在Obsidian安装程序版本1.1.9及更新版本中可用。您可以运行Obsidian命令`Show debug info`来查看您当前的安装程序版本。

**提示：**[CSS通配符选择器](https://www.geeksforgeeks.org/wildcard-selectors-and-in-css-for-classes/)是一次选择所有过去或未来日期的好方法 - 例如，只需使用`.task-due[data-task-due^="past-"]`来处理所有逾期任务。下面可以找到利用这一点的示例。

## 隐藏组件、分组和简短模式

**隐藏组件**，例如查询中的`hide priority`行，将生成以下内容：

- 查询容器（`class="plugin-tasks-query-result"`）将包含一个`tasks-layout-hide...`类，例如`tasks-layout-hide-priority`。
- 虽然优先级不会在查询中渲染，但上级任务元素（`li class="task-list-item"`）仍然会添加隐藏组件的属性，例如`data-task-priority="high"`。

**简短模式**将向查询容器添加一个`tasks-layout-short-mode`类。

**分组规则**将向查询容器添加一个`data-task-group-by`属性，例如`data-task-group-by="due,scheduled"`。

## 按钮

有关样式化Tasks查询结果中的编辑和推迟按钮的各种方法，请参阅[[How to style buttons|如何样式化按钮]]。

## 自定义状态

任务状态由一些数据属性表示，所有这些属性都设置在`task-list-item` `LI`元素上：

- `data-task`包含*状态符号*，例如常规TODO的""、常规DONE的"x"，或您使用的任何其他符号。
- `data-task-status-type`包含*状态类型*，例如"TODO"、"DONE"、"IN_PROGRESS"。
- `data-task-status-name`包含*状态名称*，例如"Todo"、"Done"、"In Progress"。

这些属性可用于根据任务状态设置任务样式，在大多数情况下状态类型是首选选择器。

## 样式化的限制

- 这里描述的CSS类和数据属性**在源码和实时预览模式下的markdown中不可用**。
- 具体来说，这里描述的CSS类适用于：
  - 阅读模式，
  - 阅读和实时预览模式下的Tasks查询块。
- 样式**无法访问任何自动计划日期**，如果启用了[[Use Filename as Default Date|使用文件名作为默认日期]]选项创建的。
  - 我们正在[issue #1947](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1947)中跟踪此问题。

## 更多类

以下附加组件具有以下类：

| 类                             | 用法                                                                                                                |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| plugin-tasks-query-explanation | 当使用`explain`指令时，这适用于显示查询解释的PRE。                                                                 |
| tasks-backlink                 | 这适用于包装[[Backlinks\|反向链接]]的SPAN（如果在任务上显示）。                                                    |
| tasks-edit                     | 这适用于包装任务旁边显示的编辑按钮/图标的SPAN，该按钮打开任务编辑UI。                                              |
| tasks-postpone                 | 这适用于包装在编辑按钮/图标后显示的推迟按钮/图标的SPAN                                                             |
| tasks-urgency                  | 这适用于包装紧急度分数的SPAN（如果在任务上显示）。                                                                 |
| tasks-group-heading            | 这适用于H4、H5和H6分组标题                                                                                         |

> [!released]
>
> - `tasks-group-heading`在Tasks 1.6.0中引入。

## CSS示例

### 关于这些示例

以下示例可以用作[Obsidian CSS片段](https://help.obsidian.md/How+to/Add+custom+styles#Use+Themes+and+or+CSS+snippets)。

**提示：**以下示例使用Obsidian提供的CSS变量（`--var(...)`）而不是具体的颜色代码，以最大化结果与您选择的主题保持一致的机会。当然，如果您愿意，您也可以使用特定的颜色。

> [!warning]
> 这些示例仅供解释：我们不声称这些示例有用、设计良好或CSS完美！
>
> 它们纯粹是为了演示Tasks插件提供的CSS选择器的使用。

#### 更多示例在线可用

我们邀请创建自己的Obsidian CSS片段的Tasks用户在["Show and tell"讨论类别](https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/categories/show-and-tell)中与其他人分享。

一旦Tasks 3.0.0发布几天后，我们期望在上述链接中有越来越多的片段可用。

也欢迎您添加自己的！

### 通用格式化

使任务的标签、内部链接和重复规则显示为灰色：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-tags-links-recurrence-gray.css -->
```css
.tasks-list-text a.tag {
    color: var(--list-marker-color);
}

.tasks-backlink a.internal-link {
    color: var(--list-marker-color);
}

.task-recurring {
    color: var(--list-marker-color);
}
```
<!-- endSnippet -->

例如：

![Example of tasks-plugin-tags-links-recurrence-gray.css snippet](../../images/tasks-plugin-tags-links-recurrence-gray-snippet.png)

### 优先级作为复选框颜色

以下规则删除Tasks优先级表情符号，并根据任务的优先级将任务的复选框渲染为紫色、红色、橙色、蓝色、青色和绿色：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-priority-as-checkbox-color.css -->
```css
.task-list-item[data-task-priority="highest"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-purple);
    border-color: var(--color-purple);
}

.task-list-item[data-task-priority="high"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-red);
    border-color: var(--color-red);
}

.task-list-item[data-task-priority="medium"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-orange);
    border-color: var(--color-orange);
}

.task-list-item[data-task-priority="normal"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-blue);
    border-color: var(--color-blue);
}

.task-list-item[data-task-priority="low"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-cyan);
    border-color: var(--color-cyan);
}

.task-list-item[data-task-priority="lowest"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-green);
    border-color: var(--color-green);
}

/* 这部分删除常规优先级表情符号 */
span.task-priority {
    display: none;
}
```
<!-- endSnippet -->

例如：

![Example of tasks-plugin-priority-as-checkbox-color.css snippet](../../images/tasks-plugin-priority-as-checkbox-color-snippet.png)

### 样式化自定义状态任务

#### 状态符号

要为带有`/`状态符号的任务的复选框创建绿色光晕，请添加以下CSS片段：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-style-status-symbols.css -->
```css
li.task-list-item[data-task="/"] .task-list-item-checkbox {
    box-shadow: 0 0 10px green !important;
}
```
<!-- endSnippet -->

例如，在阅读模式中：

![Example of tasks-plugin-style-status-symbols.css snippet](../../images/tasks-plugin-style-status-symbols-snippet.png)

此截图是在选择Prism主题的情况下拍摄的，用于样式化复选框。需要`!important`[标志](https://developer.mozilla.org/en-US/docs/Web/CSS/important)来覆盖主题对阴影的意见。

#### 状态类型

另外，您可以使用状态类型编写独立于状态符号的规则。
这里，我们为所有可操作任务添加绿色光晕：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-style-status-types.css -->
```css
li.task-list-item[data-task-status-type="TODO"] .task-list-item-checkbox,
li.task-list-item[data-task-status-type="IN_PROGRESS"] .task-list-item-checkbox {
    box-shadow: 0 0 10px green !important;
}
```
<!-- endSnippet -->

例如，在阅读模式中：

![Example of tasks-plugin-style-status-types.css snippet](../../images/tasks-plugin-style-status-types-snippet.png)

同样，截图是在Prism主题下拍摄的，需要`!important`[标志](https://developer.mozilla.org/en-US/docs/Web/CSS/important)来覆盖主题对阴影的意见。

### 今天到期和逾期的颜色

以下规则将"今天"到期日期标记为青色，将过期日期标记为红色：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-color-due-today-and-overdue.css -->
```css
/* 如果到期日期是今天，为'due'组件设置特殊颜色 */
.task-list-item[data-task-status-type="TODO"] .task-due[data-task-due="today"] span,
.task-list-item[data-task-status-type="IN_PROGRESS"] .task-due[data-task-due="today"] span {
    background: var(--color-cyan);
    border-radius: 10px;
    padding: 2px 8px;
}

/* 为逾期到期日期设置特殊颜色 */
.task-list-item[data-task-status-type="TODO"] .task-due[data-task-due^="past-"] span,
.task-list-item[data-task-status-type="IN_PROGRESS"] .task-due[data-task-due^="past-"] span {
    background: var(--color-pink);
    border-radius: 10px;
    padding: 2px 8px;
}
```
<!-- endSnippet -->

例如：

![Example of tasks-plugin-color-due-today-and-overdue.css snippet](../../images/tasks-plugin-color-due-today-and-overdue-snippet.png)

注意我们在选择器中只包含状态类型，以避免高亮显示DONE、CANCELLED和NON_TASK状态类型任务中的日期。

### 特定标签的高亮显示

以下规则为描述内的`#task/atHome`标签添加绿色光晕：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-highlight-specific-tag-green-glow.css -->
```css
a.tag[data-tag-name="#task/atHome"] {
    box-shadow: 0 0 5px green;
}
```
<!-- endSnippet -->

例如：

![Example of tasks-plugin-highlight-specific-tag-green-glow.css snippet](../../images/tasks-plugin-highlight-specific-tag-green-glow-snippet.png)

以下规则为包含标签`#task/strategic`的任务描述添加圆角红色背景：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-highlight-specific-tag-round-red-description.css -->
```css
.task-description span:has(.tag[data-tag-name="#task/strategic"]) {
    background: #ffbfcc;
    border-radius: 10px;
    padding: 2px 8px;
}
```
<!-- endSnippet -->

例如：

![Example of tasks-plugin-highlight-specific-tag-round-red-description.css snippet](../../images/tasks-plugin-highlight-specific-tag-round-red-description-snippet.png)

### 圆形复选框

以下将复选框渲染为圆形而不是方形：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-circular-checkboxes.css -->
```css
ul > li.plugin-tasks-list-item .task-list-item-checkbox {
    margin-inline-start: 0;
    margin: 5px 2px;
    border-radius: 50%;
}
```
<!-- endSnippet -->

例如：

![Example of tasks-plugin-circular-checkboxes.css snippet](../../images/tasks-plugin-circular-checkboxes-snippet.png)

### 网格布局

以下将任务结构组织成3行网格，其中：

- 描述在第一行，
- 各种组件在第二行，
- 紧急度、反向链接、编辑和推迟按钮（如果显示）在第三行。

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-grid-layout.css -->
```css
ul > li.plugin-tasks-list-item {
    grid-template-columns: 25px auto;
    display: grid;
    align-items: top;
}

span.task-description {
    grid-row: 1;
    grid-column: 1/10;
}

span.tasks-backlink {
    grid-row: 2;
    grid-column: 2;
    font-size: small;
}

span.task-recurring {
    grid-row: 2;
    font-size: small;
    width: max-content;
}

span.task-due {
    grid-row: 2;
    font-size: small;
    width: max-content;
}

span.task-done {
    grid-row: 2;
    font-size: small;
    width: max-content;
}

.tasks-list-text {
    position: relative;
    display: inline-grid;
    width: max-content;
    grid-column-gap: 10px;
}

span.task-extras {
    grid-row: 2;
    grid-column: 2;
    font-size: small;
}

/* 确保阅读模式中的嵌套项目符号获得网格的全部宽度 */
li.task-list-item ul.has-list-bullet {
 grid-row: 3;
 grid-column: 1/10;
}
```
<!-- endSnippet -->

例如，在阅读视图中：

![Example of tasks-plugin-grid-layout.css snippet in Reading view](../../images/tasks-plugin-grid-layout-snippet-reading.png)

在Tasks查询块中：

![Example of tasks-plugin-grid-layout.css snippet in Tasks query block](../../images/tasks-plugin-grid-layout-snippet-query.png)

### 完整示例

以下可以用作完整CSS片段的基础：

<!-- snippet: resources/sample_vaults/Tasks-Demo/.obsidian/snippets/tasks-plugin-complete-example.css -->
```css
/* 我喜欢标签显示为灰色，这样它们不会吸引太多注意力 */
.tasks-list-text a.tag {
    color: var(--list-marker-color);
}

/* 将内部链接也设置为灰色，而不是Obsidian的默认设置 */
.tasks-backlink a.internal-link {
    color: var(--list-marker-color);
}

/* 将重复规则涂成灰色，使其不那么分散注意力 */
.task-recurring {
    color: var(--list-marker-color);
}

/* 对我来说效果很好的列表缩进值 */
ul.contains-task-list.plugin-tasks-query-result {
    padding: 0 10px;
}

/* 如果任务描述太长，这似乎是正确换行所需要的 */
span.tasks-list-text {
    width: auto;
}

/* 用彩色圆形复选框代替优先级表情符号来表示任务的优先级 */
.task-list-item[data-task-priority="highest"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-purple);
    border-color: var(--color-purple);
}

.task-list-item[data-task-priority="high"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-red);
    border-color: var(--color-red);
}

.task-list-item[data-task-priority="medium"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-orange);
    border-color: var(--color-orange);
}

.task-list-item[data-task-priority="normal"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-blue);
    border-color: var(--color-blue);
}

.task-list-item[data-task-priority="low"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-cyan);
    border-color: var(--color-cyan);
}

.task-list-item[data-task-priority="lowest"] input[type=checkbox] {
    box-shadow: 0px 0px 2px 2px var(--color-green);
    border-color: var(--color-green);
}

/* 这部分删除常规优先级表情符号 */
span.task-priority {
    display: none;
}

/* 如果是今天的'due'组件并且仍需处理，设置特殊颜色 */
.task-list-item[data-task-status-type="TODO"] .task-due[data-task-due="today"] span,
.task-list-item[data-task-status-type="IN_PROGRESS"] .task-due[data-task-due="today"] span {
    background: var(--color-cyan);
    border-radius: 10px;
    padding: 2px 8px;
}

/* 为仍需处理的逾期任务设置特殊颜色 */
.task-list-item[data-task-status-type="TODO"] .task-due[data-task-due^="past-"] span,
.task-list-item[data-task-status-type="IN_PROGRESS"] .task-due[data-task-due^="past-"] span {
    background: var(--color-pink);
    border-radius: 10px;
    padding: 2px 8px;
}

/* 使复选框为圆形而不是方形 */
ul > li.plugin-tasks-list-item .task-list-item-checkbox {
    margin-inline-start: 0;
    margin: 5px 2px;
    border-radius: 50%;
}

/* 以下部分将任务组件组织在网格中，使描述位于每个项目的第一行
 * 大多数组件位于第二行。 */
ul > li.plugin-tasks-list-item {
    grid-template-columns: 25px auto;
    display: grid;
    align-items: top;
}

span.task-description {
    grid-row: 1;
    grid-column: 1/10;
}

span.tasks-backlink {
    grid-row: 2;
    grid-column: 2;
    font-size: small;
}

span.task-recurring {
    grid-row: 2;
    font-size: small;
    width: max-content;
}

span.task-due {
    grid-row: 2;
    font-size: small;
    width: max-content;
}

span.task-done {
    grid-row: 2;
    font-size: small;
    width: max-content;
}

.tasks-list-text {
    position: relative;
    display: inline-grid;
    width: max-content;
    grid-column-gap: 10px;
}

span.task-extras {
    grid-row: 2;
    grid-column: 2;
    font-size: small;
}

/* 确保阅读模式中的嵌套项目符号获得网格的全部宽度 */
li.task-list-item ul.has-list-bullet {
 grid-row: 3;
 grid-column: 1/10;
}
```
<!-- endSnippet -->

例如：

![Example of tasks-plugin-complete-example.css snippet](../../images/tasks-plugin-complete-example-snippet.png)

## 附录：为Tasks 3.0.0修复CSS预存在片段

本节解释如果在更新到3.0.0后任何Tasks的CSS片段停止工作该怎么办。

### 总结

尝试从CSS选择器中删除任何`>`，如下面的前后`diff`输出所示：

```diff
- li.plugin-tasks-list-item > span.tasks-backlink > a {
+ li.plugin-tasks-list-item   span.tasks-backlink > a {
```

### 解释

上面记录的重大CSS改进导致Tasks生成用于显示查询块的CSS类发生了微小的破坏性变化。

上面`diff`输出中的`>`表示"直接子元素"，而空格表示"一般子元素"。

自Tasks 3.0.0以来，`tasks-backlink` span现在位于另一个span（`tasks-extras`）内部，而不是直接位于`plugin-tasks-list-item`下方。

因此，如果您发现任何Tasks的CSS块在Tasks 3.0.0中停止工作，请检查任何`>`并将它们更改为空格。
