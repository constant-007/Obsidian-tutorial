---
publish: true
---

# 如何获取当前文件中的所有任务

<span class="related-pages">#feature/scripting #plugin/dataview</span>

## 动机和假设

在处理包含大量任务的笔记时，查看文件中所有剩余任务的列表可能很有用，例如确保不会意外遗漏任何任务。

本页面记录了设置此功能的方法。

## 使用纯Tasks代码块 - 带占位符

> [!released]
> 占位符在Tasks 4.7.0中引入。

我们想要搜索与查询所在文件具有相同`path`的任务。

Tasks现在提供了一种自动化方式，在查询中包含`tasks`代码块的位置。

我们可以使用带有占位符文本`{{query.file.path}}`的`path`指令，它将被替换为包含当前查询的文件路径，如下所示：

    ## 此笔记中的任务摘要

    ```tasks
    not done
    path includes {{query.file.path}}
    ```

可用的占位符如下：

```text
{{query.file.path}}
{{query.file.pathWithoutExtension}}
{{query.file.root}}
{{query.file.folder}}
{{query.file.filename}}
{{query.file.filenameWithoutExtension}}
```

它们可以与任何文本过滤器一起使用，不仅仅是`path`、`file`、`folder`、`filename`。例如，它们可能对`description`和`heading`过滤器有用。

更多信息，请参阅：

- [[Placeholders|占位符]]
- [[Query Properties|查询属性]]

## 使用Dataview生成Tasks代码块 - 旧方法

<!-- Move this to a separate note - but retain the original heading - and link to it from here... -->

假设：

- 我们假设您知道如何安装和启用[Dataview](https://github.com/blacksmithgu/obsidian-dataview)插件。

[Dataview](https://github.com/blacksmithgu/obsidian-dataview)插件有一个很好的特性，可以写出代码块，然后由其他插件处理。

这意味着我们可以使用Dataview生成标准的Tasks代码块，这样重复等功能都能正常工作，我们让Dataview自动为我们填入文件名。

### 示例代码 - 以及如何使用

1. 确保Dataview已安装在您的Obsidian库中，并已启用。
1. 将以下整个示例代码块复制到剪贴板。
1. 打开一个包含一些未完成任务的obsidian笔记。
1. 将文本**不带格式**粘贴到Obsidian中（`Shift+Ctrl+V`或`Shift+Command+V`）。
1. 切换到实时预览或阅读模式，查看剩余任务。

示例代码块：

    ## 此笔记中的任务摘要

    ```dataviewjs
    const query = `
    not done
    path includes ${dv.current().file.path}
    # 您可以添加任意数量的额外Tasks指令，例如：
    group by heading
    `;

    dv.paragraph('```tasks\n' + query + '\n```');
    ```

### 使用示例

- 该代码中有很多标点符号和特殊字符，如果重新输入代码很容易出错。
- 因此，我们强烈建议您将代码示例复制并粘贴（不带格式）到您的笔记中，然后修改查询指令以满足您的需求。

### 代码工作原理

- 上面的示例代码块是一个`dataviewjs`代码块，它生成一个Tasks代码块！
- 通过在`query`值的两端放置反引号字符（``` ` ```），我们可以创建一个多行字符串，并且可以使用`${...}`在该字符串内嵌入值。
  - 要了解更多关于这种JavaScript技术的信息，请参阅[模板字面量（模板字符串）](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)。
- Dataview的神奇之处在于使用`dv.current().file.path`，它提供包含代码块的文件路径。
- 行`dv.paragraph('```tasks\n' + query + '\n```');`：
  - 通过添加第一行和最后一行（每行都有3个反引号）将我们的查询转换为tasks代码块
  - 然后将完整的tasks代码块作为段落写出。
- 在实时预览或阅读模式下查看时，Tasks就能正常工作！

### 查看生成的tasks指令

将最后一行更改为创建`text`代码块而不是`tasks`代码块将显示生成的原始tasks指令，如果您想查看Dataview生成了什么，这可能很有用：

    dv.paragraph('```text\n' + query + '\n```');

### 将其放入标注中，获得更美观的输出

如果您希望Tasks结果有更令人愉悦的外观，可以将它们放在[标注](https://help.obsidian.md/How+to/Use+callouts)中。在下面的示例中，结果显示在类型为`todo`的标注中：

    ## 此笔记中的任务摘要

    ```dataviewjs
    function callout(text, type) {
        const allText = `> [!${type}]\n` + text;
        const lines = allText.split('\n');
        return lines.join('\n> ') + '\n'
    }

    const query = `
    not done
    path includes ${dv.current().file.path}
    # 您可以添加任意数量的额外Tasks指令，例如：
    group by heading
    `;

    dv.paragraph(callout('```tasks\n' + query + '\n```', 'todo'));
    ```

## 相关页面

- [[Dataview]]
