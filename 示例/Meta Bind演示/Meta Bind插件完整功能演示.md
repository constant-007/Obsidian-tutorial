---
courseName: ""
instructor: ""
completed: false
progress: 0
priority: medium
status: pending
rating: 3
dueDate: ""
notes: ""
tags: []
---

# Meta Bind插件完整功能演示

## 基础输入字段

### 文本输入
课程名称：`INPUT[text:courseName]`

讲师姓名：`INPUT[text:instructor]`

### 切换开关
是否完成：`INPUT[toggle:completed]`

### 数字输入
完成进度：`INPUT[number:progress]`

评分(1-5)：`INPUT[number:rating]`

## 选择器字段

### 内联选择器
优先级：`INPUT[inlineSelect(option(low), option(medium), option(high)):priority]`

状态：`INPUT[inlineSelect(option(pending), option(in-progress), option(completed)):status]`

## 日期和文本区域

### 日期选择
截止日期：`INPUT[date:dueDate]`

### 文本区域
备注：`INPUT[textArea:notes]`

## 滑块控件

进度滑块：`INPUT[slider(minValue(0), maxValue(100), stepSize(5)):progress]`

## 代码块输入字段

```meta-bind
INPUT[multiSelect(option(重要), option(紧急), option(学习), option(工作)):tags]
```

## 显示值 (VIEW字段)

当前课程：`VIEW[{courseName}]`

讲师：`VIEW[{instructor}]`

完成状态：`VIEW[{completed}]`

进度：`VIEW[{progress}]`%

优先级：`VIEW[{priority}]`

状态：`VIEW[{status}]`

评分：`VIEW[{rating}]`/5

截止日期：`VIEW[{dueDate}]`

标签：`VIEW[{tags}]`

## 简单按钮示例

```meta-bind-button
label: 完成任务
actions:
  - type: updateMetadata
    bindTarget: completed
    evaluate: false
    value: true
```

```meta-bind-button
label: 重置进度
actions:
  - type: updateMetadata
    bindTarget: progress
    evaluate: false
    value: 0
```

## 计算显示

剩余进度：`VIEW[100 - {progress}]`%

完成状态文本：`VIEW[{completed} ? "已完成" : "未完成"]`

## 使用说明

### 基础语法
- 输入字段：`INPUT[type:property]`
- 显示字段：`VIEW[{property}]`
- 带参数：`INPUT[type(arg1, arg2):property]`

### 支持的输入类型
- `text` - 文本输入
- `number` - 数字输入
- `toggle` - 开关
- `inlineSelect` - 内联选择器
- `date` - 日期选择
- `textArea` - 文本区域
- `slider` - 滑块
- `multiSelect` - 多选（代码块中）

### 常用参数
- `option(value)` - 选择器选项
- `minValue(n)`, `maxValue(n)` - 数值范围
- `stepSize(n)` - 步长
- `placeholder(text)` - 占位符

这个演示展示了Meta Bind插件的主要功能，所有字段都与文档前的frontmatter属性绑定，实现实时同步更新。 