# 常见问题

Dataview查询和表达式语言的常见问题集合。

### 如何使用与关键词同名的字段（如"from"、"where"）？

Dataview提供了一个名为`row`的特殊"虚拟"字段，可以通过索引获取与Dataview关键词冲突的字段：

```javascript
row.from /* 与"from"相同 */
row.where /* 与"where"相同 */
```

### 如何访问名称中带有空格的字段？

有两种方法：

1. 使用此类字段的标准化Dataview名称——只需将名称转换为小写并用短划线（"-"）替换空格。例如`Field With Space In It`变成`field-with-space-in-it`。
2. 使用隐式`row`字段：
    ```javascript
    row["Field With Space In It"]
    ```

### 你们有学习资源列表吗？

有的！请参见[资源](../resources/resources-and-support.md)页面。

### 我可以保存查询结果以便重复使用吗？

您可以使用[dv.view](../api/code-reference.md#dvviewpath-input)函数编写可重用的Javascript查询。在DQL中，除了将查询写在模板中并使用此模板的可能性（通过[核心插件模板](https://help.obsidian.md/Plugins/Templates)或流行的社区插件[Templater](https://obsidian.md/plugins?id=templater-obsidian)），您还可以**通过[内联DQL](../queries/dql-js-inline.md#inline-dql)在元数据字段中保存计算**，例如：

```markdown
start:: 07h00m
end:: 18h00m
pause:: 01h30m
duration:: `= this.end - this.start - this.pause`
```

然后您可以在TABLE中列出值（在我们的例子中是9h 30m），而无需重复计算：

~~~markdown
```dataview
TABLE start, end, duration
WHERE duration
```
~~~

给您

| File (1)	| start| 	end| 	duration|
| ---- | ----- | ------ |  ----- |
| Example | 7 hours	| 18 hours| 	9 hours, 30 minutes |

**但在字段中存储内联DQL有一个限制**：虽然结果中显示的值是计算出的值，但**保存在元数据字段中的值仍然是您的内联DQL计算**。该值字面上是`= this.end - this.start - this.pause`。这意味着您无法像这样过滤内联结果：

~~~markdown
```dataview
TABLE start, end, duration
WHERE duration > dur("10h")
```
~~~

这会返回示例页面，即使结果不满足`WHERE`子句，因为您比较的值是`= this.end - this.start - this.pause`，不是持续时间。

### 如何在TABLE查询中隐藏结果计数？

使用Dataview 0.5.52，您可以通过设置隐藏TABLE和TASK查询的结果计数。转到Dataview的设置 -> 显示结果计数。

### 如何为我的查询设置样式？

您可以使用[CSS片段](https://help.obsidian.md/Extending+Obsidian/CSS+snippets)为Obsidian定义自定义样式。所以如果您定义`cssclasses: myTable`作为属性，并启用下面的片段，您可以为dataview的表格设置背景颜色。类似地，要针对`TASK`或`LIST`查询的外部&lt;ul&gt;，您可以分别使用`ul.contains-task-list`或`ul.list-view-ul`。

```css
.myTable dataview.table {
    background-color: green
}
```

一般来说，页面上的特定表格没有唯一的ID，所以上述目标适用于具有该`cssclasses`定义的任何笔记以及该页面上的**所有**表格。目前您无法使用普通查询定位特定表格，但如果您使用javascript，您可以通过以下方式直接向查询结果添加类`clsname`：

```js
dv.container.className += ' clsname'
```

但是，有一个技巧可以使用标签在Obsidian中定位任何表格，如下例所示，这将适用于其中包含该标签的任何表格。这适用于手动创建和dataview生成的表格。要使下面的片段工作，请在表格输出中的_任何位置_添加标签`#myId`。

```css
[href="#myId"] {
    display: none; /* 从表格视图中隐藏标签 */
}

table:has([href="#myId"]) {
   /* 按您喜欢的方式设置表格样式 */
  background-color: #262626;
  & tr:nth-child(even) td:first-child{
    background-color: #3f3f3f;
  }
}
```

这将使整个表格具有灰色背景，并且每个偶数行的第一个单元格具有不同的灰色变体。**免责声明：**我们不是样式专家，所以这只是一个示例，展示设置表格不同部分样式所需的一些语法。

此外，在[为dataview表格列设置样式](https://s-blu.github.io/obsidian_dataview_example_vault/20%20Dataview%20Queries/Style%20dataview%20table%20columns/)中，@s-blu描述了使用`<span>`为表格单元格（和列）的各个部分设置样式的替代技巧。
