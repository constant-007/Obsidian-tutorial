---
publish: true
---

# 紧急度

## 介绍

默认情况下，Tasks按紧急度递减顺序[[Sorting|排序]]查询结果。
Tasks尝试根据您可能接下来应该处理的内容来计算紧急度。

当然，紧急度分数并不完美，因为许多更多因素可能影响您想要处理任务的顺序。
紧急度只能考虑它知道的参数：[[Dates|日期]]和[[Priority|优先级]]。
您想要接下来处理的任务很可能是列表顶部的任务之一。

Tasks的紧急度概念基于[Taskwarrior](https://taskwarrior.org/)的[紧急度](https://taskwarrior.org/docs/urgency.html)概念。

## 紧急度计算方法

紧急度是Tasks为每个任务计算的数字分数。
Tasks简单地将任务不同方面的紧急度分数相加：

1. 到期日期
1. 优先级
1. 计划日期
1. 开始日期

从下表可以看出，**到期日期对紧急度的影响最强**。

注意，任何无效的日期值（指向不存在的日期）都会被忽略。

分数如下：

<!-- placeholder to force blank line before included text --><!-- include: DocsSamplesForUrgency.test.UrgencyTable_urgency-html-table.approved.md -->

<table>
<thead>
  <tr>
    <th colspan="2">Property</th>
    <th>Score</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="25">Due</td>
    <td>due more than 7 days ago</td>
    <td><code>12.00000</code></td>
  </tr>
  <tr>
    <td>due 7 days ago</td>
    <td><code>12.00000</code></td>
  </tr>
  <tr>
    <td>due 6 days ago</td>
    <td><code>11.54286</code></td>
  </tr>
  <tr>
    <td>due 5 days ago</td>
    <td><code>11.08571</code></td>
  </tr>
  <tr>
    <td>due 4 days ago</td>
    <td><code>10.62857</code></td>
  </tr>
  <tr>
    <td>due 3 days ago</td>
    <td><code>10.17143</code></td>
  </tr>
  <tr>
    <td>due 2 days ago</td>
    <td><code>9.71429</code></td>
  </tr>
  <tr>
    <td>due 1 day ago</td>
    <td><code>9.25714</code></td>
  </tr>
  <tr>
    <td>Today</td>
    <td><code>8.80000</code></td>
  </tr>
  <tr>
    <td>1 day until due</td>
    <td><code>8.34286</code></td>
  </tr>
  <tr>
    <td>2 days until due</td>
    <td><code>7.88571</code></td>
  </tr>
  <tr>
    <td>3 days until due</td>
    <td><code>7.42857</code></td>
  </tr>
  <tr>
    <td>4 days until due</td>
    <td><code>6.97143</code></td>
  </tr>
  <tr>
    <td>5 days until due</td>
    <td><code>6.51429</code></td>
  </tr>
  <tr>
    <td>6 days until due</td>
    <td><code>6.05714</code></td>
  </tr>
  <tr>
    <td>7 days until due</td>
    <td><code>5.60000</code></td>
  </tr>
  <tr>
    <td>8 days until due</td>
    <td><code>5.14286</code></td>
  </tr>
  <tr>
    <td>9 days until due</td>
    <td><code>4.68571</code></td>
  </tr>
  <tr>
    <td>10 days until due</td>
    <td><code>4.22857</code></td>
  </tr>
  <tr>
    <td>11 days until due</td>
    <td><code>3.77143</code></td>
  </tr>
  <tr>
    <td>12 days until due</td>
    <td><code>3.31429</code></td>
  </tr>
  <tr>
    <td>13 days until due</td>
    <td><code>2.85714</code></td>
  </tr>
  <tr>
    <td>14 days until due</td>
    <td><code>2.40000</code></td>
  </tr>
  <tr>
    <td>More than 14 days until due</td>
    <td><code>2.40000</code></td>
  </tr>
  <tr>
    <td>None</td>
    <td><code>0.00000</code></td>
  </tr>
  <tr>
    <td rowspan="6">Priority</td>
    <td>Highest</td>
    <td><code>9.0</code></td>
  </tr>
  <tr>
    <td>High</td>
    <td><code>6.0</code></td>
  </tr>
  <tr>
    <td>Medium</td>
    <td><code>3.9</code></td>
  </tr>
  <tr>
    <td>None</td>
    <td><code>1.95</code></td>
  </tr>
  <tr>
    <td>Low</td>
    <td><code>0.0</code></td>
  </tr>
  <tr>
    <td>Lowest</td>
    <td><code>-1.8</code></td>
  </tr>
  <tr>
    <td rowspan="3">Scheduled</td>
    <td>Today or earlier</td>
    <td><code>5.0</code></td>
  </tr>
  <tr>
    <td>Tomorrow or later</td>
    <td><code>0.0</code></td>
  </tr>
  <tr>
    <td>None</td>
    <td><code>0.0</code></td>
  </tr>
  <tr>
    <td rowspan="3">Start</td>
    <td>Today or earlier</td>
    <td><code>0.0</code></td>
  </tr>
  <tr>
    <td>Tomorrow or later</td>
    <td><code>-3.0</code></td>
  </tr>
  <tr>
    <td>None</td>
    <td><code>0.0</code></td>
  </tr>
</tbody>
</table>

<!-- placeholder to force blank line after included text --><!-- endInclude -->

## 示例

```markdown
一个今天到期、优先级为"中等"、未计划、没有开始日期的任务：
urgency = 8.8 + 3.9 + 0.0 + 0.0 = 12.7

一个没有到期日期、优先级为"高"、昨天计划、昨天开始的任务：
urgency = 0.0 + 6.0 + 5.0 + 0.0 = 11.0

一个没有到期日期、优先级为"高"、明天计划、明天开始的任务：
urgency = 0.0 + 6.0 + 0.0 - 3.0 = 3.0
```

## 如何显示紧急度分数

您可以使用`show urgency`选项在任务列表中显示计算的紧急度分数。

## 常见问题

### 为什么我的所有任务的紧急度分数都是1.95？

我们有时会被告知紧急度分数有问题，Tasks忽略了用户的到期日期、优先级等。

这种情况总是因为用户的Tasks数据在某种程度上是不正确的，阻止了Tasks插件读取数据。

而目前最可能的原因是任务中值的顺序不正确：请参阅[[Auto-Suggest#What do I need to know about the order of items in a task?|关于任务中项目顺序我需要了解什么？]]。

我们正在[issue #1505](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1505)中跟踪这个顺序限制。

## 紧急度分数的限制

### 紧急度分数忽略任务状态

如果您希望按状态排序，并包含可能已完成的任务，这会给出误导性的结果，因为旧的已完成任务会首先出现。

解决方法是首先按[[Status Types|状态类型]]排序：

````text
```tasks
sort by status.type
sort by urgency
```
````

### 紧急度分数不知道任务依赖关系

当使用[[Task Dependencies|任务依赖]]时，阻塞任务应该有更高的紧急度。被阻塞的任务应该有更低的紧急度。

这尚未实现。

我们正在[issue #2655](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2655)中跟踪此问题。
