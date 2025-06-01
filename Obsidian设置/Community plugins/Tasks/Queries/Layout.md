---
publish: true
---

# 布局命令

## 隐藏/显示元素

您可以使用"hide"和"show"命令以及元素名称来隐藏和显示渲染列表的各个元素。

> [!released]
`show`命令在Tasks 1.14.0中引入。

<!-- NEW_QUERY_INSTRUCTION_EDIT_REQUIRED -->

## 任务元素

存在以下任务元素：

- `id`
- `depends on`
- `priority`
- `cancelled date`
- `created date`
- `start date`
- `scheduled date`
- `due date`
- `done date`
- `recurrence rule`
- `on completion`
- `tags`

默认情况下显示所有这些任务元素，因此如果您不想显示其中任何一个，您将使用`hide`命令。

例如：

```text
hide created date
```

> [!released]
>
> - `created date`在Tasks 2.0.0中引入。
> - `tags`在Tasks 4.1.0中引入。
> - `cancelled date`在Tasks 5.5.0中引入。
> - `id`和`depends on`在Tasks 6.1.0中引入。

### 隐藏和显示标签

> [!Info] 关于`hide tags`
>
> 1. 只有Obsidian识别的标签才会被`hide tags`隐藏。
>     - Tasks在识别标签方面比Obsidian更宽松。例如，`#123`被Tasks视为标签，因此包含在Tasks的搜索、排序和分组代码中。
>     - 但是，`#123`[不被识别为有效的Obsidian标签](https://help.obsidian.md/Editing+and+formatting/Tags#Tag+format)，因此不会被隐藏。
>     - 有关更多信息，请参阅[[Tags#Recognising Tags|标签#识别标签]]。
> 1. 无法隐藏或显示单个标签。我们在[discussion #848](https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/848)中跟踪此问题。
>     - 但是，您可以使用CSS片段在Tasks搜索结果中隐藏单个标签：请参阅[此评论](https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/848#discussioncomment-12117010)。

## 查询元素

存在以下查询元素：

- `tree`
- `edit button`
- `postpone button`
- `backlink`
- `urgency`
- `task count`

> [!released]
>
> - `urgency`在Tasks 1.14.0中引入。
> - `tree`在Tasks 7.12.0中引入。

除了`urgency`和`tree`之外，默认情况下显示所有这些查询元素，因此如果您不想显示其中任何一个，您将使用`hide`命令，或使用`show`命令显示紧急度分数或树视图。

例如：

```text
hide task count
```

### 隐藏和显示树

> [!Tip]
> 新指令`show tree`是教Tasks插件完全处理[嵌套任务和列表项](https://help.obsidian.md/Editing+and+formatting/Basic+formatting+syntax#Nesting+lists)的一长系列步骤中的第一个。
>
> 当您使用`show tree`时，Tasks显示所有找到的任务，以及**所有**它们的嵌套任务和列表项（目前，无论嵌套任务是否匹配查询）。

> [!released]
> `show tree`在Tasks 7.12.0中引入。

#### 显示树示例

假设您有一个名为`Party Planner`的笔记，包含以下列表：

```text
- [ ] Have a party
    - Planning
        - [x] Decide who to invite ✅ 2024-10-26
        - [ ] Send out the invites
    - Preparation
        - [ ] Plan the menu
            - **Remember Sam's dietary requests**
        - [ ] Buy the food
    - On the day
        - [ ] Prepare the food
        - [ ] Tidy up
```

您有这个Tasks查询：

````text
```tasks
not done
filename includes Party Planner

show tree
hide backlink
```
````

`show tree`指令使我们能够看到任务中的父/子关系，以及它们的嵌套任务和列表项：

![Sample search results with 'show tree' instruction](../images/show-tree.png)
<span class="caption">带有'show tree'指令的示例搜索结果</span>

#### 显示树的工作原理

> [!warning]
> 如果使用`show tree`，请注意其当前行为，详细说明如下。
>
> 我们发布这个第一个版本，发现它在我们自己的库中已经很有价值。

- 目前，**显示所有子任务和列表项**，无论它们是否匹配查询。
  - 在上面的截图中，`Decide who to invite`不匹配`not done`查询，但仍然显示。
- 任何**排序指令只影响结果列表中最左侧任务的排序**。
  - 子任务和列表项按它们在文件中出现的顺序显示。它们不受任何`sort by`指令的影响。
- 目前，**树布局默认关闭**，当我们探索它应该如何与过滤指令交互时。
  - 我们希望在未来的版本中使其成为默认行为。

## 显示和隐藏示例

可以在查询中使用多个显示和隐藏指令，每个指令在单独的行上。

例如：

    ```tasks
    no due date
    path includes GitHub

    hide recurrence rule
    hide task count
    hide backlink
    show urgency
    ```

## 完整模式

在完整模式下，查询结果将显示表情符号和具体的重复规则或日期。

这是默认模式。

命令是`full mode`。

示例：

    ```tasks
    not done
    full mode
    ```

这可以用[[#Short Mode|简短模式]]逆转。

## 简短模式

在简短模式下，查询结果将只显示表情符号，但不显示具体的重复规则或日期。
您可以将鼠标悬停在任务上以在工具提示中查看规则和日期。

命令是`short mode`。

示例：

    ```tasks
    not done
    short mode
    ```

这可以用[[#Full Mode|完整模式]]逆转。

## 输入布局指令的替代方法

> [!released]
> [[Query File Defaults|查询文件默认值]]在Tasks 7.15.0中引入。

本页面中的所有布局指令都可以通过在包含查询的文件中放置某些文件属性（称为"查询文件默认值"）来自动为您生成。

例如，假设包含我们查询的文件以以下内容开头：

<!-- snippet: DocsSamplesForDefaults.test.DocsSamplesForDefaults_demo-short-mode_yaml.approved.yaml -->
```yaml
---
TQ_short_mode: true
---
```
<!-- endSnippet -->

该文件中的所有Tasks代码块将在其开头自动插入此内容：

<!-- snippet: DocsSamplesForDefaults.test.DocsSamplesForDefaults_demo-short-mode_instructions.approved.txt -->
```txt
short mode
```
<!-- endSnippet -->

当然，如果`TQ_short_mode`为`false`，将插入以下内容：

```txt
full mode
```

有关更多信息，请参阅[[Query File Defaults|查询文件默认值]]。

有关更强大的功能，请参阅[[Make a query user interface|制作查询用户界面]]。
