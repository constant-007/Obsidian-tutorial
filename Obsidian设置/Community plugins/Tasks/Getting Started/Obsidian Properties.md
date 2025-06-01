---
publish: true
---

# Obsidian属性

> [!released]
> 在Tasks 7.7.0中引入了Obsidian属性的使用。

## 什么是Obsidian属性？

Obsidian提供了一个称为[属性](https://help.obsidian.md/Editing+and+formatting/Properties)的功能。

属性允许您组织关于笔记的信息。属性包含结构化数据，如文本、链接、日期、复选框和数字。

这是一个示例属性部分，它*必须*出现在markdown文件的第一行：

```yaml
---
name: value
---
```

在Tasks文档中，我们将这些称为Obsidian属性，以区别于任务和查询属性。

关于Obsidian属性的背景阅读：

- [An Introduction to Obsidian Properties - Obsidian Rocks](https://obsidian.rocks/an-introduction-to-obsidian-properties/)
- [Obsidian "properties" to help sort your stuff - Mickey Mellen](https://www.mickmel.com/obsidian-properties-to-help-sort-your-stuff/)

## 为什么在Tasks查询中使用Obsidian属性？

只有在能节省您时间的情况下才使用！

许多（如果不是大多数）Tasks搜索不需要使用Obsidian属性。

但是，您可能希望将一条信息放入文件的Obsidian属性中，而不是将其放在文件中的每个任务上。

例如，如果您将标签与项目关联，您可能希望将该标签放在文件顶部的一个位置，而不必记住将其添加到文件中的每一个任务行上。

## Tasks如何处理Obsidian属性？

您可能想从下面的[[#Obsidian属性查询示例|示例]]开始，了解Tasks可以对Obsidian属性做*什么*。

本节描述*如何*...

- Frontmatter属性值可以在以下指令中使用：
  - `filter by function`
  - `sort by function`
  - `group by function`
- `task.file.hasProperty('property name')`返回`true`，如果：
  - 任务在具有名为`property name`的属性的文件中
  - 并且该属性具有非空值。
- `task.file.property('property name')`返回：
  - 属性的值
  - 或者`null`，如果：
    - 属性没有值，
    - 或者任务的文件不包含该属性。
- 属性名称不区分大小写：
  - 例如，`property name`将找到`Property Name`。
- Frontmatter中的标签可以通过`task.file.property('tags')`访问
  - `TAG`和`TAGS`被标准化为`tags`。
  - 此函数返回的所有标签值都添加了`#`前缀。
- Frontmatter中的别名尚未标准化。
  - 如果您的库包含`alias`、`ALIAS`和`ALIASES`的混合，您的查询需要编码来处理两种拼写，目前。
- Tasks读取YAML和[JSON](https://help.obsidian.md/Editing+and+formatting/Properties#JSON+Properties)格式。

## Obsidian属性查询示例

### 标签

#### 显示frontmatter中具有特定标签的文件中的任务

```javascript
filter by function task.file.property('tags').includes('#sample-tag')
```

请注意，这是精确标签搜索。它不会匹配`#sample-tag/some-sub-tag`。

#### 不显示frontmatter中具有特定标签的文件中的任何任务

```javascript
filter by function ! task.file.property('tags').includes('#notasks')
```

如果您想在所有Tasks查询中采用这样的约定，您可以将上述内容添加到您的[[Global Query|全局查询]]中。

### Kanban插件

您可以控制Tasks应该如何处理[[Kanban Plugin|Kanban插件]]文件中的任务。

#### 仅显示Kanban插件文件中的任务

```javascript
filter by function task.file.hasProperty('kanban-plugin')
```

#### 不显示Kanban插件文件中的任务

```javascript
filter by function ! task.file.hasProperty('kanban-plugin')
```

### 跟踪项目

#### 使用`project`属性

假设您有多个与项目相关的文件，分布在您的库中，它们都有这样的`project`属性：

```yaml
---
project: Project 1
---
```

此搜索将找到这些文件中的所有任务：

```javascript
filter by function task.file.property('project') === 'Project 1'
```

#### 使用`#project/...`标签值

有些人更喜欢使用属性标签来识别项目。标签的一个优点是很容易添加多个值。

```yaml
---
tags:
  - project/project-1
---
```

此精确匹配搜索将找到此类文件中的所有任务：

```javascript
filter by function task.file.property('tags').includes('#project/project-1')
```

如果您想使用子字符串搜索来查找具有任何以`#project/`开头的属性标签的文件中的所有任务，您可以使用[可选链接(?.))](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)和[空值合并运算符(??)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing)，如下所示：

```javascript
filter by function task.file.property('tags')?.join(',').includes('#project/') ?? false
```

或者您可以使用[模板字面量(模板字符串)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)，如下所示：

```javascript
filter by function `${task.file.property('tags')}`.includes('#project/')
```

### 使用日期值

Obsidian支持[日期](https://help.obsidian.md/Editing+and+formatting/Properties#^date-time)和[日期和时间](https://help.obsidian.md/Editing+and+formatting/Properties#^date-time)属性值。

它以这些示例中显示的格式存储它们：

```yaml
---
date: 2020-08-21
time: 2020-08-21T10:30:00
---
```

目前，Tasks对这些没有特殊处理，将它们视为字符串值。

#### 按原始日期值分组

`creation date`属性可能这样使用，根据存储的属性值按文件创建日期对任务进行分组：

```javascript
group by function task.file.property('creation date') ?? 'no creation date'
```

#### 使用Moment.js格式化日期值

如果您想对`Date`或`Date & time`值进行日期计算，您可以使用`window.moment(value)`创建一个[Moment.js](https://momentjs.com)对象。

例如：

```javascript
group by function \
    const value = task.file.property('creation date'); \
    return value ? window.moment(value).format('YYYY MMMM') : 'no date'
```

## Tasks如何解释Obsidian属性？

考虑一个具有以下示例属性（或"Frontmatter"）的文件：

<!-- TODO this was copied from docs_sample_for_task_properties_reference.md - embed the content automatically in future... -->

```yaml
---
sample_checkbox_property: true
sample_date_property: 2024-07-21
sample_date_and_time_property: 2024-07-21T12:37:00
sample_list_property:
  - Sample
  - List
  - Value
sample_number_property: 246
sample_text_property: Sample Text Value
sample_text_multiline_property: |
  Sample
  Text
  Value
sample_link_property: "[[yaml_all_property_types_populated]]"
sample_link_list_property:
  - "[[yaml_all_property_types_populated]]"
  - "[[yaml_all_property_types_empty]]"
aliases:
  - YAML All Property Types Populated
tags:
  - tag-from-file-properties
creation date: 2024-05-25T15:17:00
project: Secret Project
---
```

下表显示了这些属性中的大多数在Tasks查询中是如何解释的：

<!-- placeholder to force blank line before included text --><!-- include: TaskProperties.test.task_frontmatter_properties.approved.md -->

| 字段 | 类型1 | 示例1 |
| ----- | ----- | ----- |
| `task.file.hasProperty('creation date')` | `boolean` | `true` |
| `task.file.property('creation date')` | `string` | `'2024-05-25T15:17:00'` |
| `task.file.property('sample_checkbox_property')` | `boolean` | `true` |
| `task.file.property('sample_date_property')` | `string` | `'2024-07-21'` |
| `task.file.property('sample_date_and_time_property')` | `string` | `'2024-07-21T12:37:00'` |
| `task.file.property('sample_list_property')` | `string[]` | `['Sample', 'List', 'Value']` |
| `task.file.property('sample_number_property')` | `number` | `246` |
| `task.file.property('sample_text_property')` | `string` | `'Sample Text Value'` |
| `task.file.property('sample_text_multiline_property')` | `string` | `'Sample\nText\nValue\n'` |
| `task.file.property('sample_link_property')` | `string` | `'[[yaml_all_property_types_populated]]'` |
| `task.file.property('sample_link_list_property')` | `string[]` | `['[[yaml_all_property_types_populated]]', '[[yaml_all_property_types_empty]]']` |
| `task.file.property('tags')` | `string[]` | `['#tag-from-file-properties']` |

<!-- placeholder to force blank line after included text --><!-- endInclude -->

> [!tip]
> `query.file.hasProperty()`和`query.file.property()`也可用，并且自然表现相同。

## 在搜索中使用查询属性

> [!released]
> 在Tasks 7.15.0中引入了在占位符中使用Obsidian属性。

- 现在可以在查询文件中使用属性：
  - `query.file.hasProperty()`有效。
  - `query.file.property()`有效。

想象在**包含查询的笔记**顶部有这样的文本：

```yaml
---
search-text: exercise
workdate: 2024-04-01
groupby: group by happens
---
```

它可以在查询中以几种方式使用：

1. 通过占位符嵌入的frontmatter搜索词：

    ```javascript
    description includes {{query.file.property('search-text')}}
    due on or before {{query.file.property('workdate')}}
    ```

    > [!warning]
    > 您必须确保在查询文件中设置了属性值。否则会插入文本`null`，这不太可能是您想要的。

2. 由front-matter值控制的整个指令，通过[[Placeholders|占位符]]嵌入：

    ```javascript
    {{query.file.property('groupby') ?? ''}}
    ```

    `?? ''`文本确保如果属性未设置，指令被忽略，而不是插入`null`。

> [!tip]
> 另请参阅[[Query File Defaults|查询文件默认值]]，了解Tasks搜索自动支持的内置属性。

> [!warning] 使用没有值的属性
> 目前，当占位符中的属性*未*设置时：
>
> - 在文本指令中，当前使用的字符串是`null`，这不太可能是意图
> - 在数字指令中，使用的值是`null`，这会产生错误
