# 页面上的元数据

您可以通过三种不同的方式向markdown页面（笔记）添加字段——通过前端数据、内联字段和隐式字段。在["如何添加元数据"](./add-metadata.md)中阅读有关前两种可能性的更多信息。

## 隐式字段

Dataview自动向每个页面添加大量元数据。这些隐式和自动添加的字段收集在字段`file`下。可用字段如下：

| 字段名称 | 数据类型 | 描述 |
| --------------------- | --------- | ----------- |
| `file.name` | 文本 | 在Obsidian侧边栏中看到的文件名。 |
| `file.folder` | 文本 | 此文件所属文件夹的路径。 |
| `file.path` | 文本 | 完整的文件路径，包括文件名。 |
| `file.ext` | 文本 | 文件类型的扩展名；通常是`md`。 |
| `file.link` | 链接 | 指向文件的链接。 |
| `file.size` | 数字 | 文件的大小（以字节为单位）。 |
| `file.ctime` | 带时间的日期 | 文件创建的日期。 |
| `file.cday` | 日期 | 文件创建的日期。 |
| `file.mtime` | 带时间的日期 | 文件最后修改的日期。 |
| `file.mday` | 日期 | 文件最后修改的日期。 |
| `file.tags` | 列表 | 笔记中所有唯一标签的列表。子标签按每个级别分解，因此`#Tag/1/A`将作为`[#Tag, #Tag/1, #Tag/1/A]`存储在列表中。 |
| `file.etags` | 列表 | 笔记中所有显式标签的列表；与`file.tags`不同，不分解子标签，即`[#Tag/1/A]`。 |
| `file.inlinks` | 列表 | 指向此文件的所有传入链接的列表，即包含指向此文件链接的所有文件。 |
| `file.outlinks` | 列表 | 来自此文件的所有传出链接的列表，即文件包含的所有链接。 |
| `file.aliases` | 列表 | 通过[YAML前端数据](https://help.obsidian.md/How+to/Add+aliases+to+note)定义的笔记的所有别名列表。 |
| `file.tasks` | 列表 | 此文件中所有任务（即`| [ ] some task`）的列表。 |
| `file.lists` | 列表 | 文件中所有列表元素的列表（包括任务）；这些元素实际上是任务，可以在任务视图中呈现。 |
| `file.frontmatter` | 列表 | 以`key | value`文本值形式包含所有前端数据的原始值；主要用于检查原始前端数据值或动态列出前端数据键。 |
| `file.day` | 日期 | 仅当文件在其文件名中包含日期（形式为`yyyy-mm-dd`或`yyyymmdd`），或具有`Date`字段/内联字段时才可用。 |
| `file.starred` | 布尔值 | 如果此文件已通过Obsidian核心插件"书签"加为书签。 |

## 示例页面

这是一个小的Markdown页面，包含用户定义的两种添加元数据的方式：

```markdown
---
genre: "action"
reviewed: false
---
# Movie X
#movies

**Thoughts**:: It was decent.
**Rating**:: 6

[mood:: okay] | [length:: 2 hours]
```

除了您在这里看到的值之外，该页面还具有上面列出的所有键。

### 示例查询

例如，您可以使用以下查询查询上述信息的一部分：

~~~yaml
```dataview
TABLE file.ctime, length, rating, reviewed
FROM #movies
```
~~~
