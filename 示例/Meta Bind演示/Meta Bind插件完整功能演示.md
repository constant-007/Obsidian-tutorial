---
progress: 0
username: "用户名"
email: "test@example.com"
age: 25
completed: true
priority: "medium"
tags: []
rating: 3
date: "2024-01-01"
notes: ""
project_progress: 50
name: ""
textWithDefault: ""
detailedNotes: ""
status: "待办"
category: "项目"
dueDate: ""
reminderTime: ""
meetingTime: ""
eventDate: ""
score: 0
completion: 0
styledInput: ""
styledSelect: ""
nameWithTitle: ""
importantFlag: false

# 项目管理相关
projectTitle: ""
projectDesc: ""
projectStatus: "计划中"
startDate: ""
endDate: ""
projectProgress: 0
projectManager: ""
teamMembers: []
budget: 0
riskLevel: "中"
mainRisks: ""
projectTags: []

# 任务管理相关
taskTitle: ""
taskType: "日常任务"
taskPriority: "中"
estimatedHours: 0
actualHours: 0
taskCompleted: false
taskCompletion: 0
completionTime: ""
taskReflection: ""

# 学习管理相关
courseName: ""
instructor: ""
platform: "其他"
chapterProgress: 0
masteryLevel: "初学"
difficulty: 1
studyHours: 0
keyConcepts: []
keyPoints: ""
questions: ""
nextReview: ""
reviewCount: 0
needsReview: false
reviewFocus: ""

# 读书记录相关
bookTitle: ""
author: ""
bookType: "其他"
bookRating: 3

# 习惯追踪相关
habitName: ""
targetDays: 30
currentStreak: 0
todayCompleted: false

# 电影记录相关
movieTitle: ""
director: ""
movieGenre: []
watchDate: ""
personalRating: 5
movieReview: ""
---

# Meta Bind插件完整功能演示

Meta Bind 是一个强大的 Obsidian 插件，允许你创建动态的输入字段和视图字段，与笔记的元数据（frontmatter）进行绑定。

## 📋 目录

1. [基础输入字段](#基础输入字段)
2. [文本输入与文本区域](#文本输入与文本区域)  
3. [选择器与下拉菜单](#选择器与下拉菜单)
4. [日期与时间选择器](#日期与时间选择器)
5. [滑块与数字输入](#滑块与数字输入)
6. [按钮与动作](#按钮与动作)
7. [VIEW字段显示](#VIEW字段显示)
8. [高级绑定功能](#高级绑定功能)
9. [样式与自定义](#样式与自定义)
10. [复杂示例场景](#复杂示例场景)

---

## 基础输入字段

### 文本输入
姓名：`INPUT[text:username]`

邮箱：`INPUT[text:email]`

### 数字输入
年龄：`INPUT[number:age]`

### 切换开关
任务完成：`INPUT[toggle:completed]`

### 下拉选择
优先级：`INPUT[inlineSelect(option(low), option(medium), option(high)):priority]`

---

## 文本输入与文本区域

### 带占位符的文本输入
`INPUT[text(placeholder(Enter your name)):name]`

### 带默认值的文本输入
`INPUT[text(defaultValue(默认文本)):textWithDefault]`

### 多行文本区域
`INPUT[textArea:notes]`

### 带占位符的文本区域
`INPUT[textArea(placeholder(Enter your notes here)):detailedNotes]`

---

## 选择器与下拉菜单

### 简单下拉选择
`INPUT[inlineSelect(option(低), option(中), option(高)):priority]`

### 内联选择器（更紧凑）
`INPUT[inlineSelect(option(待办), option(进行中), option(已完成)):status]`

### 多选框
在代码块中使用：

```meta-bind
INPUT[multiSelect(option(工作), option(学习), option(生活), option(娱乐)):tags]
```

### 列表选择器
`INPUT[inlineListSuggester(option(项目), option(任务), option(笔记), option(想法)):category]`

---

## 日期与时间选择器

### 日期选择器
`INPUT[date:dueDate]`

### 时间选择器
`INPUT[time:reminderTime]`

### 日期时间组合
`INPUT[dateTime:meetingTime]`

### 日期选择器（带日历弹窗）
`INPUT[datePicker:eventDate]`

---

## 滑块与数字输入

### 基础数字输入
`INPUT[number:age]`

### 带范围限制的数字输入
`INPUT[number(minValue(0), maxValue(100)):score]`

### 滑块 (0-100)
`INPUT[slider(minValue(0), maxValue(100), stepSize(5)):progress]`

### 评分滑块 (1-5星)
`INPUT[slider(minValue(1), maxValue(5), stepSize(1)):rating]`

### 进度条显示
`INPUT[progressBar:completion]`

---

## 按钮与动作

按钮需要使用代码块格式定义，然后可以通过内联方式引用：

```meta-bind-button
style: primary
label: 完成任务
actions:
  - type: updateMetadata
    bindTarget: completed
    evaluate: false
    value: true
```

```meta-bind-button
style: destructive
label: 重置进度
actions:
  - type: updateMetadata
    bindTarget: progress
    evaluate: false
    value: 0
```

---

## VIEW字段显示

### 显示文本值
当前用户名：`VIEW[{username}]`

当前年龄：`VIEW[{age}]`

完成状态：`VIEW[{completed}]`

### 数学计算
进度百分比：`VIEW[{project_progress} / 100]`

年龄加10：`VIEW[{age} + 10]`

### 条件显示
任务状态：`VIEW[{completed} ? "✅ 已完成" : "⏳ 进行中"]`

优先级显示：`VIEW[{priority} == "high" ? "🔴 高" : ({priority} == "medium" ? "🟡 中" : "🟢 低")]`

---

## 高级绑定功能

### 跨文件绑定
绑定到其他文件的属性：`INPUT[toggle:OtherNote#completed]`

### 内存绑定（临时存储）
临时计数器：`INPUT[number:memory^counter]`

### 全局内存绑定
全局设置：`INPUT[text:globalMemory^setting]`

---

## 样式与自定义

### 带CSS类的输入字段
`INPUT[text(class(fancy-input)):styledInput]`

### 自定义样式的下拉选择
`INPUT[inlineSelect(class(custom-select), option(选项1), option(选项2), option(选项3)):styledSelect]`

### 带标题的输入字段
`INPUT[text(title(请输入您的姓名)):nameWithTitle]`

### 显示样式的切换按钮
`INPUT[toggle(class(important-toggle)):importantFlag]`

---

## 复杂示例场景

### 项目管理表单

```meta-bind
INPUT[text(placeholder(Project Name)):projectTitle]
INPUT[textArea(placeholder(Project Description)):projectDesc]
INPUT[inlineSelect(option(计划中), option(进行中), option(测试中), option(已完成), option(已暂停)):projectStatus]
INPUT[date:startDate]
INPUT[date:endDate]
INPUT[slider(minValue(0), maxValue(100), stepSize(5)):projectProgress]
INPUT[text:projectManager]
INPUT[multiSelect(option(张三), option(李四), option(王五), option(赵六), option(孙七)):teamMembers]
INPUT[number(minValue(0)):budget]
INPUT[inlineListSuggester(option(低), option(中), option(高), option(极高)):riskLevel]
INPUT[textArea(placeholder(Main Project Risks)):mainRisks]
INPUT[multiSelect(option(Web开发), option(移动应用), option(数据分析), option(机器学习), option(UI设计), option(测试), option(部署)):projectTags]
```

#### 显示项目信息
- 项目名称：`VIEW[{projectTitle}]`
- 项目状态：`VIEW[{projectStatus}]`
- 完成进度：`VIEW[{projectProgress}]`%
- 团队成员：`VIEW[{teamMembers}]`
- 项目标签：`VIEW[{projectTags}]`

### 个人任务跟踪器

```meta-bind
INPUT[text(placeholder(Task Title)):taskTitle]
INPUT[inlineSelect(option(日常任务), option(工作任务), option(学习任务), option(个人事务)):taskType]
INPUT[inlineListSuggester(option(低), option(中), option(高), option(紧急)):taskPriority]
INPUT[number(minValue(0.5), maxValue(24), stepSize(0.5)):estimatedHours]
INPUT[number(minValue(0), stepSize(0.25)):actualHours]
INPUT[toggle:taskCompleted]
INPUT[slider(minValue(0), maxValue(100), stepSize(10)):taskCompletion]
INPUT[dateTime:completionTime]
INPUT[textArea(placeholder(Task reflection and improvements)):taskReflection]
```

#### 任务信息显示
- 任务标题：`VIEW[{taskTitle}]`
- 任务类型：`VIEW[{taskType}]`
- 优先级：`VIEW[{taskPriority}]`
- 预计用时：`VIEW[{estimatedHours}]` 小时
- 实际用时：`VIEW[{actualHours}]` 小时
- 完成状态：`VIEW[{taskCompleted}]`
- 完成度：`VIEW[{taskCompletion}]`%

### 学习笔记管理

```meta-bind
INPUT[text(placeholder(Course Name)):courseName]
INPUT[text(placeholder(Instructor)):instructor]
INPUT[inlineSelect(option(Coursera), option(edX), option(Udemy), option(YouTube), option(线下课程), option(其他)):platform]
INPUT[slider(minValue(0), maxValue(100), stepSize(5)):chapterProgress]
INPUT[inlineListSuggester(option(初学), option(理解), option(熟练), option(精通)):masteryLevel]
INPUT[slider(minValue(1), maxValue(5), stepSize(1)):difficulty]
INPUT[number(minValue(0), stepSize(0.5)):studyHours]
INPUT[multiSelect(option(理论基础), option(实践应用), option(案例分析), option(项目实战)):keyConcepts]
INPUT[textArea(placeholder(Key Points)):keyPoints]
INPUT[textArea(placeholder(Questions)):questions]
INPUT[date:nextReview]
INPUT[number(minValue(0)):reviewCount]
INPUT[toggle:needsReview]
INPUT[textArea(placeholder(Review Focus)):reviewFocus]
```

#### 学习信息显示
- 课程名称：`VIEW[{courseName}]`
- 讲师：`VIEW[{instructor}]`
- 学习平台：`VIEW[{platform}]`
- 章节进度：`VIEW[{chapterProgress}]`%
- 掌握程度：`VIEW[{masteryLevel}]`
- 难度评价：`VIEW[{difficulty}]`⭐
- 学习时长：`VIEW[{studyHours}]` 小时
- 需要复习：`VIEW[{needsReview}]`

---

## 💡 高级功能应用场景

### 读书笔记评分系统
```meta-bind
INPUT[text(placeholder(Book Title)):bookTitle]
INPUT[text(placeholder(Author)):author]
INPUT[inlineSelect(option(小说), option(科技), option(历史), option(传记), option(自助), option(其他)):bookType]
INPUT[slider(minValue(1), maxValue(5), stepSize(0.5)):bookRating]
```

- 书名：`VIEW[{bookTitle}]`
- 作者：`VIEW[{author}]`
- 类型：`VIEW[{bookType}]`
- 评分：`VIEW[{bookRating}]`⭐
- 推荐指数：`VIEW[{bookRating} >= 4.5 ? "强烈推荐" : ({bookRating} >= 3.5 ? "推荐" : ({bookRating} >= 2.5 ? "一般" : "不推荐"))]`

### 习惯追踪器
```meta-bind
INPUT[text(placeholder(Habit Name)):habitName]
INPUT[number(minValue(1), maxValue(365)):targetDays]
INPUT[number(minValue(0)):currentStreak]
INPUT[toggle:todayCompleted]
```

- 习惯名称：`VIEW[{habitName}]`
- 目标天数：`VIEW[{targetDays}]`
- 已坚持：`VIEW[{currentStreak}]`天
- 完成率：`VIEW[{currentStreak}/{targetDays}*100]`%
- 今日完成：`VIEW[{todayCompleted}]`

### 电影观看记录
```meta-bind
INPUT[text(placeholder(Movie Title)):movieTitle]
INPUT[text(placeholder(Director)):director]
INPUT[multiSelect(option(动作), option(喜剧), option(剧情), option(科幻), option(恐怖), option(爱情), option(悬疑), option(动画)):movieGenre]
INPUT[date:watchDate]
INPUT[slider(minValue(1), maxValue(10), stepSize(0.5)):personalRating]
INPUT[textArea(placeholder(Share your thoughts)):movieReview]
```

- 电影名称：`VIEW[{movieTitle}]`
- 导演：`VIEW[{director}]`
- 类型：`VIEW[{movieGenre}]`
- 观看日期：`VIEW[{watchDate}]`
- 个人评分：`VIEW[{personalRating}]`/10

---

## 🎨 样式说明

为了更好的视觉效果，建议在CSS代码片段中添加以下样式：

```css
/* Meta Bind 自定义样式 */
.fancy-input input {
    border: 2px solid #007acc;
    border-radius: 8px;
    padding: 8px;
    font-size: 14px;
}

.custom-select select {
    border: 2px solid #28a745;
    border-radius: 6px;
    padding: 6px;
    background-color: #f8f9fa;
}

.important-toggle input[type="checkbox"] {
    transform: scale(1.2);
    accent-color: #dc3545;
}

/* 数字输入样式 */
.mb-input-wrapper.number-input > input {
    width: 80px;
    text-align: center;
}

/* 进度条样式 */
.mb-progress-bar {
    background: linear-gradient(90deg, #28a745 0%, #ffc107 50%, #dc3545 100%);
    border-radius: 10px;
    height: 20px;
}
```

## 📝 使用说明

1. **基础语法**：`INPUT[inputType:bindTarget]`
2. **参数语法**：`INPUT[inputType(arg1, arg2):bindTarget]`
3. **VIEW语法**：`VIEW[viewType:bindTarget]`
4. **按钮语法**：需要先定义代码块，然后用`BUTTON[id]`调用

## 🔧 高级技巧

### 数据绑定策略
- **本地绑定**：直接使用属性名（如 `title`）
- **跨文件绑定**：使用文件路径（如 `OtherNote#property`）
- **内存绑定**：使用 `memory^` 前缀
- **全局内存**：使用 `globalMemory^` 前缀

### 计算和表达式
- 使用 `VIEW[math:expression]` 进行数学计算
- 支持三元运算符：`condition ? valueIfTrue : valueIfFalse`
- 可以引用其他字段的值

这个演示文件展示了Meta Bind插件的完整功能，从基础的输入字段到高级的绑定和计算功能。通过这些示例，您可以创建功能强大、交互性强的笔记和表单。 