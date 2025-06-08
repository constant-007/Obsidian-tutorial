---
# 学习管理系统
courseName: ""
instructor: ""
platform: "在线"
progress: 0
difficulty: 3
studyHours: 0
completed: false
nextReview: ""
notes: ""
tags: []

# 项目管理系统
projectName: ""
projectStatus: "planning"
priority: "medium"
startDate: ""
endDate: ""
projectProgress: 0
teamSize: 1
budget: 0
risksNotes: ""

# 阅读追踪器
bookTitle: ""
author: ""
bookType: "fiction"
rating: 3
readingProgress: 0
startReading: ""
finishedReading: ""
bookNotes: ""
---

# Meta Bind实际应用模板

## 1. 学习管理系统

### 课程信息
课程名称：`INPUT[text:courseName]`
讲师：`INPUT[text:instructor]`
平台：`INPUT[inlineSelect(option(在线), option(线下), option(混合)):platform]`

### 学习进度
完成进度：`INPUT[slider(minValue(0), maxValue(100), stepSize(5)):progress]`%
难度评级：`INPUT[slider(minValue(1), maxValue(5), stepSize(1)):difficulty]`⭐
学习时长：`INPUT[number:studyHours]`小时
是否完成：`INPUT[toggle:completed]`

### 复习计划
下次复习：`INPUT[date:nextReview]`

### 学习笔记
`INPUT[textArea:notes]`

### 学习标签
```meta-bind
INPUT[multiSelect(option(重要), option(困难), option(实践), option(理论), option(考试)):tags]
```

### 学习状态显示
- 📚 课程：`VIEW[{courseName}]` 
- 👨‍🏫 讲师：`VIEW[{instructor}]`
- 📍 平台：`VIEW[{platform}]`
- 📊 进度：`VIEW[{progress}]`% 
- ⭐ 难度：`VIEW[{difficulty}]`/5
- ⏱️ 学习时长：`VIEW[{studyHours}]`小时
- ✅ 完成状态：`VIEW[{completed} ? "已完成" : "学习中"]`
- 📅 下次复习：`VIEW[{nextReview}]`
- 🏷️ 标签：`VIEW[{tags}]`

### 学习操作
```meta-bind-button
label: 完成课程
actions:
  - type: updateMetadata
    bindTarget: completed
    evaluate: false
    value: true
  - type: updateMetadata
    bindTarget: progress
    evaluate: false
    value: 100
```

```meta-bind-button
label: 增加1小时学习时间
actions:
  - type: updateMetadata
    bindTarget: studyHours
    evaluate: true
    value: "{studyHours} + 1"
```

---

## 2. 项目管理系统

### 项目基本信息
项目名称：`INPUT[text:projectName]`
项目状态：`INPUT[inlineSelect(option(planning), option(active), option(testing), option(completed), option(paused)):projectStatus]`
优先级：`INPUT[inlineSelect(option(low), option(medium), option(high), option(urgent)):priority]`

### 项目时间线
开始日期：`INPUT[date:startDate]`
结束日期：`INPUT[date:endDate]`

### 项目进度与资源
项目进度：`INPUT[slider(minValue(0), maxValue(100), stepSize(10)):projectProgress]`%
团队规模：`INPUT[number:teamSize]`人
预算：`INPUT[number:budget]`元

### 风险评估
```meta-bind
INPUT[textArea:risksNotes]
```

### 项目状态显示
- 🚀 项目：`VIEW[{projectName}]`
- 📈 状态：`VIEW[{projectStatus}]`
- ⚡ 优先级：`VIEW[{priority}]`
- 📊 进度：`VIEW[{projectProgress}]`%
- 👥 团队：`VIEW[{teamSize}]`人
- 💰 预算：`VIEW[{budget}]`元
- 📅 起止时间：`VIEW[{startDate}]` 到 `VIEW[{endDate}]`
- ⏳ 剩余天数：`VIEW[{endDate} ? Math.ceil((new Date("{endDate}") - new Date()) / (1000 * 60 * 60 * 24)) : "未设置"]`

### 项目操作
```meta-bind-button
label: 开始项目
actions:
  - type: updateMetadata
    bindTarget: projectStatus
    evaluate: false
    value: "active"
```

```meta-bind-button
label: 完成项目
actions:
  - type: updateMetadata
    bindTarget: projectStatus
    evaluate: false
    value: "completed"
  - type: updateMetadata
    bindTarget: projectProgress
    evaluate: false
    value: 100
```

```meta-bind-button
label: 增加10%进度
actions:
  - type: updateMetadata
    bindTarget: projectProgress
    evaluate: true
    value: "Math.min(100, {projectProgress} + 10)"
```

---

## 3. 阅读追踪器

### 书籍信息
书名：`INPUT[text:bookTitle]`
作者：`INPUT[text:author]`
类型：`INPUT[inlineSelect(option(fiction), option(non-fiction), option(technical), option(biography), option(history)):bookType]`

### 阅读进度
阅读进度：`INPUT[slider(minValue(0), maxValue(100), stepSize(5)):readingProgress]`%
评分：`INPUT[slider(minValue(1), maxValue(5), stepSize(0.5)):rating]`⭐

### 阅读时间
开始阅读：`INPUT[date:startReading]`
完成阅读：`INPUT[date:finishedReading]`

### 读书笔记
```meta-bind
INPUT[textArea:bookNotes]
```

### 阅读状态显示
- 📖 书名：`VIEW[{bookTitle}]`
- ✍️ 作者：`VIEW[{author}]`
- 📚 类型：`VIEW[{bookType}]`
- 📊 进度：`VIEW[{readingProgress}]`%
- ⭐ 评分：`VIEW[{rating}]`/5
- 📅 阅读时间：`VIEW[{startReading}]` 到 `VIEW[{finishedReading}]`
- 📖 阅读状态：`VIEW[{readingProgress} == 100 ? "已完成" : "阅读中"]`

### 阅读操作
```meta-bind-button
label: 开始阅读
actions:
  - type: updateMetadata
    bindTarget: startReading
    evaluate: true
    value: "new Date().toISOString().split('T')[0]"
```

```meta-bind-button
label: 完成阅读
actions:
  - type: updateMetadata
    bindTarget: readingProgress
    evaluate: false
    value: 100
  - type: updateMetadata
    bindTarget: finishedReading
    evaluate: true
    value: "new Date().toISOString().split('T')[0]"
```

```meta-bind-button
label: 增加20%进度
actions:
  - type: updateMetadata
    bindTarget: readingProgress
    evaluate: true
    value: "Math.min(100, {readingProgress} + 20)"
```

---

## 使用建议

1. **复制模板**：将需要的部分复制到新笔记中
2. **自定义属性**：根据需要修改frontmatter中的属性
3. **调整字段**：根据实际需求添加或删除输入字段
4. **设置默认值**：在frontmatter中设置合适的默认值
5. **定制按钮**：创建符合您工作流程的自定义按钮

这些模板展示了Meta Bind在实际工作中的强大应用，可以大大提高效率和组织性。 